(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)

(setq package-selected-packages
	  '(catppuccin-theme))

(setq ring-bell-function 'ignore
	  inhibit-startup-message t
	  initial-scratch-message "")
(menu-bar-mode -1)
(tool-bar-mode -1)
(scroll-bar-mode -1)
(blink-cursor-mode 0)
(global-display-line-numbers-mode 1)
load-theme 'catppuccin 'no-confirm)
(setq catppuccin-flavor 'latte)
(catppuccin-reload)
(when (member "JetBrains Mono" (font-family-list))
  (set-frame-font "JetBrains Mono-14" t t))

(setq custom-file (locate-user-emacs-file "custom.el"))
(load custom-file 'noerror 'nomessage)
