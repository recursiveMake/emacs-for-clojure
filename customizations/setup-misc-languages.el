(use-package nix-mode
  :ensure t
  :mode "\\.nix\\'")

(use-package dockerfile-mode
  :ensure t
  :mode ("Dockerfile\\'" "Dockerfile\\..*\\'"))

(use-package yaml-mode
  :ensure t
  :mode (("\\.yml\\'" . yaml-mode)
         ("\\.yaml\\'" . yaml-mode))
  :hook (yaml-mode . (lambda () (setq tab-width 2))))
