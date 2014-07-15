;; -*- coding: utf-8; mode: emacs-lisp -*-

(defun sort-words (reverse beginning end)
  "Sort words (non-whitespace strings) in region, in REVERSE if negative."
  (interactive "*P\nr")
  (sort-regexp-fields reverse "\\(\\S-\\)+" "\\&" beginning end))

(provide 'setup-sort-words)
