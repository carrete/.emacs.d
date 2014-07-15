;; -*- coding: utf-8; mode: emacs-lisp -*-

(use-package flycheck-popup-tip
  :config
  (eval-after-load 'flycheck 'flycheck-popup-tip-mode))

(provide 'setup-flycheck-popup-tip)
