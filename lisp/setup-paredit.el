;; -*- coding: utf-8; mode: emacs-lisp -*-

(use-package paredit
  :config
  (autoload 'enable-paredit-mode "paredit"
    "Turn on pseudo-structural editing of Lisp code."
    t)
  (add-hook 'cider-repl-mode-hook 'paredit-mode)
  (add-hook 'clojure-mode-hook 'paredit-mode)
  (add-hook 'emacs-lisp-mode-hook 'enable-paredit-mode))

(provide 'setup-paredit)
