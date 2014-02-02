(when (>= emacs-major-version 24)
  (require 'package)
  (package-initialize)
  (add-to-list 'package-archives '("melpa" . "http://melpa.milkbox.net/packages/") t)
  )

;; Emacs PDE
(add-to-list 'load-path "/home/skji/.emacs.d/pde")
(load "pde-load")

;; Autosave
(setq-default auto-save-default nil)

;; Backup
(setq-default make-backup-files nil)

;; Warning Bell
(setq visible-bell t)

;; Line Number
(column-number-mode t)
(setq mouse-yank-at-point t)

;; Yes(Y) No(N)s
(fset 'yes-or-no-p 'y-or-n-p)

;; Personal Information
(setq user-full-name "Shankai Ji")
(setq user-mail-address "ji.shankai@adways.net")

;; Time Setting
(display-time)
(display-time-mode 1)
(setq display-time-24hr-format t)
(setq display-time-day-and-date t)

;; UTF-8 Setting
(setq current-language-environment "UTF-8")
(setq default-input-method "en")
(setq locale-coding-system 'utf-8)
(set-keyboard-coding-system 'utf-8)
(set-selection-coding-system 'utf-8)
(prefer-coding-system 'utf-8)

;; Indent
(setq default-tab-width 2)

;; Query
(setq-default case-fold-search nil)
(setq-default case-replace nil)

;; Alias
(global-set-key "\C-xl" 'goto-line)
(global-set-key "\C-xg" 'rgrep)
(global-set-key [(f5)] 'undo)
(global-set-key [(f6)] "\C-xo")

;; Themes
(require 'color-theme)
(color-theme-initialize)
(setq color-theme-is-global t)
(require 'color-theme-solarized)
(load-theme 'solarized-dark t)

;; Fonts

;; Version Control

;; Auto Complete
(require 'yasnippet)
(yas-global-mode 1)

;; PHP
(define-key php-mode-map (kbd "C-c C-y") 'yas/create-php-snippet)
