;; -*- coding: utf-8; mode: emacs-lisp -*-

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   (quote
    ("c74e83f8aa4c78a121b52146eadb792c9facc5b1f02c917e3dbb454fca931223" default)))
 '(safe-local-variable-values
   (quote
    ((cider-preferred-build-tool quote clojure-cli)
     (cider-ns-refresh-before-fn . "devtools.core/shutdown!")
     (cider-ns-refresh-after-fn . "devtools.core/run!")
     (cider-default-cljs-repl quote shadow)
     (cider-clojure-cli-global-options . "-C:repl:test -R:repl:test")))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:family "TerminessTTF Nerd Font Mono" :height 140))))
 '(fixed-pitch ((t (:family "TerminessTTF Nerd Font Mono"))))
 '(font-lock-comment-face ((t (:slant normal)))))

(provide 'custom)
