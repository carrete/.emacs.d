;; -*- coding: utf-8; mode: emacs-lisp -*-

(use-package ido-vertical-mode
  :init
  (setq ido-vertical-define-keys 'C-n-C-p-up-down-left-right)
  ;; :bind
  ;; (:map ido-completion-map ((kbd "<up>") . ido-prev-match))
  :config
  (ido-vertical-mode t))

(provide 'setup-ido-vertical-mode)
