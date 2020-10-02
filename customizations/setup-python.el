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

(defvar my-black-fix-code-on-save nil
  "If true, code will be blackened on save")

(defun my-black-fix-code ()
  (when my-black-fix-code-on-save
      (elpy-black-fix-code)))

(add-hook 'before-save-hook 'my-black-fix-code)

(add-hook 'python-mode-hook (lambda ()
                              (flymake-mode -1)))
