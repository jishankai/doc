(require 'package)
(package-initialize)
(add-to-list 'package-archives
              '("marmalade" . "http://marmalade-repo.org/packages/") t)
(package-initialize)

(when (not package-archive-contents)
  (package-refresh-contents))

;; Add in your own as you wish:
(defvar my-packages '(starter-kit starter-kit-lisp starter-kit-bindings)
  "A list of packages to ensure are installed at launch.")

(dolist (p my-packages)
  (when (not (package-installed-p p))
   (package-install p)))

(require 'auto-complete-config)
(add-to-list 'ac-dictionary-directories "~/.emacs.d/elpa/auto-complete-1.4/dict")
(ac-config-default)

(require 'ecb)

(set-language-environment "utf-8")

(require 'linum)
(setq linum-format "%3d ")
(add-hook 'find-file-hooks (lambda () (linum-mode 1)))

(set-cursor-color "white")
(set-mouse-color "blue")
(set-foreground-color "green")
(set-background-color "black")
(set-border-color "lightgreen")
(set-face-foreground 'highlight "red")
(set-face-background 'highlight "lightblue")
(set-face-foreground 'region "darkcyan")
(set-face-background 'region "lightblue")
(set-face-foreground 'secondary-selection "skyblue")
(set-face-background 'secondary-selection "darkblue")