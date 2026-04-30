(use-package lsp-pyright
  :ensure t
  :hook (python-mode . (lambda ()
                         (require 'lsp-pyright)
                         (lsp-deferred)))
  :config
  ;; Resolve node and pyright-langserver via a login shell so NVM's PATH
  ;; is active, bypassing the #!/usr/bin/env node shebang that picks up
  ;; whatever stale system node Emacs inherited at launch.
  (let ((node (string-trim
               (shell-command-to-string "bash -lc 'which node 2>/dev/null'")))
        (langserver (string-trim
                     (shell-command-to-string "bash -lc 'which pyright-langserver 2>/dev/null'"))))
    (when (and (file-executable-p node) (file-executable-p langserver))
      (setq lsp-pyright-langserver-command (list node langserver "--stdio")))))

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
