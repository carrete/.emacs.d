;;; package --- Summary:
;;; Commentary:
;;; -*- coding: utf-8; mode: emacs-lisp; lexical-binding: t -*-

;;; Code:

(setq custom-file (expand-file-name "custom.el" user-emacs-directory))
(when (file-exists-p custom-file)
  (load custom-file))

(defvar bootstrap-version)
(let ((bootstrap-file
       (expand-file-name "straight/repos/straight.el/bootstrap.el" user-emacs-directory))
      (bootstrap-version 5))
  (unless (file-exists-p bootstrap-file)
    (with-current-buffer
        (url-retrieve-synchronously
         "https://raw.githubusercontent.com/raxod502/straight.el/develop/install.el"
         'silent 'inhibit-cookies)
      (goto-char (point-max))
      (eval-print-last-sexp)))
  (load bootstrap-file nil 'nomessage))

(straight-use-package 'use-package)
(setq straight-use-package-by-default t)
(setq straight-vc-git-default-protocol 'ssh)
(setq straight-vc-git-force-protocol t)

(let ((user-lisp-directory (expand-file-name "site-lisp" user-emacs-directory)))
  (add-to-list 'load-path user-lisp-directory)
  (mapc (lambda (name)
          (require (intern (file-name-sans-extension name))))
        (directory-files user-lisp-directory nil "\\.el$")))

(provide 'init)
;;; init.el ends here
