;; -*- coding: utf-8; mode: emacs-lisp -*-

(use-package password-store)

(add-to-list 'load-path "/usr/local/share/emacs/site-lisp/mu/mu4e")

(require 'mu4e)

(setq message-kill-buffer-on-exit t)
(setq message-send-mail-function 'smtpmail-send-it)
(setq mu4e-attachment-dir "~/Downloads")
(setq mu4e-change-filenames-when-moving t)
(setq mu4e-completing-read-function 'ivy-completing-read)
(setq mu4e-compose-format-flowed t)
(setq mu4e-compose-in-new-frame nil)
(setq mu4e-compose-signature-auto-include nil)
(setq mu4e-confirm-quit nil)
(setq mu4e-get-mail-command "mbsync tvaughan@tocino.cl tom@clubcannabis.cl")
(setq mu4e-headers-date-format "%Y-%m-%d %H:%M")
(setq mu4e-headers-include-related t)
(setq mu4e-html2text-command "pandoc -f html -t markdown --columns 78")
(setq mu4e-view-prefer-html nil)
(setq mu4e-view-show-addresses t)
(setq smtpmail-stream-type 'starttls)
(setq user-full-name "Tom Vaughan")

(setq mu4e-contexts
      `( ,(make-mu4e-context
           :name "1 tvaughan@tocino.cl"
           :match-func (lambda (msg)
                         (when msg
                           (or (mu4e-message-maildir-matches msg "^/tvaughan@tocino.cl")
                               (mu4e-message-contact-field-matches msg :to "tvaughan@tocino.cl"))))
           :vars '((user-mail-address . "tvaughan@tocino.cl")
                   (mu4e-drafts-folder . "/tvaughan@tocino.cl/Drafts")
                   (mu4e-sent-folder . "/tvaughan@tocino.cl/Sent")
                   (mu4e-trash-folder . "/tvaughan@tocino.cl/Trash")
                   (smtpmail-auth-credentials . '(("smtp.soverin.net" 25 "tvaughan@tocino.cl" (password-store-get "tvaughan@tocino.cl"))))
                   (smtpmail-smtp-server . "smtp.soverin.net")))
         ,(make-mu4e-context
           :name "2 tom@clubcannabis.cl"
           :match-func (lambda (msg)
                         (when msg
                           (or (mu4e-message-maildir-matches msg "^/tom@clubcannabis.cl")
                               (mu4e-message-contact-field-matches msg :to "tom@clubcannabis.cl"))))
           :vars '((user-mail-address . "tom@clubcannabis.cl" )
                   (mu4e-drafts-folder . "/tom@clubcannabis.cl/Drafts")
                   (mu4e-sent-folder . "/tom@clubcannabis.cl/Sent")
                   (mu4e-trash-folder . "/tom@clubcannabis.cl/Trash")
                   (smtpmail-auth-credentials . '(("smtp.soverin.net" 25 "tom@clubcannabis.cl" (password-store-get "tom@clubcannabis.cl"))))
                   (smtpmail-smtp-server . "smtp.soverin.net")))))

(provide 'setup-mu4e)
