(setq initial-frame-alist
      `((left . 418) (top . 0)
        (width . 140) (height . 45)))

(setq inhibit-startup-screen t)
(setq initial-scratch-message nil)
(setq make-backup-files nil)
(setq require-final-newline t)

;;
;; -- Colors and fonts
;;
(setq font-lock-maximum-decoration t)
(set-background-color "#232323")
(set-foreground-color "#cdcdcd")
(set-face-background 'modeline "#343434")
(set-face-foreground 'modeline "#abab23")
(set-cursor-color "#782323")

;; Selection
(set-face-background 'region "#2323cd")

;; List of available faces: http://www.gnu.org/software/emacs/elisp/html_node/Faces-for-Font-Lock.html
(custom-set-faces
  ;; custom-set-faces was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 '(font-lock-comment-face ((t (:foreground "#656565"))))
 '(font-lock-constant-face ((t (:foreground "#66bbff"))))
 '(font-lock-keyword-face ((t (:foreground "#ff8844"))))
 '(font-lock-string-face ((t (:foreground "#bbff77"))))
 '(font-lock-type-face ((t (:foreground "#ffdd77"))))
 '(font-lock-variable-name-face ((t (:foreground "#ff6622")))))



;; cedet
;; See cedet/common/cedet.info for configuration details.
(load-file "~/.emacs.d/plugins/cedet/common/cedet.el")
; Enable EDE (Project Management) features
(global-ede-mode 1)
;; * This enables the database and idle reparse engines
;(semantic-load-enable-minimum-features)
;(setq semantic-load-turn-everything-on t)


;; ecb
;; (add-to-list 'load-path "~/.emacs.d/plugins/ecb")
;; (require 'ecb)
;; (setq ecb-tip-of-the-day nil)
;; (setq ecb-primary-secondary-mouse-buttons (quote mouse-1--mouse-2))
;; (ecb-activate)

(require 'ido)
(ido-mode t)


;; ruby-mode
(add-to-list 'load-path "~/.emacs.d/plugins/ruby-mode")
(require 'ruby-electric)
(add-hook 'ruby-mode-hook 'turn-on-font-lock)

;; (add-to-list 'auto-mode-alist '("\\.rjs$" . ruby-mode))

;; ruby-block
(add-to-list 'load-path "~/.emacs.d/plugins/ruby-block")
(require 'ruby-block)

(add-to-list 'load-path "~/.emacs.d/plugins/rhtml")
(require 'rhtml-mode)

(add-to-list 'load-path "~/.emacs.d/plugins/rinari")
(require 'rinari)
(setq rinari-tags-file-name "TAGS")

;; yasnippet
(add-to-list 'load-path "~/.emacs.d/plugins/yasnippet")
(require 'yasnippet)
(yas/initialize)
(yas/load-directory "~/.emacs.d/plugins/yasnippet/snippets")
;; (load "~/.emacs.d/plugins/yasnippets-rails/setup.el")


;; yaml
(add-to-list 'load-path "~/.emacs.d/plugins/yaml-mode")
(require 'yaml-mode)
(add-to-list 'auto-mode-alist '("\\.yml$" . yaml-mode))


(add-to-list 'load-path "~/.emacs.d/plugins/haml")
(require 'haml-mode)
(require 'sass-mode)


;; ruby-mode-hook
(add-hook 'ruby-mode-hook
         (lambda()
           (add-hook 'write-file-functions
                      '(lambda()
                         (save-excursion
                           (untabify (point-min) (point-max))
                           (delete-trailing-whitespace)
                           )))
           (set (make-local-variable 'indent-tabs-mode) 'nil)
           (set (make-local-variable 'tab-width) 2)
           (imenu-add-to-menubar "IMENU")
           (ruby-electric-mode t)
           (ruby-block-mode t)
           (local-set-key "\M-\C-i" 'ri-ruby-complete-symbol)
           (define-key ruby-mode-map "\M-\C-o" 'rct-complete-symbol)
           (local-set-key (kbd "<return>") 'newline-and-indent)
))


(add-hook 'rhtml-mode-hook
         (lambda()
           (add-hook 'write-file-functions
                      '(lambda()
                         (save-excursion
                           (untabify (point-min) (point-max))
                           (delete-trailing-whitespace)
                           )))
           (set (make-local-variable 'indent-tabs-mode) 'nil)
           (set (make-local-variable 'tab-width) 2)
           (ruby-electric-mode t)
           (ruby-block-mode t)
           (local-set-key (kbd "<return>") 'newline-and-indent)
))

;; -- Custom functions --

(defun close-all-buffers ()
  (interactive)
  (mapc 'kill-buffer (buffer-list)))

(global-set-key "\C-cx" 'close-all-buffers)
(global-set-key "\C-c/" 'comment-region)


(custom-set-variables
  ;; custom-set-variables was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 '(ecb-layout-name "left6")
 '(ecb-layout-window-sizes (quote (("left6" (ecb-sources-buffer-name 0.13 . 0.4) (ecb-methods-buffer-name 0.13 . 0.378) (ecb-history-buffer-name 0.13 . 0.2)))))
 '(ecb-methods-menu-sorter (lambda (entries) (let ((sorted (copy-list entries))) (sort sorted (quote <)))))
 '(ecb-options-version "2.40")
 '(ispell-program-name "/usr/local/bin/ispell")
 '(truncate-lines t))

