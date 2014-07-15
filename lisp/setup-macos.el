;; -*- coding: utf-8; mode: emacs-lisp -*-

(when (memq system-type '(darwin))
  (global-set-key [kp-delete] 'delete-char)
  (global-set-key [(hyper a)] 'mark-whole-buffer)
  (global-set-key [(hyper v)] 'yank)
  (global-set-key [(hyper c)] 'kill-ring-save)
  (global-set-key [(hyper s)] 'save-buffer)
  (global-set-key [(hyper l)] 'goto-line)
  (global-set-key [(hyper w)]
                  (lambda () (interactive) (delete-window)))
  (global-set-key [(hyper z)] 'undo)

  (setq dired-use-ls-dired nil)
  (setq mac-command-key-is-meta nil)
  (setq mac-command-modifier 'hyper)
  (setq mac-option-key-is-meta t)
  (setq mac-option-modifier 'meta)
  (setq mac-right-option-modifier 'none)
  (setq trash-directory "~/.Trash"))

(provide 'setup-macos)
