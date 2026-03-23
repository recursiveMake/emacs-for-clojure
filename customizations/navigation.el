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

;; ido-mode allows you to more easily navigate choices. For example,
;; when you want to switch buffers, ido presents you with a list
;; of buffers in the the mini-buffer. As you start to type a buffer's
;; name, ido will narrow down the list of buffers to match the text
;; you've typed in
;; http://www.emacswiki.org/emacs/InteractivelyDoThings
(use-package ido
  :config
  (setq ido-enable-flex-matching t
        ido-use-filename-at-point nil
        ido-auto-merge-work-directories-length -1
        ido-use-virtual-buffers t)
  :init
  (ido-mode t)
  (ido-everywhere 1))

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
