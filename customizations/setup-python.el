(use-package elpy
  :ensure t
  :init
  (elpy-enable))


;; Use Python 3
(setq elpy-rpc-python-command "~/Documents/workspace/.envs/emacs-python-3/bin/python")

(setq python-shell-interpreter "python3")
