;; -*- coding: utf-8 -*-
;; some general cursor movement commands
;; 2011-05-27
;;   Xah Lee
;; ∑ http://xahlee.org/

(defun xah-scroll-down-10-lines ()
  "scroll down 10 lines"
  (interactive)
  (scroll-down 10))

(defun xah-scroll-up-10-lines ()
  "scroll up 10 lines"
  (interactive)
  (scroll-up 10))

(defun xah-cursor-down-10-lines ()
  "Move cursor down 10 logical lines"
  (interactive)
  (forward-line 10))

(defun xah-cursor-up-10-lines ()
  "Move cursor up 10 logical lines"
  (interactive)
  (forward-line -10))

(defun xah-forward-block (&optional φn)
  "Move cursor forward to the beginning of next text block.
A text block is separated by blank lines.
In most major modes, this is similar to `forward-paragraph', but this command's behavior is the same regardless of syntax table."
  (interactive "p")
  (let ((φn (if (null φn) 1 φn)))
    (search-forward-regexp "\n[\t\n ]*\n+" nil "NOERROR" φn)))

(defun xah-backward-block (&optional φn)
  "Move cursor backward to previous text block.
See: `xah-forward-block'"
  (interactive "p")
  (let ((φn (if (null φn) 1 φn))
        (ξi 1))
    (while (<= ξi φn)
      (if (search-backward-regexp "\n[\t\n ]*\n+" nil "NOERROR")
          (progn (skip-chars-backward "\n\t "))
        (progn (goto-char (point-min))
               (setq ξi φn)))
      (setq ξi (1+ ξi)))))

(defun xah-beginning-of-line-or-block (&optional φn)
  "Move cursor to beginning of line, or beginning of current or previous text block.
 (a text block is separated by blank lines)"
  (interactive "p")
  (let ((φn (if (null φn) 1 φn)))
    (if (equal φn 1)
        (if (or (equal (point) (line-beginning-position))
                (equal last-command this-command )
                ;; (equal last-command 'xah-end-of-line-or-block )
                )
            (xah-backward-block φn)
          (beginning-of-line))
      (xah-backward-block φn))))

(defun xah-end-of-line-or-block (&optional φn)
  "Move cursor to end of line, or end of current or next text block.
 (a text block is separated by blank lines)"
  (interactive "p")
  (let ((φn (if (null φn) 1 φn)))
    (if (equal φn 1)
        (if (or (equal (point) (line-end-position))
                (equal last-command this-command )
                ;; (equal last-command 'xah-beginning-of-line-or-block )
                )
            (xah-forward-block)
          (end-of-line))
      (progn (xah-forward-block φn)))))

(defvar xah-left-brackets nil "List of open bracket chars.")
(setq xah-left-brackets '("(" "{" "[" "<" "〔" "【" "〖" "〈" "《" "「" "『" "“" "‘" "‹" "«" "（"))

(defvar xah-right-brackets nil "list of close bracket chars.")
(setq xah-right-brackets '(")" "]" "}" ">" "〕" "】" "〗" "〉" "》" "」" "』" "”" "’" "›" "»" "）"))

(defvar xah-ascii-quotes nil "List of quotation chars.")
(setq xah-ascii-quotes '("'" "\""))

(defvar xah-punctuations nil "list of punctuation chars for easy jump. Typically exclude things that are too common, such as underscore or slash.")
(setq xah-punctuations '("=" ";"))

(defvar xah-punctuation-regex nil "a regex string for the purpose of jumping to punctuations in programing modes.")
(setq xah-punctuation-regex "[\\!\?\"'#$%&*+,/:;<=>@^`|~]+")

(defun xah-forward-punct (&optional φn)
  "Move cursor to the next occurrence of punctuation.
The list of punctuations to jump to is defined by `xah-punctuation-regex'"
  (interactive "p")
  (search-forward-regexp xah-punctuation-regex nil t φn))

(defun xah-backward-punct (&optional φn)
  "Move cursor to the previous occurrence of punctuation.
See `xah-forward-punct'"
  (interactive "p")
  (search-backward-regexp xah-punctuation-regex nil t φn))

(defun xah-forward-all-bracket (&optional φn)
  "Move cursor to the next occurrence of left bracket or quotation mark.
With prefix ΦN, move forward to the next ΦN left bracket or quotation mark.
With a negative prefix ΦN, move backward to the previous ΦN left bracket or quotation mark.

The list of brackets to jump to is defined by `xah-left-brackets' and `xah-right-brackets' and `xah-ascii-quotes'"
  (interactive "p")
  (if (and φn (> 0 φn))
      (xah-backward-left-bracket (- 0 φn))
    (forward-char 1)
    (search-forward-regexp (eval-when-compile (regexp-opt (append xah-left-brackets xah-right-brackets xah-ascii-quotes ))) nil t φn)
    (backward-char 1)))

(defun xah-backward-all-bracket (&optional φn)
  "Move cursor to the previous occurrence of left bracket or quotation mark.
With prefix argument ΦN, move backward ΦN open brackets.
With a negative prefix ΦN, move forward ΦN open brackets.

The list of brackets to jump to is defined by `xah-left-brackets' and `xah-right-brackets' and `xah-ascii-quotes'"
  (interactive "p")
  (if (and φn (> 0 φn))
      (xah-forward-left-bracket (- 0 φn))
    (search-backward-regexp (eval-when-compile (regexp-opt (append xah-left-brackets xah-right-brackets xah-ascii-quotes ))) nil t φn)))

(defun xah-backward-left-bracket ()
  "Move cursor to the previous occurrence of left bracket.
The list of brackets to jump to is defined by `xah-left-brackets'."
  (interactive)
  (search-backward-regexp (eval-when-compile (regexp-opt xah-left-brackets)) nil t))

(defun xah-forward-right-bracket ()
  "Move cursor to the next occurrence of right bracket.
The list of brackets to jump to is defined by `xah-right-brackets'."
  (interactive)
  (search-forward-regexp (eval-when-compile (regexp-opt xah-right-brackets)) nil t))

(defun xah-forward-quote ()
  "Move cursor to the next occurrence of ASCII quotation mark.
The list of quotes to jump to is defined by `xah-ascii-quotes'.
See also: `xah-backward-quote'."
  (interactive)
  (search-forward-regexp (eval-when-compile (regexp-opt xah-ascii-quotes)) nil t))

(defun xah-backward-quote ()
  "Move cursor to the previous occurrence of ASCII quotation mark.
See `xah-forward-quote'."
  (interactive)
  (search-backward-regexp (eval-when-compile (regexp-opt xah-ascii-quotes)) nil t))

(defun xah-forward-dot-comma ()
  "Move cursor to the next occurrence of 「.」 「,」 「;」"
  (interactive)
  (search-forward-regexp "\\.+\\|,+\\|;+" nil t))

(defun xah-backward-dot-comma ()
  "Move cursor to the previous occurrence of 「.」 「,」 「;」"
  (interactive)
  (search-backward-regexp "\\.+\\|,+\\|;+" nil t))

;; (defun goto-point-min ()
;;   "Goto the beginning of buffer.
;; This is different from `beginning-of-buffer'
;; because that marks the previous position."
;;   (interactive)
;;   (goto-char (point-min))
;; )

;; (defun goto-point-max ()
;;   "Goto the end of buffer.
;; This is different from `end-of-buffer'
;; because that marks the previous position."
;;   (interactive)
;;   (goto-char (point-max))
;; )

;; (defun xah-forward-space ()
;;   "Move cursor to the next occurrence of white space."
;;   (interactive)
;;   (re-search-forward "[ \t\n]+" nil t))

;; (defun xah-backward-space ()
;;   "Move cursor to the next occurrence of white space."
;;   (interactive)
;;   ;; (skip-chars-backward "^ \t\n")
;;   ;; (re-search-backward "[ \t\n]+" nil t)
;;   (posix-search-backward "[ \t\n]+" nil t)
;;   )