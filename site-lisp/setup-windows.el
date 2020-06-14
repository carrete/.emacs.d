;;; package --- Summary:
;;; Commentary:
;;; -*- coding: utf-8; mode: emacs-lisp; lexical-binding: t -*-

;;; Code:

;; The current window must be at least 160 columns wide (split into two windows
;; of 80 column at a minimum), otherwise split horizontally.
(setq split-height-threshold nil)
(setq split-width-threshold 160)

(setq enable-debug-message t)

(defun debug-message (&rest args)
  (when enable-debug-message (apply 'message args)))

(defun enlarge-window-horizontally (columns)
  (enlarge-window columns t))

(defun shrink-window-horizontally (columns)
  (shrink-window columns t))

(defun set-window-width (columns)
  (interactive "nEnter new window width (in columns): ")
  (enlarge-window-horizontally (- columns (window-width)))
  (debug-message "New window width is: %d" (window-width)))

(defun enlarge-window-vertically (rows)
  (enlarge-window rows nil))

(defun shrink-window-vertically (rows)
  (shrink-window rows nil))

(defun set-window-height (rows)
  (interactive "nEnter new window height (in rows): ")
  (enlarge-window-vertically (- rows (window-height)))
  (debug-message "New window height is: %d" (window-height)))

(provide 'setup-windows)
