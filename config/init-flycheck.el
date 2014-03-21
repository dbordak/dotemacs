(require-package 'flycheck)

(after 'flycheck
  (setq flycheck-check-syntax-automatically '(save mode-enabled))
  (setq flycheck-checkers (delq 'emacs-lisp-checkdoc flycheck-checkers))
  (setq flycheck-checkers (delq 'html-tidy flycheck-checkers)))
  (setq flycheck-indication-mode 'right-fringe)

(global-flycheck-mode t)

(provide 'init-flycheck)
