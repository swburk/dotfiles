(require 'package)
(add-to-list 'package-archives
	     '("melpa" . "https://melpa.org/packages/") t)
(setq package-list
      '(dracula-theme))
(package-initialize)
(unless package-archive-contents
  (package-refresh-contents))
(dolist (package package-list)
  (unless (package-installed-p package)
    (package-install package)))

(setq-default
 visible-bell t
 inhibit-startup-message t
 initial-scratch-message ""
 custom-file (concat user-emacs-directory "/custom.el"))
(menu-bar-mode -1)
(tool-bar-mode -1)
(scroll-bar-mode -1)
(blink-cursor-mode 0)
(load-theme 'dracula t)
(when (member "Source Code Pro" (font-family-list))
  (set-frame-font "Source Code Pro-10" t t))
