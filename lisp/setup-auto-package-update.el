;; -*- coding: utf-8; mode: emacs-lisp -*-

(use-package auto-package-update
  :init
  (setq auto-package-update-delete-old-versions t)
  (setq auto-package-update-interval 3)
  :config
  (auto-package-update-maybe))

(provide 'setup-auto-package-update)
