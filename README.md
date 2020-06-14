Tips & Tricks
---

Use `C-u M-|` on region to replace with output of shell command.

(use-package evil
  :init
  (setq evil-toggle-key "C-`")
  :config
  (evil-mode t)
  (evil-define-command evil-quit (&optional force)
                       :repeat nil
                       (interactive "<!>")
                       (kill-buffer)))

Thanks to
---
https://github.com/technomancy/better-defaults
https://sites.google.com/site/steveyegge2/effective-emacs
