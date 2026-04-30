;; Sets up exec-path-from shell
;; https://github.com/purcell/exec-path-from-shell
(when (eq system-type 'darwin)
  (exec-path-from-shell-initialize))

(when (string= system-type "darwin")       
  (setq dired-use-ls-dired nil))

(setenv "PATH" (concat (getenv "PATH") ":/usr/local/bin/:" (expand-file-name "~/.local/bin/")))
(setq exec-path (append exec-path (list "/usr/local/bin/" (expand-file-name "~/.local/bin/"))))
