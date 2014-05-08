(require 'go-mode-load)
(add-hook 'before-save-hook 'gofmt-before-save)
(add-hook 'go-mode-hook (lambda () (local-set-key (kbd "C-c C-g") #'godoc)))
(add-hook 'go-mode-hook (lambda () (
                               local-set-key (kbd "C-c C-r") 'go-remove-unused-imports)))
(add-to-list 'load-path "~/go/src/github.com/dougm/goflymake")

(require 'go-flymake)
(require 'go-flycheck)
