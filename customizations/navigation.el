;; These customizations make it easier for you to navigate files,
;; switch buffers, and choose options from the minibuffer.

;; "When several buffers visit identically-named files,
;; Emacs must give the buffers distinct names. The usual method
;; for making buffer names unique adds '<2>', '<3>', etc. to the end
;; of the buffer names (all but one of them).
;; The forward naming method includes part of the file's directory
;; name at the beginning of the buffer name
;; https://www.gnu.org/software/emacs/manual/html_node/emacs/Uniquify.html
(use-package uniquify
  :config
  (setq uniquify-buffer-name-style 'forward))

;; Turn on recent file mode so that you can more easily switch to
;; recently edited files when you first start emacs
(use-package recentf
  :config
  (setq recentf-save-file (concat user-emacs-directory ".recentf")
        recentf-max-menu-items 40)
  :init
  (recentf-mode 1))

;; Vertico: modern vertical minibuffer completion UI
(use-package vertico
  :ensure t
  :init
  (vertico-mode 1))

;; Orderless: space-separated component matching (replaces ido flex matching)
;; e.g. "ff clj" matches "find-file-clojure"
(use-package orderless
  :ensure t
  :config
  (setq completion-styles '(orderless basic)
        completion-category-defaults nil
        completion-category-overrides '((file (styles partial-completion)))))

;; Marginalia: adds annotations to completion candidates
;; (keybindings, docstrings, file sizes, etc.)
(use-package marginalia
  :ensure t
  :init
  (marginalia-mode 1))

;; Consult: enhanced navigation commands built on completing-read
(use-package consult
  :ensure t
  :bind (("C-x b" . consult-buffer)))

;; Enhances M-x with ranked command history (works with vertico)
(use-package amx
  :ensure t
  :init
  (amx-mode 1))

;; Shows a list of buffers
(global-set-key (kbd "C-x C-b") 'ibuffer)

;; projectile everywhere!
(use-package projectile
  :ensure t
  :init
  (projectile-mode +1)
  :bind-keymap
  ("s-p" . projectile-command-map)
  ("C-c p" . projectile-command-map))
