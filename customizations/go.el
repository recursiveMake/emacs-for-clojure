(defun set-exec-path-from-shell-PATHS ()
  (let (
        (path-from-shell (replace-regexp-in-string
                          "[ \t\n]*$"
                          ""
                          (shell-command-to-string "$SHELL --login -i -c 'echo $PATH'")))
        (go-path-from-shell (replace-regexp-in-string
                          "[ \t\n]*$"
                          ""
                          (shell-command-to-string "$SHELL --login -i -c 'echo $GOPATH'"))))
    (setenv "PATH" path-from-shell)
    (setenv "GOPATH" go-path-from-shell)
    (setq eshell-path-env path-from-shell) ; for eshell users
    (setq exec-path (split-string path-from-shell path-separator))))

(when window-system (set-exec-path-from-shell-PATHS))

(with-eval-after-load 'go-mode
  (require 'go-autocomplete))

(defun my-go-mode-hook ()
  ; Call Gofmt before save
  (add-hook 'before-save-hook 'gofmt-before-save)
  ; Enable autocomplete
  (auto-complete-mode 1)
  ; M-x compile = go build
  (if (not (string-match "go" compile-command))
      (set (make-local-variable 'compile-command)
           "go build -v && go test -v && go vet"))
  ; Godef jump key binding
  (local-set-key (kbd "M-.") 'godef-jump))

(add-hook 'go-mode-hook 'my-go-mode-hook)
