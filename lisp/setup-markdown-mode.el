;; -*- coding: utf-8; mode: emacs-lisp -*-

(use-package markdown-mode
  :pin melpa-unstable
  :config
  (setq markdown-command "pandoc -s -f markdown_github -t html5")
  :mode
  (("\\.markdown\\|\\.md" . gfm-mode)))

(provide 'setup-markdown-mode)
