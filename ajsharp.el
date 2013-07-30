
;; ===== Package Management
(add-to-list 'package-archives '("marmalade" . "http://marmalade-repo.org/packages/") t)
(add-to-list 'package-archives '("melpa" . "http://melpa.milkbox.net/packages/") t)

;;(add-to-list 'load-path "~/.emacs.d/plugins/nav")
(add-to-list 'load-path "~/.emacs.d/ajsharp/anything")
;; (add-to-list 'load-path "~/.emacs.d/ajsharp/scala-mode")
;; (add-to-list 'load-path "~/.emacs.d/ajsharp/linum")
;; (add-to-list 'load-path "~/.emacs.d/ajsharp/linum+")

(setq site-lisp-dir
      (expand-file-name "site-lisp" user-emacs-directory))
(setq require-final-newline t)

(require 'color-theme)
(setq color-theme-is-global t)

(color-theme-initialize)
;; (color-theme-tomorrow-night)
;; (load-theme 'twilight t)
(color-theme-twilight)
;; (require 'linum)
;; (require 'linum+)
(require 'paredit)
(require 'clojure-mode)
(require 'yasnippet)
(require 'ruby-mode)
(require 'ruby-compilation)
(require 'rinari)
(require 'ido)
(ido-mode t)

(column-number-mode)

(eval-after-load "ruby-mode" '(require 'ruby-mode-indent-fix))
(require 'eproject)
(require 'eproject-extras)
(require 'autopair)
;; (require 'scala-mode)
(require 'smooth-scrolling)
;; (require 'centered-cursor-mode)
(require 'browse-kill-ring)

(global-rinari-mode)

(require 'auto-complete)
(auto-complete-mode)

;; ==== company mode
;; (require 'company-mode)
;; (autoload 'company-mode "company" nil t)
;; (push 'company-robe company-backends)

;; ===== ruby configuration
(require 'ruby-interpolation)
(require 'ruby-electric)
(require 'ruby-tools)

(add-hook 'ruby-mode-hook 'robe-mode)
(add-hook 'ruby-mode-hook 'yard-mode)
(add-hook 'ruby-mode-hook 'eldoc-mode)
(add-hook 'ruby-mode-hook 'ruby-electric-mode)
(add-hook 'ruby-mode-hook 'enh-ruby-mode)

(add-to-list 'auto-mode-alist '("\\.bldr$" . ruby-mode))

;;(require 'ruby-test-mode)
(setq enh-ruby-program "/Users/ajsharp/.rvm/rubies/ruby-1.9.3-p194/bin/ruby")
(autoload 'enh-ruby-mode "enh-ruby-mode" "Major mode for ruby files" t)
(add-to-list 'auto-mode-alist '("\\.rb$" . enh-ruby-mode))
(add-to-list 'interpreter-mode-alist '("ruby" . enh-ruby-mode))

(add-hook 'enh-ruby-mode-hook 'ruby-electric-mode)
(add-hook 'enh-ruby-mode-hook 'robe-mode)
(add-hook 'enh-ruby-mode-hook 'yard-mode)
(add-hook 'enh-ruby-mode-hook 'eldoc-mode)
(add-hook 'enh-ruby-mode-hook 'ruby-tools-mode)
(add-hook 'enh-ruby-mode-hook 'ruby-interpolation-mode)
(add-hook 'enh-ruby-mode-hook 'whitespace-mode)
(add-hook 'enh-ruby-mode-hook 'auto-complete-mode)

(setq ruby-deep-indent-paren nil)

;; CSS / Sass
(add-to-list 'auto-mode-alist '("\\.css\\'" . css-mode))
(add-to-list 'auto-mode-alist '("\\.scss\\'" . css-mode))
(autoload 'css-mode "css-mode" nil t)


;; MMM Mode
(require 'mmm-auto)
(setq mmm-global-mode 'maybe)
(mmm-add-mode-ext-class 'mmm-erb "\\.erb\\'" 'mmm-erb)

;; ===== RSPEC MODE
;; (add-to-list 'load-path "~/.emacs.d/ajsharp/rspec-mode")
;; (require 'rspec-mode)
;; (setq rspec-use-rake-flag nil)
;; (setq rspec-use-rvm t)
;; 
;; (add-hook 'ruby-mode-hook
;;           (lambda () (local-set-key rspec-key-command-prefix rspec-mode-keymap))
;;             'rspec-mode)
;; 
;; (eval-after-load "color-theme" '(color-theme-tomorrow-night))

;; coffeescript
(require 'flymake-coffee)
(add-hook 'coffee-mode-hook 'flymake-coffee-load)
(setq coffee-tab-width 2)
(defun coffee-custom ()
  "coffee-mode-hook"
  (set (make-local-variable 'tab-width) 2))

(add-hook 'coffee-mode-hook
            '(lambda () (coffee-custom)))

(setq whitespace-action '(auto-cleanup)) ;; automatically clean up bad whitespace
(setq whitespace-style '(trailing space-before-tab indentation empty space-after-tab)) ;; only show bad whitespace

;; ===== anything configuration
(require 'anything)
(require 'anything-config)
(require 'anything-eproject)

;; (setq anything-sources
;;       (list
;;        anything-c-source-buffers+
;;        anything-c-source-file-name-history
;;        anything-c-source-eproject-files
;;        ))

;; (define-project-type git (generic)  ; Any dir with a .git directory
;;   (look-for ".git")
;;   :relavent-files (".*"))

(define-project-type lein (generic)
  (look-for "project.clj")
  :relevant-files (".*")
  :irrelevant-files ("^[.]" "^[#]" "\\.jar$" "\\.war$" "^log"))

;; linum setup
;; (setq linum-format "%d ")
;; (global-hl-line-mode 1)

;; same buffer
(nconc same-window-buffer-names '("*Apropos*" "*Buffer List*" "*Help*" "*anything*"))

(remove-hook 'coding-hook 'turn-on-hl-line-mode)
(add-hook 'esk-coding-hook 'esk-turn-on-whitespace)

(add-hook 'repl-mode (lambda () (paredit-mode)))

;;(turn-on-line-numbers-display)

(add-to-list 'auto-mode-alist '("\\.cljs$" . clojure-mode))

(setq backup-directory-alist `(("." . "~/.saves")))

(defun eol-and-insert-newline ()
  (interactive)
  (end-of-line)
  (newline)
  (indent-according-to-mode))

(global-set-key (kbd "M-RET") 'eol-and-insert-newline)

(eval-after-load 'slime '(setq slime-protocol-version 'ignore))

(defmacro defclojureface (name color desc &optional others)
  `(defface ,name '((((class color)) (:foreground ,color ,@others))) ,desc :group 'faces))

(defclojureface clojure-parens       "#999999"   "Clojure parens")
(defclojureface clojure-braces       "DimGrey"   "Clojure braces")
(defclojureface clojure-brackets     "SteelBlue" "Clojure brackets")
(defclojureface clojure-keyword      "#499DF5"   "Clojure keywords")
(defclojureface clojure-namespace    "#c476f1"   "Clojure namespace")
(defclojureface clojure-java-call    "#729FCF"   "Clojure Java calls")
(defclojureface clojure-special      "#1BF21B"   "Clojure special")
;;(defclojureface clojure-double-quote "#1BF21B"   "Clojure special" (:background "unspecified"))

(defun tweak-clojure-syntax ()
  (mapcar (lambda (x) (font-lock-add-keywords nil x))
          '((("#?['`]*(\\|)"       . 'clojure-parens))
            (("#?\\^?{\\|}"        . 'clojure-brackets))
            (("\\[\\|\\]"          . 'clojure-braces))
            ((":\\w+"              . 'clojure-keyword))
            (("#?\""               0 'clojure-double-quote prepend))
            (("nil\\|true\\|false\\|%[1-9]?" . 'clojure-special))
            (("(\\(\\.[^ \n)]*\\|[^ \n)]+\\.\\|new\\)\\([ )\n]\\|$\\)" 1 'clojure-java-call)))))

(add-hook 'clojure-mode-hook 'tweak-clojure-syntax)

;; One-offs
;; Better indention (from Kevin)
(add-hook 'clojure-mode-hook (lambda () (setq clojure-mode-use-backtracking-indent t)))
;; paredit in REPL
(add-hook 'slime-repl-mode-hook (lambda () (paredit-mode +1)))
;; syntax in REPL
;;(add-hook 'slime-repl-mode-hook 'clojure-mode-font-lock-setup)

;; Unicode stuff
(set-language-environment "UTF-8")
(setq slime-net-coding-system 'utf-8-unix)

;; Expression register

(defun copy-expression-to-buffer ()
  (interactive)
  (let ((form (slime-defun-at-point)))
    (setq clj-expression-buffer form))
  (message "Expression copied to buffer."))

(defun send-expression-in-buffer ()
  (interactive)
  (slime-interactive-eval clj-expression-buffer))

(defun eproject-anything ()
  (interactive)
  (anything-other-buffer '(
                           anything-c-source-eproject-files)
                         "*anything*"))

(defun what-face (pos)
  (interactive "d")
  (let ((face (or (get-char-property (point) 'read-face-name)
                  (get-char-property (point) 'face))))
        (if face (message "Face: %s" face) (message "No face at %d" pos))))

;;(defun toggle-fullscreen () (interactive) (ns-toggle-fullscreen))
;;(ns-toggle-fullscreen)
;;(global-set-key [f11] 'toggle-fullscreen)

(setq visible-bell nil)

(setq yas/root-directory "~/.emacs.d/snippets/")
(yas/load-directory yas/root-directory)

(global-set-key (kbd "M-\\") 'delete-horizontal-space)


;; dirtree
(require 'tree-mode)
(require 'windata)
(require 'dirtree)

(defun ep-dirtree ()
  (interactive)
  (dirtree-in-buffer eproject-root t))

;; vendor stuff
(add-to-list 'load-path "~/.emacs.d/vendor")
(add-to-list 'load-path "~/.emacs.d/vendor/textmate.el")

(require 'textmate)
(textmate-mode)
;; (global-set-key (kbd "M-T") 'textmate-goto-file)

;; ido
(define-key ido-file-completion-map (kbd "C-w") 'ido-delete-backward-word-updir)


;; what face?

(defun what-face (pos)
  (interactive "d")
  (let ((face (or (get-char-property (point) 'read-face-name)
                  (get-char-property (point) 'face))))
    (if face (message "Face: %s" face) (message "No face at %d" pos))))

;; CSS

(defun my-html-mode-hook ()
  (setq tab-width 2)
  (setq indent-tabs-mode t)
  (define-key html-mode-map (kbd "<tab>") 'my-insert-tab)
  (define-key html-mode-map (kbd "C->") 'sgml-close-tag))

(defun my-insert-tab (&optional arg)
  (interactive "P")
  (insert-tab arg))

(add-hook 'html-mode-hook 'my-html-mode-hook)


;; (custom-set-variables
;;   ;; custom-set-variables was added by Custom.
;;   ;; If you edit it by hand, you could mess it up, so be careful.
;;   ;; Your init file should contain only one such instance.
;;   ;; If there is more than one, they won't work right.
;;  '(next-screen-context-lines 4))

(setq
 scroll-margin 5)



;; (defadvice next-window
;;   (after track-last-eproject-root activate)
;;   (message "On next window!")
;;   (message eproject-root))

;; (defadvice previous-window
;;   (after track-last-eproject-root activate)
;;   (message "On next window!")
;;   (message eproject-root))

;; (defadvice other-window
;;   (after track-last-eproject-root activate)
;;   (message "On next window!")
;;   (message eproject-root))

(if (file-exists-p (concat user-specific-dir "/key-bindings.el"))
    (load (concat user-specific-dir "/key-bindings.el"))
  )
