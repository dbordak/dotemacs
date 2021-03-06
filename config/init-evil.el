(setq evil-want-C-u-scroll t)
(setq evil-want-C-w-in-emacs-state t)

(setq evil-search-module 'evil-search)
(setq evil-magic 'very-magic)

(setq evil-emacs-state-cursor '("#dc322f" box))
(setq evil-normal-state-cursor '("#586e75" box))
(setq evil-visual-state-cursor '("#b58900" box))
(setq evil-insert-state-cursor '("#859900" bar))
(setq evil-replace-state-cursor '("#dc322f" box))
(setq evil-operator-state-cursor '("#dc322f" hollow))

(setq evilnc-hotkey-comment-operator "gc")

(require-package 'evil)
(require-package 'evil-leader)
(require-package 'evil-numbers)
(require-package 'evil-visualstar)
(require-package 'evil-nerd-commenter)
(require-package 'evil-indent-textobject)
(require-package 'evil-matchit)
(require-package 'surround)

(require 'evil)
(require 'evil-leader)
(require 'evil-numbers)
(require 'evil-nerd-commenter)
(require 'evil-indent-textobject)
(require 'evil-visualstar)
(require 'evil-matchit)
(require 'surround)

(global-evil-leader-mode)
(evil-mode t)
(global-surround-mode 1)

(defun evilmi-customize-keybinding ()
  (evil-define-key 'normal evil-matchit-mode-map
    "%" 'evilmi-jump-items))
(global-evil-matchit-mode t)

(dolist (mode '(eshell-mode shell-mode term-mode terminal-mode comint-mode skewer-repl-mode
                profiler-report-mode
                erc-mode weechat-mode
                direx:direx-mode
                makey-key-mode
                project-explorer-mode))
  (evil-set-initial-state mode 'emacs))

(defun my-send-string-to-terminal (string)
  (unless (display-graphic-p) (send-string-to-terminal string)))

(defun my-evil-modeline-change (default-color)
  "changes the modeline color when the evil mode changes"
  (let ((color (cond ((evil-emacs-state-p) '("#330000" . "#839496"))
                     ;;((evil-insert-state-p) '("#001122" . "#839496"))
                     ;;((evil-visual-state-p) '("#220011" . "#839496"))
                     (t default-color))))
    (set-face-background 'mode-line (car color))
    (set-face-foreground 'mode-line (cdr color))))

(lexical-let ((default-color (cons (face-background 'mode-line)
                                   (face-foreground 'mode-line))))
  (add-hook 'post-command-hook (lambda () (my-evil-modeline-change default-color))))

(defadvice evil-ex-search-next (after advice-for-evil-ex-search-next activate)
  (evil-scroll-line-to-center (line-number-at-pos)))

(defadvice evil-ex-search-previous (after advice-for-evil-ex-search-previous activate)
  (evil-scroll-line-to-center (line-number-at-pos)))

(defadvice evil-jump-forward (after advice-for-evil-jump-forward activate)
  (evil-scroll-line-to-center (line-number-at-pos)))

(defadvice evil-jump-backward (after advice-for-evil-jump-backward activate)
  (evil-scroll-line-to-center (line-number-at-pos)))

(global-set-key (kbd "RET") 'evil-ret-and-indent)

(provide 'init-evil)
