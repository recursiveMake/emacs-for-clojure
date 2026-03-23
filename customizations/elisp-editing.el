(use-package paredit
  :ensure t
  :hook ((emacs-lisp-mode . enable-paredit-mode)
         (eval-expression-minibuffer-setup . enable-paredit-mode)
         (ielm-mode . enable-paredit-mode)
         (lisp-mode . enable-paredit-mode)
         (lisp-interaction-mode . enable-paredit-mode)
         (scheme-mode . enable-paredit-mode)
         (clojure-mode . enable-paredit-mode)))

(use-package eldoc
  :hook ((emacs-lisp-mode . turn-on-eldoc-mode)
         (lisp-interaction-mode . turn-on-eldoc-mode)
         (ielm-mode . turn-on-eldoc-mode)))
