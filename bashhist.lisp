(ql:quickload '(str arrows))
(use-package 'arrows)

(defun most-frequent (&optional (number 3))
  "Return an alist of the NUMBER most used bash commands."
  (-<>> "~/.bash_history"
    (uiop:read-file-string)
    (str:split (string #\newline))
    ;; get commands
    (map 'list
         (lambda (line)
           (let* ((words (str:split " " line))
                  (command (first words)))
             (when (string/= "" (str:trim command))
               (cond
                 ((string= "sudo" command)
                  (second words))
                 ((string= "\\" (subseq command 0 1))
                  (subseq command 1))
                 (:else command))))))
    (remove-if #'null)
    ;; count frequencies
    (reduce
     (lambda (frequencies command)
       (let ((pair (assoc command frequencies
                          :test #'string=)))
         (if pair
             (acons command (+ 1 (cdr pair)) frequencies)
             (acons command 1 frequencies))))
     <> :initial-value (list))
    (remove-duplicates <> :test #'string= :key #'car :from-end t)
    ;; get top NUMBER frequencies
    (reduce
     (lambda (most-frequent pair)
       (let ((frequency (cdr pair)))
         (if (or (some (lambda (pair)
                         (<= (cdr pair) frequency))
                       most-frequent)
                 (< (length most-frequent) number))
             (append (list pair)
                     (if (= number (length most-frequent))
                         (remove (reduce
                                  (lambda (min pair)
                                    (if (<= (cdr pair) (cdr min))
                                        pair
                                        min))
                                  most-frequent)
                                 most-frequent)
                         most-frequent))
             most-frequent)))
     <> :initial-value (list))
    (sort <> #'> :key #'cdr)))
