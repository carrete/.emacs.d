;; -*- coding: utf-8; mode: emacs-lisp -*-

(use-package anaconda-mode
  :init
  (add-hook 'python-mode-hook 'anaconda-mode))

(provide 'setup-anaconda-mode)
