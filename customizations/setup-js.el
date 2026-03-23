;; javascript / html
(use-package js
  :mode ("\\.js$" . js-mode)
  :hook (js-mode . subword-mode)
  :config
  (setq js-indent-level 2))

(use-package sgml-mode
  :hook (html-mode . subword-mode))

(use-package tagedit
  :ensure t
  :hook (html-mode . tagedit-mode)
  :config
  (tagedit-add-paredit-like-keybindings))
