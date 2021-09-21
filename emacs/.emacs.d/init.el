(require 'package)
(add-to-list 'package-archives
	     '("melpa" . "https://melpa.org/packages/") t)
(package-initialize)
(unless package-archive-contents
  (package-refresh-contents))

(unless (package-installed-p 'evil)
  (package-install 'evil))
(require 'evil)
(evil-mode 1)

(setq
 visible-bell t
 inhibit-startup-message t
 initial-scratch-message "")
(menu-bar-mode -1)
(tool-bar-mode -1)
(scroll-bar-mode -1)
(blink-cursor-mode 0)
(load-theme 'deeper-blue)
(when (member "Source Code Pro" (font-family-list))
  (set-frame-font "Source Code Pro-10" t t))

(setq custom-file (expand-file-name "custom.el" user-emacs-directory))
(load custom-file :noerror)

(setq
 backup-directory-alist `((".*" . ,(expand-file-name "backups" user-emacs-directory)))
 backup-by-copying t
 delete-old-versions t
 version-control t)

(global-set-key (kbd "M-o") 'mode-line-other-buffer)

(setq org-log-done 'time)
(global-set-key (kbd "C-c l") 'org-store-link)
(global-set-key (kbd "C-c a") 'org-agenda)
(global-set-key (kbd "C-c c") 'org-capture)
