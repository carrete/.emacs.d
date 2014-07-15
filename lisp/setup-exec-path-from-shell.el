;; -*- coding: utf-8; mode: emacs-lisp -*-

(use-package exec-path-from-shell
  :init
  (setq exec-path-from-shell-variables '("PATH" "MANPATH" "DICTIONARY" "LC_COLLATE"))
  :config
  (exec-path-from-shell-initialize)
  (exec-path-from-shell-copy-env "SSH_AGENT_PID")
  (exec-path-from-shell-copy-env "SSH_AUTH_SOCK"))

(provide 'setup-exec-path-from-shell)
