;;; package --- Summary:
;;; Commentary:
;;; -*- coding: utf-8; mode: emacs-lisp; lexical-binding: t -*-

;;; Code:

(use-package flycheck
  :straight
  (flycheck :type git :host github :repo "flycheck/flycheck"
            :fork (:type git :host github :repo "carrete/flycheck"))
  :config
  (global-flycheck-mode t))

(defcustom nrepl-connect-host nil
  "Override auto-detected remote nrepl host name."
  :type 'string
  :group 'nrepl)

(defcustom nrepl-connect-port nil
  "Override auto-detected remote nrepl host port."
  :type 'integer
  :group 'nrepl)

;; TODO:
(defun tvaughan/nrepl-connect (nrepl-connect-fn host port &rest args)
  (apply nrepl-connect-fn
         "localhost" ;; (or (progn nrepl-connect-host) host)
         5309 ;; (or (progn nrepl-connect-port) port)
         args))

(defun tvaughan/clojure-mode-hook ()
  (require 'cider-eval-sexp-fu)
  (require 'clj-refactor)
  (clj-refactor-mode t)
  (yas-minor-mode t)
  (cljr-add-keybindings-with-prefix "C-c C-m")
  (require 'flycheck-clj-kondo))

(use-package cider
  :straight
  (cider :type git :host github :repo "clojure-emacs/cider"
         :fork (:type git :host github :repo "carrete/cider"))
  :requires
  (cider-eval-sexp-fu clj-refactor flycheck-clj-kondo)
  :init
  (setq cider-auto-select-test-report-buffer nil)
  (setq cider-enlighten-mode t)
  (setq cider-infer-remote-nrepl-ports nil)
  (setq cider-overlays-use-font-lock t)
  (setq cider-preferred-build-tool 'clojure-cli)
  (setq cider-repl-display-help-banner nil)
  (setq cider-repl-pop-to-buffer-on-connect 'display-only)
  (setq cider-repl-use-clojure-font-lock t)
  (setq cider-repl-use-pretty-printing t)
  (setq cider-repl-wrap-history t)
  (setq cider-save-file-on-load t)
  (setq cider-show-error-buffer nil)
  (setq cider-test-show-report-on-success t)
  (setq cider-use-overlays t)
  (setq nrepl-hide-special-buffers t)
  (setq nrepl-use-ssh-fallback-for-remote-hosts nil)
  :config
  (add-hook 'clojure-mode-hook #'tvaughan/clojure-mode-hook))

(advice-add 'nrepl-connect :around #'tvaughan/nrepl-connect)

(use-package cider-eval-sexp-fu)

(use-package clj-refactor)

(use-package flycheck-clj-kondo)

(use-package kaocha-runner
  :requires
  (cider)
  :bind
  (:map clojure-mode-map
        ("C-c t p" . kaocha-runner-run-test-at-point)
        ("C-c t t" . kaocha-runner-run-tests)
        ("C-c t a" . kaocha-runner-run-all-tests)
        ("C-c t w" . kaocha-runner-show-warnings)
        ("C-c t h" . kaocha-runner-hide-windows)))

(use-package sayid
  :requires
  (cider)
  :config
  (with-eval-after-load 'clojure-mode (sayid-setup-package)))

(use-package paredit
  :requires
  (cider)
  :config
  (autoload 'enable-paredit-mode "paredit"
    "Turn on pseudo-structural editing of Lisp code."
    t)
  (add-hook 'cider-repl-mode-hook 'enable-paredit-mode)
  (add-hook 'clojure-mode-hook 'enable-paredit-mode)
  (add-hook 'emacs-lisp-mode-hook 'enable-paredit-mode))

(provide 'setup-cider)
;; setup-cider.el ends here
