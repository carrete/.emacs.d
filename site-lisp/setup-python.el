;;; package --- Summary:
;;; Commentary:
;;; -*- coding: utf-8; mode: emacs-lisp; lexical-binding: t -*-

;;; Code:

(with-eval-after-load 'python
  (defun python-shell-completion-native-try ()
    "Return non-nil if can trigger native completion."
    (let ((python-shell-completion-native-enable t)
          (python-shell-completion-native-output-timeout
           python-shell-completion-native-try-output-timeout))
      (python-shell-completion-native-get-completions
       (get-buffer-process (current-buffer))
       nil "_"))))

(defun tvaughan/python-compile-buffer ()
  (interactive)
  (python-shell-send-buffer t))

(defun tvaughan/run-python-once-hook ()
  ;; https://emacs.stackexchange.com/a/10185
  (remove-hook 'python-mode-hook 'tvaughan/run-python-once-hook)
  (run-python))

(use-package python-pytest)

(use-package anaconda-mode
  :config
  (add-hook 'python-mode-hook 'anaconda-mode))

(use-package python
  :mode
  (("\\.py" . python-mode) ("\\.wsgi" . python-mode))
  :bind
  ;; https://github.com/jwiegley/use-package/issues/121#issuecomment-217563251
  (:map python-mode-map
        ("C-c C-c" . tvaughan/python-compile-buffer))
  :init
  (setq flycheck-python-flake8-executable "flake8")
  (setq flycheck-python-pycompile-executable "python3")
  (setq flycheck-python-pylint-executable "pylint-3")
  (setq python-shell-interpreter "python3")
  :config
  ;; (add-hook 'python-mode-hook #'tvaughan/run-python-once-hook)
  (define-auto-insert "\\.py" "python3.py"))

(provide 'setup-python)
