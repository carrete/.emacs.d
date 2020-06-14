;;; package --- Summary:
;;; Commentary:
;;; -*- coding: utf-8; mode: emacs-lisp; lexical-binding: t -*-

;;; Code:

(when (fboundp 'menu-bar-mode)
  (menu-bar-mode -1))
(when (fboundp 'scroll-bar-mode)
  (scroll-bar-mode -1))
(when (fboundp 'tool-bar-mode)
  (tool-bar-mode -1))

(setq initial-scratch-message nil)
(setq inhibit-startup-screen t)
(setq package-enable-at-startup nil)
(setq warning-minimum-level :error)

(provide 'early-init)
;;; early-init.el ends here
