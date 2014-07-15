;; -*- coding: utf-8; mode: emacs-lisp -*-

(use-package define-word
  :bind
  (("C-c d" . define-word-at-point)
   ("C-c D" . define-word)))

(provide 'setup-define-word)
