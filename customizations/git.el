(require 'magit)

(global-set-key (kbd "C-x g") 'magit-status)

(global-diff-hl-mode)

(defun mu-magit-kill-buffers ()
  "Restore window configuration and kill all Magit buffers."
  (interactive)
  (let ((buffers (magit-mode-get-buffers)))
    (magit-restore-window-configuration)
    (mapc #'kill-buffer buffers)))

(bind-key "q" #'mu-magit-kill-buffers magit-status-mode-map)

(add-to-list 'tramp-remote-path 'tramp-own-remote-path)
