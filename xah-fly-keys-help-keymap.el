;; -*- coding: utf-8 -*-

(progn
  (define-prefix-command 'xah-help-keymap)

  (define-key xah-help-keymap (kbd "1") nil)
  (define-key xah-help-keymap (kbd "2") nil)
  (define-key xah-help-keymap (kbd "3") 'man)

  (define-key xah-help-keymap (kbd "4") 'elisp-index-search)
  (define-key xah-help-keymap (kbd "5") 'apropos-variable)
  (define-key xah-help-keymap (kbd "6") 'apropos-value)
  (define-key xah-help-keymap (kbd "7") 'lookup-google)
  (define-key xah-help-keymap (kbd "8") 'lookup-wikipedia)
  (define-key xah-help-keymap (kbd "9") 'lookup-word-definition)
  (define-key xah-help-keymap (kbd "0") 'lookup-all-dictionaries)

  (define-key xah-help-keymap (kbd "a") 'apropos-command)
  (define-key xah-help-keymap (kbd "b") 'describe-bindings)
  (define-key xah-help-keymap (kbd "c") 'describe-char)
  (define-key xah-help-keymap (kbd "C") 'describe-coding-system)
  (define-key xah-help-keymap (kbd "d") 'apropos-documentation)
  (define-key xah-help-keymap (kbd "e") 'view-echo-area-messages)
  (define-key xah-help-keymap (kbd "f") 'describe-function)
  (define-key xah-help-keymap (kbd "F") 'Info-goto-emacs-command-node)
  (define-key xah-help-keymap (kbd "g") nil)
  (define-key xah-help-keymap (kbd "h") 'describe-face)
  (define-key xah-help-keymap (kbd "i") 'info)
  (define-key xah-help-keymap (kbd "I") 'describe-input-method)
  (define-key xah-help-keymap (kbd "j") nil)
  (define-key xah-help-keymap (kbd "k") 'describe-key)
  (define-key xah-help-keymap (kbd "K") 'Info-goto-emacs-key-command-node)
  (define-key xah-help-keymap (kbd "l") 'view-lossage)
  (define-key xah-help-keymap (kbd "L") 'describe-language-environment)
  (define-key xah-help-keymap (kbd "m") 'xah-describe-major-mode)
  (define-key xah-help-keymap (kbd "n") nil)
  (define-key xah-help-keymap (kbd "o") nil)
  (define-key xah-help-keymap (kbd "p") 'finder-by-keyword)
  (define-key xah-help-keymap (kbd "q") nil)
  (define-key xah-help-keymap (kbd "r") nil)
  (define-key xah-help-keymap (kbd "s") 'describe-syntax)
  (define-key xah-help-keymap (kbd "S") 'info-lookup-symbol)
  (define-key xah-help-keymap (kbd "t") nil)
  (define-key xah-help-keymap (kbd "u") nil)
  (define-key xah-help-keymap (kbd "v") 'describe-variable)
  (define-key xah-help-keymap (kbd "w") nil)
  (define-key xah-help-keymap (kbd "x") nil)
  (define-key xah-help-keymap (kbd "y") nil)
  (define-key xah-help-keymap (kbd "z") nil)
  )