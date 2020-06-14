;;; package --- Summary:
;;; Commentary:
;;; -*- coding: utf-8; mode: emacs-lisp; lexical-binding: t -*-

;;; Code:

(defun tvaughan/c-mode-common-hook ()
  "Add hook tvaughan/c-mode-common-hook to c-mode-common."
  (define-key c-mode-map [(ctrl tab)] 'complete-tag))

(use-package cc-mode
  :init
  (setq c-basic-offset 4)
  (setq c-default-style "linux")
  :bind
  (:map c-mode-map
        ("C-TAB" . complete-tag)))

(use-package clang-format+
  :hook (c-mode-common . clang-format+-mode))

(provide 'setup-c)
;;; setup-c.el ends here
