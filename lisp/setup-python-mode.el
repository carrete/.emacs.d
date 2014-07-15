;; -*- coding: utf-8; mode: emacs-lisp -*-

(with-eval-after-load 'python
  (defun python-shell-completion-native-try ()
    "Return non-nil if can trigger native completion."
    (let ((python-shell-completion-native-enable t)
          (python-shell-completion-native-output-timeout
           python-shell-completion-native-try-output-timeout))
      (python-shell-completion-native-get-completions
       (get-buffer-process (current-buffer))
       nil "_"))))

(use-package anaconda-mode
  :init
  (add-hook 'python-mode-hook 'anaconda-mode))

(use-package python
  :mode
  (("\\.py" . python-mode) ("\\.wsgi" . python-mode))
  :preface
  (defun tvaughan/python-compile-buffer ()
    (interactive)
    (python-shell-send-buffer t))
  (defun tvaughan/run-python-once-hook ()
    ;; https://emacs.stackexchange.com/a/10185
    (remove-hook 'python-mode-hook 'tvaughan/run-python-once-hook)
    (run-python))
  (defun tvaughan/python-mode-hook ()
    (set-fill-column 110))
  :bind
  ;; https://github.com/jwiegley/use-package/issues/121#issuecomment-217563251
  (:map python-mode-map ("C-c C-c" . tvaughan/python-compile-buffer))
  :init
  (add-hook 'python-mode-hook 'tvaughan/python-mode-hook)
  (add-hook 'python-mode-hook 'tvaughan/run-python-once-hook)
  (define-auto-insert "\\.py" "python3.py")
  (setq python-shell-interpreter "python3"))

(provide 'setup-python-mode)
