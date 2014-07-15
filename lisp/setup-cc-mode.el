;; -*- coding: utf-8; mode: emacs-lisp -*-

(use-package cc-mode
  :preface
  (defun tvaughan/c-mode-common-hook ()
    (c-set-style "linux")
    (setq c-basic-offset 4)
    (setq tab-width 4)
    (define-key c-mode-map [(ctrl tab)] 'complete-tag))
  :config
  (add-hook 'c-mode-common-hook 'tvaughan/c-mode-common-hook))

(provide 'setup-cc-mode)
