;; Base settings
(use-package emacs
  :ensure nil
  :config
  (menu-bar-mode -1)
  (tool-bar-mode -1)
  (scroll-bar-mode -1)
  (global-display-line-numbers-mode 1)
  (electric-pair-mode t)
  (set-frame-font "FiraCode Medium 17" nil t))

;; Repos
(use-package package
  :custom
  (package-user-dir "~/.emacs.d/elpa")
  (package-archives
	  '(("melpa" . "https://melpa.org/packages/")
	    ("elpa" . "https://elpa.gnu.org/packages/"))))

;; Colorschemes
(use-package doom-themes
  :ensure t
  :custom
  (doom-themes-enable-bold t
  doom-themes-enable-italic nil)
  :init (load-theme 'doom-gruvbox t))

;; Line
(use-package doom-modeline
  :ensure t
  :init (doom-modeline-mode 1)
  :custom ((doom-modeline-height 15)))

;; Icons
(use-package all-the-icons
  :ensure t) 

;; Org-mode
(use-package org
  :custom
  (org-todo-keywords
   '((sequence "TODO(t)" "|" "DONE(d)")
     (sequence  "BUG(b)" "KNOWNCAUSE(k)" "|" "FIXED(f)")
     (sequence "|" "CANCELED(c)"" NOOPTIONS(n)")))
  :custom-face
  (org-level-1 ((t (:inherit outline-1 :height 1.25))))
  (org-level-2 ((t (:inherit outline-2 :height 1.2))))
  (org-level-3 ((t (:inherit outline-3 :height 1.1))))
  :bind ("C-c a". org-agenda))

(use-package org-bullets
  :ensure t
  :hook (org-mode . org-bullets-mode)
  :custom
  (org-bullets-bullet-list '("◉" "○" "●" "○" "●" "○" "●")))

(use-package org
  :defer t
  :custom
  (org-log-done t)
  (org-agenda-files (list "~/Templates/emacs/emacs_tasks.org"
			  "~/Templates/school/school.org"
			  "~/Templates/programming/codding.org")))

;; Viewing images from links
(use-package uimage
  :ensure t
  :diminish
  :custom 
  (org-startup-with-inline-images t)
  :hook
  (org-mode . uimage-mode))

;; Welcome screen
 (use-package dashboard
  :ensure t
  :custom
  (dashboard-startup-banner (concat user-emacs-directory "themes/emacs.txt"))
;;  (dashboard-startup-banner 'logo)
  (dashboard-banner-logo-title "Welcome to Emacs Adventurer")
  (initial-buffer-choice (lambda () (get-buffer-create dashboard-buffer-name)))
  (dashboard-center-content t)
  (dashboard-show-shortcuts nil)
  (dashboard-vertically-center-content t)  
  :config
  (dashboard-setup-startup-hook))
  (put 'upcase-region 'disabled nil)
  (put 'downcase-region 'disabled nil) 

;; Company
(use-package company
  :ensure t
  :after lsp-mode
  :config
  (add-to-list 'company-backends 'company-capf)
  (global-company-mode 1)
  :hook
  (lsp-mode . company-mode)
  (org-mode . company-mode))

(use-package company-box
  :ensure t
  :diminish company-box-mode
  :hook (company-mode . company-box-mode)
  :init
  (setq company-box-icons-alist  'company-box-icons-all-the-icons))

;; Evil
(use-package evil
  :ensure t
  :diminish
  :bind
  ("<escape>" . keyboard-escape-quit)
  :custom
  (evil-want-keybinding nil)
  (evil-undo-system 'undo-fu)
  :config
  (evil-mode 1))

(use-package evil-collection
  :ensure t
  :diminish (evil-collection-unimpaired-mode . "")
  :custom
  (evil-want-integration t)
  :init
  (evil-collection-init))

;; Disable custom-set-variables
(use-package cus-edit
  :custom
  (custom-file null-device "Don't store customizations"))

;; Cc mode
(use-package cc-mode
  :ensure t)

;; Lsp
(use-package lsp-mode
  :ensure t
  :custom
  (lsp-headerline-breadcrumb-icons-enable nil)
  :hook
  ((c-mode . lsp)
   (lsp-mode . lsp-enable-which-key-integration))
  :commands lsp)

(use-package which-key
  :ensure t
  :config
  (which-key-mode))

;; Tab bar
(use-package vim-tab-bar
  :ensure t
  :config
  (vim-tab-bar-mode t))

;; Treesitter
(use-package tree-sitter
  :ensure t)

(use-package tree-sitter-langs
  :ensure t
  :hook
  (c-mode . tree-sitter-hl-mode))

;; Rainbow
(use-package rainbow-mode
  :ensure t
  :custom
  (rainbow-ansi-colors t)
  (rainbow-html-colors t)
  (rainbow-latex-colors t)
  (rainbow-r-colors t)
  (rainbow-x-colors t)
  :hook (prog-mode helpful-mode org-mode text-mode))
