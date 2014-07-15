;; -*- coding: utf-8; mode: emacs-lisp -*-

(use-package undo-tree
  :pin gnu
  :bind
  (("C-z" . undo-tree-undo)
   ("C-c z" . undo-tree-visualize))
  :config
  (global-undo-tree-mode t))

(provide 'setup-undo-tree)
