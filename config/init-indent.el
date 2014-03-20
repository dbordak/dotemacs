(setq-default tab-width 4)
(setq-default c-basic-offset 4)

(require-package 'smart-tabs-mode)
(smart-tabs-insinuate 'c 'c++ 'java)

(provide 'init-indent)
