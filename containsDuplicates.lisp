;; for whatever reason this solution got stack overflow
(defun containsDuplicates (a &key (*track* (make-hash-table)))
  (cond
   ((not a) nil)
   ((gethash (car a) *track*) t)
   (t (progn
        (setf (gethash (car a) *track*) t)
        (containsDuplicates (cdr a) :*track* *track*)))))
;; and this one worked just fine
(defun containsDuplicates (a)
  (let ((*track* (make-hash-table))
        (lst (coerce a 'list)))
    (loop for n in lst
          do
          (if (gethash n *track*) 
              (return-from containsDuplicates t)
            (setf (gethash n *track*) t)))
    (return-from containsDuplicates nil)))
