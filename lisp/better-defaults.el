;; -*- coding: utf-8; mode: emacs-lisp -*-

(when (fboundp 'menu-bar-mode)
  (menu-bar-mode -1))
(when (fboundp 'scroll-bar-mode)
  (scroll-bar-mode -1))
(when (fboundp 'tool-bar-mode)
  (tool-bar-mode -1))

(when (fboundp 'global-font-lock-mode)
  (global-font-lock-mode t)
  (setq font-lock-maximum-decoration t))

(auto-insert-mode t)
(cua-mode t)
(fringe-mode '(2 . 4))

(defun tvaughan/kill-this-buffer ()
  "Kill this buffer."
  (interactive)
  (kill-buffer (current-buffer)))

(defun tvaughan/open-temp-buffer ()
  "Open a temp buffer for transient work."
  (interactive)
  (find-file (make-temp-file "emacs")))

(defun tvaughan/previous-window ()
  "Corollary to 'other-window'."
  (interactive)
  (other-window -1))

(defun tvaughan/untabify ()
  "Preserve initial tab when 'makefile-mode."
  (interactive)
  (save-excursion
    (if (derived-mode-p 'makefile-mode)
      (progn
        (goto-char (point-min))
        (while (not (eobp))
          (skip-chars-forward "\t")
          (untabify (point) (line-end-position))
          (forward-line 1)))
      (untabify (point-min) (point-max)))))

(setq-default fill-column 78)
(setq-default indent-tabs-mode nil)

(setq auto-insert-directory (expand-file-name "templates" user-emacs-directory))
(setq auto-insert-query nil)
(setq auto-revert-verbose nil)
(setq backup-directory (expand-file-name "backups" user-emacs-directory))
(setq backup-directory-alist `(("." . ,backup-directory)))
(setq case-fold-search nil)
(setq column-number-mode t)
(setq compilation-scroll-output t)
(setq create-lockfiles nil)
(setq default-directory (getenv "HOME"))
(setq delete-by-moving-to-trash t)
(setq diff-switches "-u")
(setq dired-listing-switches "-AFl --group-directories-first --time-style=long-iso")
(setq enable-remote-dir-locals t)
(setq erc-fill-prefix "      + ")
(setq erc-hide-list '("JOIN" "PART" "QUIT"))
(setq erc-insert-timestamp-function 'erc-insert-timestamp-left)
(setq erc-timestamp-format "[%H:%M] ")
(setq ibuffer-default-sorting-mode 'alphabetic)
(setq ibuffer-expert t)
(setq inhibit-startup-screen t)
(setq initial-buffer-choice '(lambda () (ibuffer nil "*Buffer List*") (get-buffer "*Buffer List*")))
(setq initial-scratch-message nil)
(setq ispell-dictionary "en_US")
(setq ispell-hunspell-dictionary-alist '(("en_US" "[[:alpha:]]" "[^[:alpha:]]" "[']" t ("-d" "en_US") nil utf-8)))
(setq ispell-program-name "hunspell")
(setq ispell-really-hunspell t)
(setq require-final-newline t)
(setq ring-bell-function 'ignore)
(setq save-interprogram-paste-before-kill t)
(setq superword-mode t)
(setq tab-always-indent 'complete)
(setq tramp-default-method "ssh")
(setq transient-mark-mode t)
(setq uniquify-buffer-name-style 'post-forward)
(setq warning-minimum-level :error)
(setq wdired-allow-to-change-permissions t)

(global-set-key (kbd "C-x s") 'tvaughan/open-temp-buffer)

(global-set-key (kbd "C-x C-b") 'ibuffer)

(global-set-key (kbd "C-x k") 'tvaughan/kill-this-buffer)
(global-set-key (kbd "C-x w") 'delete-frame)

(global-set-key (kbd "C-s") 'isearch-forward-regexp)
(global-set-key (kbd "C-r") 'isearch-backward-regexp)
(global-set-key (kbd "C-M-s") 'isearch-forward)
(global-set-key (kbd "C-M-r") 'isearch-backward)

(global-set-key (kbd "C-x C-m") 'execute-extended-command)
(global-set-key (kbd "C-c C-m") 'execute-extended-command)

(global-set-key (kbd "C-w") 'backward-kill-word)
(global-set-key (kbd "C-x C-k") 'kill-region)
(global-set-key (kbd "C-c C-k") 'kill-region)

(global-set-key (kbd "C-x p") 'tvaughan/previous-window)
(global-set-key (kbd "C-x n") 'other-window)

(add-hook 'before-save-hook 'tvaughan/untabify)

(add-hook 'after-save-hook 'executable-make-buffer-file-executable-if-script-p)

(add-hook 'dired-load-hook
          '(lambda ()
             (load "dired-x")))

(add-hook 'ibuffer-mode-hook
          '(lambda ()
             (ibuffer-auto-mode t)))

(add-hook 'text-mode-hook 'turn-on-auto-fill)

(require 'ansi-color)
(defun colorize-compilation-buffer ()
  "Use ansi-color to colorize compilation buffer."
  (when (eq major-mode 'compilation-mode)
    (ansi-color-apply-on-region compilation-filter-start (point-max))))
(add-hook 'compilation-filter-hook 'colorize-compilation-buffer)

(provide 'better-defaults)
