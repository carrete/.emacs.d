;; -*- coding: utf-8; mode: emacs-lisp -*-

(use-package magit
  :bind
  (("C-c m" . magit-status))
  :config
  (setq magit-diff-refine-hunk t)
  (setq magit-repository-directories '(("~/Projects" . 3))))

(provide 'setup-magit)
