;; -*- coding: utf-8; mode: emacs-lisp -*-

(setq viper-mode t)
(require 'viper)

(defadvice viper-maybe-checkout (around viper-never-checkout (&args) activate)
  (setq ad-return-value nil))

(use-package viper
  :bind
  (("M-h" . backward-char)
   ("M-l" . forward-char)
   ("M-k" . previous-line)
   ("M-j" . next-line)))

(provide 'setup-viper)
