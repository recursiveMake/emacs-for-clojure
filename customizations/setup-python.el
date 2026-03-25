(use-package elpy
  :ensure t
  :init
  (elpy-enable)
  :config
  (progn
    (define-key elpy-mode-map (kbd "<M-right>") nil)
    (define-key elpy-mode-map (kbd "<M-left>") nil)
    (define-key elpy-mode-map (kbd "<S-right>") 'elpy-nav-indent-shift-right)
    (define-key elpy-mode-map (kbd "<S-left>") 'elpy-nav-indent-shift-left)))

(use-package flycheck
  :ensure t
  :init
  (global-flycheck-mode t))

(defvar my-black-fix-code-on-save nil
  "If true, code will be blackened on save")

(defun my-black-fix-code ()
  (when my-black-fix-code-on-save
      (elpy-black-fix-code)))

(add-hook 'before-save-hook 'my-black-fix-code)

(add-hook 'python-mode-hook (lambda ()
                              (flymake-mode -1)))
