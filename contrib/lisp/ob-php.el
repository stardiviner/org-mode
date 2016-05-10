;;; ob-php.el --- Execute PHP within org-mode blocks.
;; Copyright 2016 stardiviner

;; Author: stardiviner <numbchild@gmail.com>
;; Maintainer: stardiviner <numbchild@gmail.com>
;; Keywords: org babel php
;; Version: 0.0.1
;; Package-Requires: ((org "8") (php-mode))

;;; Commentary:
;;
;; The file provides Org-Babel support for evaluating PHP code.

;;; ChangeLog:

;;; Code:
(require 'ob)

(defun org-babel-execute:php (body params)
  "Org-babel PHP hook."
  (let* ((cmd (mapconcat 'identity (list "php") " -r ")))
    (org-babel-eval cmd body)
    ))

(provide 'ob-php)

;;; ob-php.el ends here
