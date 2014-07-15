;; -*- coding: utf-8; mode: emacs-lisp -*-

(define-minor-mode pinned-buffer-mode
  "Pin the current buffer to the selected window."
  nil " P" nil
  (set-window-dedicated-p (selected-window) pinned-buffer-mode))

(global-set-key (kbd "C-c p") 'pinned-buffer-mode)

(provide 'setup-pinned-buffer-mode)
