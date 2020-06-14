;;; package --- Summary:
;;; Commentary:
;;; -*- coding: utf-8; mode: emacs-lisp; lexical-binding: t -*-

;;; Code:

(auto-insert-mode t)
(cua-mode t)
(delete-selection-mode t)
(fringe-mode '(1 . 2))

(when (fboundp 'global-font-lock-mode)
  (global-font-lock-mode t)
  (setq font-lock-maximum-decoration t))

(when (fboundp 'windmove-default-keybindings)
  (windmove-default-keybindings 'meta))

(setq-default fill-column 78)
(setq-default indent-tabs-mode nil)

(setq auto-insert-directory (expand-file-name "templates" user-emacs-directory))
;; (setq auto-insert-query nil)
;; (setq auto-revert-verbose nil)
(setq case-fold-search nil)
(setq column-number-mode t)
(setq compilation-scroll-output t)
(setq completion-styles '(flex substring partial-completion))
;; (setq create-lockfiles nil)
;; (setq default-directory (getenv "HOME"))
(setq delete-by-moving-to-trash t)
(setq diff-switches "-u")
(setq dired-listing-switches "-AFl --group-directories-first --time-style=long-iso")
(setq enable-remote-dir-locals t)
(setq erc-fill-prefix "      + ")
(setq erc-hide-list '("JOIN" "PART" "QUIT"))
(setq erc-insert-timestamp-function 'erc-insert-timestamp-left)
(setq erc-timestamp-format "[%H:%M] ")
(setq explicit-shell-file-name "bash")
;; (setq ibuffer-default-sorting-mode 'alphabetic)
(setq ibuffer-expert t)
(setq initial-buffer-choice #'(lambda () (ibuffer nil "*Buffer List*") (get-buffer "*Buffer List*")))
(setq ispell-dictionary "en_US")
(setq ispell-hunspell-dictionary-alist '(("en_US" "[[:alpha:]]" "[^[:alpha:]]" "[']" t ("-d" "en_US") nil utf-8)))
(setq ispell-program-name "hunspell")
(setq ispell-really-hunspell t)
(setq require-final-newline t)
(setq ring-bell-function 'ignore)
(setq save-interprogram-paste-before-kill t)
(setq superword-mode t)
(setq tab-always-indent 'complete)
(setq tab-width 4)
(setq tramp-default-method "ssh")
(setq transient-mark-mode t)
(setq uniquify-buffer-name-style 'post-forward)
(setq wdired-allow-to-change-permissions t)

(let ((backup-directory (expand-file-name "backups" user-emacs-directory)))
  (setq backup-directory-alist `(("." . ,backup-directory))))

(global-set-key (kbd "C-x C-b") 'ibuffer)

(global-set-key (kbd "C-s") 'isearch-forward-regexp)
(global-set-key (kbd "C-r") 'isearch-backward-regexp)
(global-set-key (kbd "C-M-s") 'isearch-forward)
(global-set-key (kbd "C-M-r") 'isearch-backward)

(global-set-key (kbd "C-x C-m") 'execute-extended-command)
(global-set-key (kbd "C-c C-m") 'execute-extended-command)

(global-set-key (kbd "C-w") 'backward-kill-word)
(global-set-key (kbd "C-x C-k") 'kill-region)
(global-set-key (kbd "C-c C-k") 'kill-region)

(provide 'better-defaults)
;;; better-defaults.el ends here
