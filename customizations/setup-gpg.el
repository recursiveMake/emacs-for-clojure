;; gpg

(require 'epa-file)
; (epa-file-enbale)

(setq auth-sources
      '((:source "~/.authinfo.gpg")))

(setq epa-pinentry-mode 'loopback)
