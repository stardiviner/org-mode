;;; ob-redis.el --- Execute Redis queries within org-mode blocks.
;; Copyright 2016 stardiviner

;; Author: stardiviner <numbchild@gmail.com>
;; Maintainer: stardiviner <numbchild@gmail.com>
;; Keywords: literate programming, reproducible research
;; URL: https://github.com/stardiviner/ob-redis
;; Version: 0.0.1
;; Package-Requires: ((org "8") (redis))

;;; Commentary:
;;
;; The file provides Org-Babel support for evaluating Lua code.

;;; Code:
(require 'ob)

(defcustom org-babel-redis:default-db "127.0.0.1:6379"
  "Default Redis database."
  :group 'org-babel
  :type 'string)

(defun org-babel-execute:redis (body params)
  "Org-babel Redis hook."
  (let* ((db (or (cdr (assoc :db params))
                 ob-redis:default-db))
         (cmd (mapconcat 'identity (list "redis-cli") " ")))
    (org-babel-eval cmd body)
    ))

(eval-after-load "org"
  '(add-to-list 'org-src-lang-modes '("redis" . redis)))

(provide 'ob-redis)

;;; ob-redis.el ends here
