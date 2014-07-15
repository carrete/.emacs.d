;; -*- coding: utf-8; mode: emacs-lisp -*-

(use-package telephone-line
  :pin melpa-unstable
  :init
  (setq telephone-line-primary-left-separator 'telephone-line-flat)
  (setq telephone-line-secondary-left-separator 'telephone-line-nil)
  (setq telephone-line-primary-right-separator 'telephone-line-flat)
  (setq telephone-line-secondary-left-separator 'telephone-line-nil)
  :config
  (telephone-line-mode t))

(provide 'setup-telephone-line)
