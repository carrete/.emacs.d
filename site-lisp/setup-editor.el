;;; package --- Summary:
;;; Commentary:
;;; -*- coding: utf-8; mode: emacs-lisp; lexical-binding: t -*-

;;; Code:

(defun tvaughan/sort-words (reverse beginning end)
  "Sort words (non-whitespace strings) in region, in REVERSE if negative, from BEGINNING to END."
  (interactive "*P\nr")
  (sort-regexp-fields reverse "\\(\\S-\\)+" "\\&" beginning end))

(defun tvaughan/open-temp-buffer ()
  "Open a temp buffer for transient work."
  (interactive)
  (find-file (make-temp-file "emacs")))

(global-set-key (kbd "C-x s") #'tvaughan/open-temp-buffer)

(defun tvaughan/kill-this-buffer ()
  "Kill this buffer."
  (interactive)
  (kill-buffer (current-buffer)))

(global-set-key (kbd "C-x k") #'tvaughan/kill-this-buffer)
(global-set-key (kbd "C-x w") #'delete-frame)

(defun tvaughan/previous-window ()
  "Corollary to 'other-window'."
  (interactive)
  (other-window -1))

(global-set-key (kbd "C-x p") #'tvaughan/previous-window)
(global-set-key (kbd "C-x n") #'other-window)

(with-eval-after-load 'dired (load "dired-x"))

(add-hook 'ibuffer-mode-hook
          #'(lambda ()
              (ibuffer-auto-mode t)))

(add-hook 'text-mode-hook 'turn-on-auto-fill)

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

(add-hook 'before-save-hook #'tvaughan/untabify)
(add-hook 'after-save-hook #'executable-make-buffer-file-executable-if-script-p)

;; http://emacs.stackexchange.com/questions/13970/fixing-double-capitals-as-i-type/13975#13975
(defun tvaughan/dcaps-to-scaps ()
  "Convert word in DOuble CApitals to Single Capitals."
  (interactive)
  (and (= ?w (char-syntax (char-before)))
       (save-excursion
         (and (if (called-interactively-p 'interactive)
                  (skip-syntax-backward "w")
                (= -3 (skip-syntax-backward "w")))
              (let (case-fold-search)
                (looking-at "\\b[[:upper:]]\\{2\\}[[:lower:]]"))
              (capitalize-word t)))))

(define-minor-mode dubcaps-mode
  "Toggle `dubcaps-mode'.  Converts words in DOuble CApitals to
Single Capitals as you type."
  :init-value nil
  :lighter (" DC")
  (if dubcaps-mode
      (add-hook 'post-self-insert-hook #'tvaughan/dcaps-to-scaps nil 'local)
    (remove-hook 'post-self-insert-hook #'tvaughan/dcaps-to-scaps 'local)))

(add-hook 'text-mode-hook #'dubcaps-mode)

(define-minor-mode pinned-buffer-mode
  "Pin the current buffer to the selected window."
  :init-value nil
  :lighter (" PB")
  (let (window (selected-window))
    (set-window-dedicated-p window pinned-buffer-mode)
    (set-window-parameter window 'no-delete-other-windows pinned-buffer-mode)))

(global-set-key (kbd "C-c p") 'pinned-buffer-mode)

(require 'ansi-color)

(defun tvaughan/colorize-compilation-buffer ()
  "Use ansi-color to colorize compilation buffer."
  (when (eq major-mode 'compilation-mode)
    (ansi-color-apply-on-region compilation-filter-start (point-max))))

(add-hook 'compilation-filter-hook #'tvaughan/colorize-compilation-buffer)

(use-package nord-theme
  :config
  (load-theme 'nord t))

(use-package telephone-line
  :init
  (setq telephone-line-primary-left-separator 'telephone-line-flat)
  (setq telephone-line-secondary-left-separator 'telephone-line-nil)
  (setq telephone-line-primary-right-separator 'telephone-line-flat)
  (setq telephone-line-secondary-right-separator 'telephone-line-nil)
  :config
  (telephone-line-mode t))

(use-package minions
  :config
  (minions-mode 1))

(use-package deadgrep
  :bind
  (("C-c s" . deadgrep)))

(use-package define-word
  :bind
  (("C-c d" . define-word-at-point)
   ("C-c D" . define-word)))

(use-package direnv
  :config
  (direnv-mode t))

(use-package docker-tramp
  :init
  (setq docker-tramp-use-names t))

(use-package exec-path-from-shell
  :config
  (exec-path-from-shell-initialize)
  (exec-path-from-shell-copy-envs '("CC" "CXX" "DICTIONARY" "LC_COLLATE" "SSH_AGENT_PID" "SSH_AUTH_SOCK")))

(use-package expand-region
  :bind
  ("C-=" . er/expand-region))

(defun tvaughan/maybe-enable-fci-mode ()
  "Enable fci-mode when buffer is not read-only."
  (unless buffer-read-only
    (fci-mode t)))

(use-package fill-column-indicator
  :config
  (define-globalized-minor-mode global-fci-mode fci-mode tvaughan/maybe-enable-fci-mode))

(use-package magit
  :bind
  (("C-c g" . magit-file-dispatch)
   ("C-c m" . magit-status))
  :init
  (setq magit-diff-refine-hunk t)
  (setq magit-repository-directories '(("~/Projects" . 3))))

(use-package forge)

(defun tvaughan/olivetti-mode-hook ()
  (fringe-mode '(1 . 1)))

(use-package olivetti
  :init
  (setq olivetti-body-width 80)
  (setq olivetti-lighter nil)
  :config
  (add-hook 'olivetti-mode-hook #'tvaughan/olivetti-mode-hook))

(use-package prescient)

(use-package projectile
  :bind
  (:map projectile-mode-map
        ("C-c p" . projectile-command-map))
  :init
  (setq projectile-project-search-path '("~/Projects/"))
  :config
  (projectile-mode t))

(use-package restclient)

(use-package undo-tree
  :bind
  (("C-z" . undo-tree-undo)
   ("C-c z" . undo-tree-visualize))
  :config
  (global-undo-tree-mode t))

(use-package whitespace-cleanup-mode
  :config
  (global-whitespace-cleanup-mode t))

(use-package viper
  :bind
  (("M-h" . backward-char)
   ("M-l" . forward-char)
   ("M-k" . previous-line)
   ("M-j" . next-line)))

(setq viper-mode t)
(require 'viper)

(defadvice viper-maybe-checkout (around viper-never-checkout (&args) activate)
  (setq ad-return-value nil))

;;;

(use-package ctrlf
  :init
  (ctrlf-mode t))

(use-package consult
  :config
  (add-hook 'consult-mode (lambda ()
                            (require 'consult-selectrum))))

(use-package consult-flycheck
  :requires
  (consult flycheck)
  :bind
  (:map flycheck-command-map
        ("!" . consult-flycheck)))

(defun tvaughan/parent-directory (path)
  "Return the parent directory of PATH."
  (or (file-name-directory (directory-file-name path)) ""))

(defun tvaughan/backward-delete-directory (arg)
  "Delete characters backward until encountering the end of a word.
With ARG, do this that many times."
  (interactive "p")
  (let ((contents (minibuffer-contents)))
    (delete-minibuffer-contents)
    (insert (tvaughan/parent-directory contents))))

(use-package selectrum
  :config
  (selectrum-mode t))

(define-key selectrum-minibuffer-map (kbd "DEL") #'tvaughan/backward-delete-directory)

(use-package selectrum-prescient
  :requires
  (selectrum prescient)
  :init
  (setq prescient-filter-method '(fuzzy literal regexp initialism))
  :config
  (prescient-persist-mode t)
  (selectrum-prescient-mode t))

(use-package marginalia
  :bind
  (:map minibuffer-local-map
        ("M-A" . marginalia-cycle))
  :init
  (marginalia-mode))

;;;

(use-package dockerfile-mode)

(use-package markdown-mode
  :mode
  (("\\.markdown\\|\\.md" . gfm-mode))
  :init
  (setq markdown-command "pandoc -s -f markdown_github -t html5"))

(use-package terraform-mode
  :init
  (setq terraform-indent-level 2))

(use-package typescript-mode)

(use-package web-mode
  :mode
  (("\\.html?" . web-mode))
  :init
  (setq web-mode-css-indent-offset 2)
  (setq web-mode-enable-current-column-highlight t)
  (setq web-mode-enable-current-element-highlight t)
  (setq web-mode-markup-indent-offset 2)
  :config
  (add-hook 'web-mode-hook #'turn-off-fci-mode))

(use-package yaml-mode
  :mode
  (("\\.ya?ml" . yaml-mode)))

(provide 'setup-editor)
;;; setup-editor.el ends here
