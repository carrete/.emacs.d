;; -*- coding: utf-8; mode: emacs-lisp -*-

(use-package olivetti
  :preface
  (defun tvaughan/olivetti-mode-hook ()
    (fringe-mode '(1 . 1)))
  :config
  (setq olivetti-body-width 110)
  (setq olivetti-lighter nil)
  :init
  (add-hook 'olivetti-mode-hook 'tvaughan/olivetti-mode-hook))

(provide 'setup-olivetti)
