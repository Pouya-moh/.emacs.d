
;; package manager and related
(require 'package)
(setq package-enable-at-startup nil)
(setq package-archives '(("gnu" . "https://elpa.gnu.org/packages/")
                         ("melpa" . "https://melpa.org/packages/")))

(package-initialize)
;(unless package--initialized (package-initialize t))

;; (thanks to https://github.com/daedreth)
;; Bootstrapping use-package 
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

;; custom stuff. Moved them befor the rest of config so to solve the problem of themeing
(setq custom-file "~/.emacs.d/custom.el")
(load custom-file)


;;; This is the actual config file. It is omitted if it doesn't exist so emacs won't refuse to launch.
(when (file-readable-p "~/.emacs.d/config.org")
  (org-babel-load-file (expand-file-name "~/.emacs.d/config.org")))

