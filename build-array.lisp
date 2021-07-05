(require 'alexandria)
(import 'alexandria:curry)

(defvar tests (list
               (list 0 2 1 5 3 4)
               (list 5 0 1 2 3 4)))

(defun build-array (nums)
  (map 'vector (curry 'elt nums) nums))
