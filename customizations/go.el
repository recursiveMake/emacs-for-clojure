;; Ensure GOPATH is imported from shell environment
(when (memq window-system '(mac ns))
  (exec-path-from-shell-copy-env "GOPATH"))

(defun my-go-mode-setup ()
  ;; Use goimports instead of gofmt
  (setq gofmt-command "goimports")
  ;; Format on save (buffer-local)
  (add-hook 'before-save-hook #'gofmt-before-save nil t)
  ;; Set a sensible default compile command
  (when (not (string-match "go" compile-command))
    (set (make-local-variable 'compile-command)
         "go build -v && go test -v && go vet"))
  ;; Activate LSP
  (lsp-deferred))

(use-package go-mode
  :ensure t
  :hook (go-mode . my-go-mode-setup))
