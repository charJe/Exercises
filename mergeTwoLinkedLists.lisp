(defstruct ListNode
  value
  next
  )

(defun mergeTwoLinkedLists (one two)
  (if (and (null one)
           (null two))
      nil
    (let* ((node (make-ListNode
                  :value 0
                  :next nil))
           (result node)
           (last (make-ListNode
                  :value 0
                  :next nil)))
      (loop while (and (not (null one))
                       (not (null two)))
            do
            (if (> (ListNode-value one) (ListNode-value two))
                (progn
                  (setf (ListNode-value node) (ListNode-value two))
                  (setf two (ListNode-next two)))
              (progn
                (setf (ListNode-value node) (ListNode-value one))
                (setf one (ListNode-next one))))
            (setf (ListNode-next node) (make-ListNode
                                        :value 0
                                        :next nil))
            (setf last node)
            (setf node (ListNode-next node)))
      ;; for one
      (loop while (not (null one))
            do
            (setf (ListNode-value node) (ListNode-value one))
            (setf (ListNode-next node) (make-ListNode
                                        :value 0
                                        :next nil))
            (setf last node
                  node (ListNode-next node)
                  one (ListNode-next one)))
      ;; for two
      (loop while (not (null two))
            do
            (setf (ListNode-value node) (ListNode-value two)
                  (ListNode-next node) (make-ListNode
                                        :value 0
                                        :next nil)
                  last node
                  node (ListNode-next node)
                  two (ListNode-next two)))
      (setf (ListNode-next last) nil)
      result)))
