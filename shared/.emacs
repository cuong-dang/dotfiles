;; Packages
;; https://melpa.org/#/getting-started
;; (require 'package)
;; (add-to-list 'package-archives
;;              '("melpa" . "https://melpa.org/packages/") t)
;; (package-initialize)

;; Global
;; appearance
(menu-bar-mode -1)
(scroll-bar-mode -1)
(tool-bar-mode -1)
(setq-default inhibit-startup-screen t)
(global-display-line-numbers-mode)
(setq-default display-line-numbers-type 'relative)
;; auto-complete
;; (global-company-mode)
;; (setq-default company-idle-delay 0)
;; (setq-default company-minimum-prefix-length 1)
;; misc
(global-auto-revert-mode)            ;; keep buffers up to date
(setq-default auto-save-default nil) ;; disable auto-save
(setq-default make-backup-files nil) ;; disable backup files
(setq-default bookmark-save-flag 1)  ;; always save bookmarks
(setq-default case-fold-search nil)  ;; ignore case search
(setq-default indent-tabs-mode nil)  ;; disable tabs
(setq-default vc-follow-symlinks t)  ;; follow symlinks
(setq-default user-mail-address "cuongd@pm.me")

;; Hooks
(defun add-to-hooks (hooks functions)
  (mapcar (lambda (h)
            (mapcar (lambda (f) (add-hook h f))
                    functions))
          hooks))
;; prog
(add-to-hooks '(prog-mode-hook)
              '(display-fill-column-indicator-mode
                (lambda () (set-fill-column 80))))
;; text
(add-to-hooks '(text-mode-hook latex-mode-hook)
              '(auto-fill-mode
                flyspell-mode
                (lambda () (set-fill-column 72))))
;; all
(add-to-hooks '(before-save-hook)
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

;; Git
(add-to-list 'auto-mode-alist '("COMMIT_EDITMSG" . text-mode))
(add-to-list 'auto-mode-alist '("README" . text-mode))

;; Scheme
;; (require 'xscheme)
;; (setq-default scheme-program-name "/usr/local/bin/mit-scheme")
;; (add-hook 'scheme-mode-hook (lambda () (setq tab-width 2)))

;; C/C++
;; (require 'eglot)
;; (add-to-list 'eglot-server-programs '((c++-mode c-mode) "clangd"))
;; (add-hook 'c-mode-hook 'eglot-ensure)
;; (add-hook 'c++-mode-hook 'eglot-ensure)
;; (global-set-key (kbd "C-c j") 'xref-find-definitions)
;; (global-set-key (kbd "C-c k") 'xref-find-references)
;; clang-format
;; (require 'clang-format)
;; (setq-default clang-format-fallback-style "llvm")
;; (add-hook 'before-save-hook
;;           (lambda ()
;;             (when (or (eq major-mode 'c-mode)
;;                       (eq major-mode 'c++-mode))
;;               (clang-format-buffer))))
