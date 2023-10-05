;; Packages
(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
(package-initialize)
(unless package-archive-contents (package-refresh-contents))
;; install tried-and-true packages
(dolist (package '(company
                   eglot
                   sicp
                   use-package))
  (unless (package-installed-p package)
    (package-install package)))
(require 'use-package)
(setq-default use-package-always-ensure t
              use-package-always-defer t)

;; Global
;; appearance
(menu-bar-mode -1)
(scroll-bar-mode -1)
(tool-bar-mode -1)
(setq-default inhibit-startup-screen t)
(global-display-line-numbers-mode)
(setq-default display-line-numbers-type 'relative)
;; auto-complete
(global-company-mode)
(setq-default company-idle-delay 0)
(setq-default company-minimum-prefix-length 1)
(electric-pair-mode 1)
;; misc
;; keep buffers up-to-date
(global-auto-revert-mode)
;; disable auto-save
(setq-default auto-save-default nil)
(setq-default bookmark-save-flag 1)
(setq-default case-fold-search nil)
;; disable tabs
(setq-default indent-tabs-mode nil)
(setq-default make-backup-files nil)
(setq-default user-mail-address "cuongd@pm.me")
(setq-default vc-follow-symlinks t)

;; Hooks
(defun add-hooks-functions (hooks functions)
  (mapcar (lambda (h) (mapcar (lambda (f) (add-hook h f)) functions)) hooks))
;; text & prog
(add-hooks-functions '(prog-mode-hook text-mode-hook)
                     '(column-number-mode
                       (lambda () (setq show-trailing-whitespace t))))
;; prog
(add-hooks-functions '(prog-mode-hook)
                     '(display-fill-column-indicator-mode
                       (lambda () (set-fill-column 80))))
;; text
(add-hooks-functions '(text-mode-hook latex-mode-hook)
                     '(auto-fill-mode
                       flyspell-mode
                       (lambda () (set-fill-column 72))))
;; all
(add-hooks-functions '(before-save-hook)
                     '(delete-trailing-whitespace
                       (lambda () (if (not indent-tabs-mode)
                                      (untabify (point-min) (point-max))))))

;; Key bindings
(global-set-key (kbd "C-x u") 'windmove-left)
(global-set-key (kbd "C-x i") 'windmove-down)
(global-set-key (kbd "C-x o") 'windmove-up)
(global-set-key (kbd "C-x p") 'windmove-right)
(global-set-key (kbd "M-%") 'replace-regexp)
(global-set-key (kbd "C-c /") 'comment-region)
(global-set-key (kbd "C-c ?") 'uncomment-region)

;; Scheme
(require 'xscheme)
(setq-default scheme-program-name "/usr/local/bin/mit-scheme")
(add-hook 'scheme-mode-hook (lambda () (setq tab-width 2)))

;; Auto-mode
(add-to-list 'auto-mode-alist '("COMMIT_EDITMSG" . text-mode))
(add-to-list 'auto-mode-alist '("README" . text-mode))

;; C/C++
(require 'eglot)
(add-to-list 'eglot-server-programs '((c++-mode c-mode) "clangd"))
(add-hook 'c-mode-hook 'eglot-ensure)
(add-hook 'c++-mode-hook 'eglot-ensure)
(global-set-key (kbd "C-c j") 'xref-find-definitions)
(global-set-key (kbd "C-c k") 'xref-find-references)
(require 'clang-format)
(setq-default clang-format-fallback-style "llvm")
(add-hook 'before-save-hook
          (lambda ()
            (when (eq major-mode 'c-mode) (clang-format-buffer))))

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages '(clang-format eglot sicp company)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
