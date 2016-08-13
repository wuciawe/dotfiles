;;; Emacs is not a package manager, and here we load its package manager!
(require 'package)
(dolist (source '(("marmalade" . "https://marmalade-repo.org/packages/")
		  ("elpa" . "http://tromey.com/elpa/")
		  ;; TODO: Maybe, use this after emacs24 is released
		  ;; (development versions of packages)
		  ("melpa" . "http://melpa.milkbox.net/packages/")
		  ))
  (add-to-list 'package-archives source t))
(package-initialize)
