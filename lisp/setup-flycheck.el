;; -*- coding: utf-8; mode: emacs-lisp -*-

(use-package flycheck
  :init
  (setq flycheck-python-pycompile-executable "python3")
  :config
  (global-flycheck-mode))

(provide 'setup-flycheck)
