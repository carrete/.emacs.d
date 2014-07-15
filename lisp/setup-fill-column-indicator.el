;; -*- coding: utf-8; mode: emacs-lisp -*-

(use-package fill-column-indicator
  :preface
  (defun tvaughan/maybe-enable-fci-mode ()
    (unless buffer-read-only
      (fci-mode t)))
  :config
  (define-globalized-minor-mode global-fci-mode fci-mode tvaughan/maybe-enable-fci-mode)
  (global-fci-mode t))

(provide 'setup-fill-column-indicator)
