;; -*- coding: utf-8; mode: emacs-lisp -*-

(setq package-enable-at-startup nil)
(setq package-archive-priorities
      '(("melpa-stable" . 42) ("melpa-unstable" . 1) ("gnu" . 10)))

(require 'package)
(add-to-list 'package-archives
             '("melpa-unstable" . "https://melpa.org/packages/"))
(add-to-list 'package-archives
             '("melpa-stable" . "https://stable.melpa.org/packages/"))
(package-initialize)

(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

(setq use-package-always-ensure t)
(setq use-package-always-pin "melpa-stable")

(eval-when-compile
  (require 'use-package))
(require 'bind-key)

(let ((user-lisp-directory (expand-file-name "lisp" user-emacs-directory)))
  (add-to-list 'load-path user-lisp-directory)
  (mapc (lambda (name)
          (require (intern (file-name-sans-extension name))))
        (directory-files user-lisp-directory nil "\\.el$")))

(setq custom-file (expand-file-name "custom.el" user-emacs-directory))
(load custom-file)
