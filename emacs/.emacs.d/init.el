(setq-default
 visible-bell t
 inhibit-startup-message t
 initial-scratch-message "")
(menu-bar-mode -1)
(tool-bar-mode -1)
(scroll-bar-mode -1)
(blink-cursor-mode 0)
(load-theme 'tango-dark)
(when (member "Source Code Pro" (font-family-list))
  (set-frame-font "Source Code Pro-10" t t))
