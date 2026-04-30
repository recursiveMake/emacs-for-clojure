(use-package lsp-pyright
  :ensure t
  :hook (python-mode . (lambda ()
                         (require 'lsp-pyright)
                         (lsp-deferred))))

(use-package flycheck
  :ensure t
  :init
  (global-flycheck-mode t))

(use-package py-autopep8
  :ensure t)

(use-package python-pytest
  :ensure t
  :bind (:map python-mode-map
              ("C-c t" . python-pytest-dispatch)))

(add-hook 'python-mode-hook (lambda ()
                              (flymake-mode -1)))
