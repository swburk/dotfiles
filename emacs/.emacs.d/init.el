;; (require 'package)
;; (add-to-list 'package-archives
;; 	     '("melpa" . "https://melpa.org/packages/") t)
;; (setq package-list
;;       '())
;; (package-initialize)
;; (unless package-archive-contents
;;   (package-refresh-contents))
;; (dolist (package package-list)
;;   (unless (package-installed-p package)
;;     (package-install package)))

(setq
 visible-bell t
 inhibit-startup-message t
 initial-scratch-message ""
 backup-directory-alist `((".*" . ,(concat user-emacs-directory "backups")))
 backup-by-copying t
 delete-old-versions t
 version-control t)
(menu-bar-mode -1)
(tool-bar-mode -1)
(scroll-bar-mode -1)
(blink-cursor-mode 0)
(load-theme 'deeper-blue)
(when (member "Source Code Pro" (font-family-list))
  (set-frame-font "Source Code Pro-10" t t))
