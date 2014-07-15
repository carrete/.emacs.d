;; -*- coding: utf-8; mode: emacs-lisp -*-

(use-package sayid)

(use-package cider-eval-sexp-fu)

(use-package flycheck-clj-kondo)

(use-package kaocha-runner
  :bind
  (:map clojure-mode-map
        ("C-c t p" . kaocha-runner-run-test-at-point)
        ("C-c t t" . kaocha-runner-run-tests)
        ("C-c t a" . kaocha-runner-run-all-tests)
        ("C-c t w" . kaocha-runner-show-warnings)
        ("C-c t h" . kaocha-runner-hide-windows)))

(use-package cider
  :after
  (cider-eval-sexp-fu flycheck-clj-kondo kaocha-runner sayid)
  :preface
  (defun tvaughan/clojure-mode-hook ()
    (require 'cider-eval-sexp-fu)
    (require 'flycheck-clj-kondo)
    (sayid-setup-package)
    (set-fill-column 110))
  :init
  (setq cider-auto-select-error-buffer nil)
  (setq cider-auto-select-test-report-buffer nil)
  (setq cider-enlighten-mode t)
  (setq cider-infer-remote-nrepl-ports nil)
  (setq cider-overlays-use-font-lock t)
  (setq cider-preferred-build-tool 'clojure-cli)
  (setq cider-repl-pop-to-buffer-on-connect 'display-only)
  (setq cider-repl-use-clojure-font-lock t)
  (setq cider-repl-use-pretty-printing t)
  (setq cider-repl-wrap-history t)
  (setq cider-save-file-on-load t)
  (setq cider-test-show-report-on-success t)
  (setq cider-use-overlays t)
  (setq nrepl-hide-special-buffers t)
  (setq nrepl-use-ssh-fallback-for-remote-hosts nil)
  :config
  (add-hook 'clojure-mode-hook 'tvaughan/clojure-mode-hook))

(provide 'setup-cider)
