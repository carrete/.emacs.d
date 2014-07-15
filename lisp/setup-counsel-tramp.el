;; -*- coding: utf-8; mode: emacs-lisp -*-

(use-package docker-tramp
  :init
  (setq docker-tramp-use-names t))

(use-package vagrant-tramp
  :pin
  melpa-unstable)

(use-package counsel-tramp
  :after
  (docker-tramp counsel-tramp))

(provide 'setup-counsel-tramp)
