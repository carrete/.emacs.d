;; -*- coding: utf-8; mode: emacs-lisp -*-

(use-package web-mode
  :mode
  (("\\.html?" . web-mode))
  :preface
  (defun tvaughan/web-mode-hook ()
    (turn-off-fci-mode))
  :config
  (add-hook 'web-mode-hook 'tvaughan/web-mode-hook)
  (setq web-mode-css-indent-offset 2)
  (setq web-mode-enable-current-column-highlight t)
  (setq web-mode-enable-current-element-highlight t)
  (setq web-mode-markup-indent-offset 2))

(provide 'setup-web-mode)
