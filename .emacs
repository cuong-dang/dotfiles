;; Package
(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
(package-initialize)
;; (package-refresh-contents)
(dolist (package '(company
                   sicp
                   use-package))
  (unless (package-installed-p package)
    (package-install package)))
;; (require 'use-package)
;; (setq use-package-always-defer t
;;       use-package-always-ensure t)

;; Global
;; auto-complete
(global-company-mode)
(setq-default company-idle-delay 0)
(setq-default company-minimum-prefix-length 1)
;; misc
(global-auto-revert-mode)
(setq-default auto-save-default nil)
(setq-default bookmark-save-flag 1)
(setq-default case-fold-search nil)
(setq-default indent-tabs-mode nil)
(setq-default inhibit-startup-message t)
(setq-default initial-scratch-message nil)
(setq-default make-backup-files nil)
(setq-default user-mail-address "cuongd@pm.me")

;; Hooks
(defun add-hooks-functions (hooks functions)
  (mapcar (lambda (hook)
            (mapcar (lambda (func) (add-hook hook func)) functions))
          hooks))
;; text & prog
(add-hooks-functions '(prog-mode-hook text-mode-hook)
                     '(column-number-mode
                       (lambda () (setq show-trailing-whitespace t))))
;; prog
(add-hooks-functions '(prog-mode-hook)
                     '(display-fill-column-indicator-mode
                       (lambda () (set-fill-column 80))
                       (lambda () (setq display-line-numbers 'relative))))
;; text
(add-hooks-functions '(text-mode-hook latex-mode-hook)
                     '(auto-fill-mode
                       flyspell-mode
                       (lambda () (set-fill-column 72))))
;; global
(add-hooks-functions '(before-save-hook)
                     '(delete-trailing-whitespace
                       (lambda () (if (not indent-tabs-mode)
                                      (untabify (point-min) (point-max))))))

;; Key binding
(global-set-key (kbd "C-x u") 'windmove-left)
(global-set-key (kbd "C-x i") 'windmove-down)
(global-set-key (kbd "C-x o") 'windmove-up)
(global-set-key (kbd "C-x p") 'windmove-right)
(global-set-key (kbd "M-%") 'replace-regexp)
(global-set-key (kbd "C-c /") 'comment-region)
(global-set-key (kbd "C-c .") 'uncomment-region)

;; Scheme
(require 'xscheme)
(setq-default scheme-program-name "/usr/local/bin/mit-scheme")
(add-hook 'scheme-mode-hook (lambda () (setq tab-width 2)))

;; Auto-mode
(add-to-list 'auto-mode-alist '("COMMIT_EDITMSG" . text-mode))
(add-to-list 'auto-mode-alist '("README" . text-mode))

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages '(sicp company)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
