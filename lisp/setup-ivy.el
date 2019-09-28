;; -*- coding: utf-8; mode: emacs-lisp -*-

(use-package flx)

(use-package ivy
  :bind
  (:map ivy-minibuffer-map
        ("C-j" . ivy-immediate-done)
        ("RET" . ivy-alt-done))
  :init
  (setq ivy-extra-directories nil)
  (setq ivy-initial-inputs-alist nil)
  (setq ivy-re-builders-alist '((t . ivy--regex-fuzzy)))
  (setq ivy-use-virtual-buffers t)
  :config
  (ivy-mode t))

(use-package swiper
  :bind
  (("C-s" . swiper)))

(use-package counsel
  :bind
  (("C-x C-g" . counsel-rg)
   ("C-x C-f" . counsel-find-file)
   ("M-x" . counsel-M-x))
  :config
  (counsel-mode t))

(provide 'setup-ivy)
