(use-package elpy
  :ensure t
  :init
  (elpy-enable))

(use-package flycheck
  :ensure t
  :init
  (global-flycheck-mode t))

;; Use Python 3
(setq elpy-rpc-python-command "~/Documents/workspace/.envs/emacs-python-3/bin/python")

(setq python-shell-interpreter "python3")

(add-hook 'python-mode-hook (lambda ()
                              (flymake-mode -1)))
