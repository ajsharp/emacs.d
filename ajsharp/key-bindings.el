;; key-bindings.el
;;
;; Put all custom key bindings in this file
;; This file is loaded in init.el

(add-hook 'clojure-mode-hook 'yas/minor-mode-on)

(define-key emacs-lisp-mode-map (kbd "C-o") 'eval-defun)


;; ### global key bindings
(global-set-key (kbd "C-c e") 'copy-expression-to-buffer)
(global-set-key (kbd "C-c l") 'send-expression-in-buffer)
(global-set-key (kbd "C-x C-y") 'anything-show-kill-ring)
(global-set-key (kbd "C-l") 'goto-line)
(global-set-key (kbd "C-;") 'save-buffer)
(global-set-key (kbd "C-j") 'save-buffer)
(global-set-key (kbd "C-_") 'undo)
(global-set-key (kbd "M-SPC") 'anything)
(global-set-key (kbd "M-i") 'indent-buffer)
(global-set-key (kbd "M-u") 'other-window)
(global-set-key (kbd "M-t") 'eproject-anything)
(global-set-key (kbd "M-i") 'indent-buffer)
(global-set-key (kbd "M-DEL") 'backward-kill-word)
;; (global-set-key (kbd "C-w") 'backward-kill-word)
;; (global-set-key (kbd "C-x y") 'browse-kill-ring)
;; (global-set-key (kbd "C-u") 'other-window)

;; ### clojure bindings
(define-key clojure-mode-map (kbd "C-o") 'slime-eval-defun)
(define-key clojure-mode-map (kbd "C-j") 'save-buffer)
(define-key clojure-mode-map (kbd "M-SPC") 'anything)

;; ### ruby bindings
(define-key ruby-mode-map (kbd "C-j") 'save-buffer)
(define-key ruby-mode-map (kbd "C-;") 'save-buffer)
(define-key ruby-mode-map (kbd "M-q") 'ruby-indent-exp)

;; ### paredit bindings
(define-key paredit-mode-map (kbd "C-j") 'save-buffer)
(define-key paredit-mode-map (kbd "C-w") 'paredit-backward-kill-word)
(define-key paredit-mode-map (kbd "M-SPC") 'anything)
(define-key paredit-mode-map (kbd "M-DEL") 'kill-region)
;; (define-key paredit-mode-map (kbd "M-i") 'save-buffer)


