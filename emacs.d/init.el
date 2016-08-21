;;; Emacs is not a package manager, and here we load its package manager!
(require 'package)
(dolist (source '(("marmalade" . "https://marmalade-repo.org/packages/")
          ("elpa" . "http://tromey.com/elpa/")
		  ;; TODO: Maybe, use this after emacs24 is released
		  ;; (development versions of packages)
		  ("melpa" . "http://melpa.milkbox.net/packages/")
          ("melpa-stable" . "http://stable.melpa.org/packages/")))
        (add-to-list 'package-archives source t))

(package-initialize)

(when (not package-archive-contents)
  (package-refresh-contents)
  (package-install 'use-package))
(require 'use-package)

;; Set your lisp system and, optionally, some contribs
(setq inferior-lisp-program "/usr/bin/sbcl")
(setq slime-contribs '(slime-fancy))

;; global variables
(setq
 inhibit-startup-screen t
 create-lockfiles nil
 make-backup-files nil
 column-number-mode t
 scroll-error-top-bottom t
 show-paren-delay 0.5
 use-package-always-ensure t
 sentence-end-double-space nil)

;; buffer local variables
(setq-default
 indent-tabs-mode nil
 tab-width 4
 c-basic-offset 4)

;; modes
(electric-indent-mode 0)


(use-package ensime
	     :pin melpa-stable)

(use-package scala-mode
  :interpreter
  ("scala" . scala-mode))

(load-theme 'dracula t)


