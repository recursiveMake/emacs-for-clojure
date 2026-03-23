(use-package magit
  :ensure t
  :bind ("C-x g" . magit-status)
  :config
  (defun mu-magit-kill-buffers ()
    "Restore window configuration and kill all Magit buffers."
    (interactive)
    (let ((buffers (magit-mode-get-buffers)))
      (magit-restore-window-configuration)
      (mapc #'kill-buffer buffers)))
  (bind-key "q" #'mu-magit-kill-buffers magit-status-mode-map))

(use-package diff-hl
  :ensure t
  :config
  (global-diff-hl-mode))
