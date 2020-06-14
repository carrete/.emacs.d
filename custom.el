;;; package --- Summary:
;;; Commentary:
;;; -*- coding: utf-8; mode: emacs-lisp; lexical-binding: t -*-

;;; Code:

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   '("e3b2bad7b781a968692759ad12cb6552bc39d7057762eefaf168dbe604ce3a4b" default))
 '(safe-local-variable-values
   '((cider-clojure-cli-parameters . "-A:koacha:user -M -m nrepl.cmdline --bind 0.0.0.0 --port 5309 --middleware '%s'")
     (cider-ns-refresh-after-fn . "devtools.core/run!")
     (cider-ns-refresh-before-fn . "devtools.core/shutdown!")
     (nrepl-connect-host . "localhost"))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:family "TerminessTTF Nerd Font Mono" :height 140))))
 '(fixed-pitch ((t (:family "TerminessTTF Nerd Font Mono"))))
 '(font-lock-comment-face ((t (:slant normal)))))

(provide 'custom)
