;; Sets up exec-path-from shell
;; https://github.com/purcell/exec-path-from-shell
(when (memq window-system '(mac ns))
  (exec-path-from-shell-initialize))

(when (string= system-type "darwin")       
  (setq dired-use-ls-dired nil))
