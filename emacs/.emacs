(package-initialize)

(require 'package)
(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/"))

;; Packages to installed / Packages already installed
(require 'cl)
(defvar prelude-packages
  '(ag  flx-ido flx fiplr multiple-cursors erlang elixir-mode markdown-mode highlight-numbers
	emmet-mode haskell-mode)
  "A list of packages to ensure are installed at launch.")

(defun prelude-packages-installed-p ()
  (loop for p in prelude-packages
        when (not (package-installed-p p)) do (return nil)
        finally (return t)))

(unless (prelude-packages-installed-p)
  ;; check for new packages (package versions)
  (message "%s" "Emacs Prelude is now refreshing its package database...")
  (package-refresh-contents)
  (message "%s" " done.")
  ;; install the missing packages
  (dolist (p prelude-packages)
    (when (not (package-installed-p p))
      (package-install p))))

(provide 'prelude-packages)
;; prelude-packages.el ends here

(set-keyboard-coding-system nil)

;; Setting default font to Meslo LG S Bold with 10.5
(set-face-attribute 'default nil :font "Monaco-11")
(set-frame-font "Monaco-11" nil t)

;; Add custom themes folder (~/.emacs.d/themes)
(add-to-list 'custom-theme-load-path "~/.emacs.d/themes/")

;; Loading Custom Themes
(set-frame-parameter nil 'background-mode 'dark)
(set-terminal-parameter nil 'background-mode 'dark)
(load-theme 'Jon t)

;; Hide Tool bar, Menu bar, and scroll bar
(tool-bar-mode -1)
(menu-bar-mode -1)
(scroll-bar-mode -1)

;; Auto-load Highlight numbers mode
(add-hook 'c-mode-hook 'highlight-numbers-mode)
(add-hook 'c++-mode-hook 'highlight-numbers-mode)

;; Auto-indent
(define-key global-map (kbd "RET") 'newline-and-indent)

;; No Wrap Lines
(setq-default truncate-lines t)

;; Disable auto-save
(setq auto-save-default nil)

;; Prevent for making backup files
(setq make-backup-files nil)

;; Highlight current line
;; (global-hl-line-mode t)

;; Disable tabs, use spaces
;;(setq-default indent-tabs-mode nil)

;; Show line numbers in the mode line
(setq-default line-number-mode t)

;; Enable auto-pair for brackets, etc .. (electric-pair-mode) and highlight brackets
(electric-pair-mode 1)
(show-paren-mode 1)

;; Change Clang comment style in c-mode
(add-hook 'c-mode-hook (lambda () (setq comment-start "//"
                                        comment-end   "")))

;; Disable Emacs Bell
(setq-default visible-bell t)
(setq ring-bell-function 'ignore)

;; Display current time on mode line and customize time-string
(setq display-time-format "%A %d/%m/%Y - %H:%M ")
(display-time-mode 1)

;; Show trailing whitespaces
(setq-default show-trailing-whitespace t)

;; Increase Line Height/Line Spacing
;; (setq-default line-spacing 5)

;; Whitespace clean-up on save
(add-hook 'before-save-hook 'delete-trailing-whitespace)

;; Enable multiple-cursors
;;(require 'multiple-cursors)
;;(global-set-key (kbd "C-d") 'mc/mark-next-like-this)

;; Disable Auto-Revert-Check-Vc-Info to better emacs performance
(setq auto-revert-check-vc-info nil)

;; Enable auto-complete
;;(require 'auto-complete-config)
;;(add-to-list 'ac-dictionary-directories "~/.emacs.d/ac-dict")
;;(ac-config-default)
;;(define-key ac-mode-map (kbd "M-TAB") 'auto-complete)

;; Flx-ido
(require 'flx-ido)
(ido-mode t)
(ido-everywhere t)
(flx-ido-mode t)
;; disable ido faces to see flx highlights.
(setq ido-use-faces nil)
;; enable a vertical visualization.
(setq ido-separator "\n> ")

;; Emmet-mode and configuration
(add-to-list 'load-path "~/emacs.d/emmet-mode")
(require 'emmet-mode)

(add-hook 'sgml-mode-hook 'emmet-mode) ;; Auto-start on any markup modes
(add-hook 'css-mode-hook  'emmet-mode) ;; enable Emmet's css abbreviation.

;; Markdown-mode
(autoload 'markdown-mode "markdown-mode"
  "Major mode for editing Markdown files" t)
(add-to-list 'auto-mode-alist '("\\.text\\'" . markdown-mode))
(add-to-list 'auto-mode-alist '("\\.markdown\\'" . markdown-mode))
(add-to-list 'auto-mode-alist '("\\.md\\'" . markdown-mode))

;; Erlang-mode
;; (require 'erlang-start)
;;(add-to-list 'ac-modes 'erlang-mode)

;; Custom Set Variables
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   (quote
    ("3ce051327f2c98d5d86aeb00e97acdfb2e6d6d020fc19265648cf9e10e551669" "464e2befab8af5fd3df13b043b781fcfa9cb02ea9293cef4673ba4a107102beb" "8db4b03b9ae654d4a57804286eb3e332725c84d7cdab38463cb6b97d5762ad26" default)))
 '(package-selected-packages
   (quote
    (gruvbox-theme neotree multiple-cursors markdown-mode flx-ido fiplr erlang elixir-mode color-theme-solarized ag)))
 '(python-indent 2))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

;; ** Custom settings about indentation**

;; ***C Language***
(setq c-default-style "linux"
      c-basic-offset 4
      c-indent-level 4
      )

;; ***Python***
(setq python-indent-offset 2)

;; ** JavaScript**
(setq js-indent-level 2)

;; **Custom Keybinds / Macros**
;; (global-set-key (kbd "C-x <up>") 'windmove-up)
;; (global-set-key (kbd "C-x <down>") 'windmove-down)
;; (global-set-key (kbd "C-x <left>") 'windmove-left)
;; (global-set-key (kbd "C-x <right>") 'windmove-right)

;; Move code region
;; Credit: Andreas Politz
;; URL: https://groups.google.com/forum/#!msg/gnu.emacs.help/dd2R_UV0LVQ/F06ihLb7hKcJ

(defun move-text-internal (arg)
  (cond
   ((and mark-active transient-mark-mode)
    (if (> (point) (mark))
        (exchange-point-and-mark))
    (let ((column (current-column))
          (text (delete-and-extract-region (point) (mark))))
      (forward-line arg)
      (move-to-column column t)
      (set-mark (point))
      (insert text)
      (exchange-point-and-mark)
      (setq deactivate-mark nil)))
   (t
    (beginning-of-line)
    (when (or (> arg 0) (not (bobp)))
      (forward-line)
      (when (or (< arg 0) (not (eobp)))
        (transpose-lines arg))
      (forward-line -1)))))

(defun move-text-down (arg)
  "Move region (transient-mark-mode active) or current line
  arg lines down."
  (interactive "*p")
  (move-text-internal arg))

(defun move-text-up (arg)
  "Move region (transient-mark-mode active) or current line
  arg lines up."
  (interactive "*p")
  (move-text-internal (- arg)))

(global-set-key [\M-up] 'move-text-up)
(global-set-key [\M-down] 'move-text-down)

;; Duplicate line
;; Credit: Nate
;; URL: http://stackoverflow.com/questions/88399/how-do-i-duplicate-a-whole-line-in-emacs

(defun duplicate-line()
  (interactive)
  (move-beginning-of-line 1)
  (kill-line)
  (yank)
  (open-line 1)
  (forward-line 1)
  (yank)
  )
(global-set-key (kbd "C-S-d") 'duplicate-line)

;; Rename file and buffer
;; URL: http://emacsredux.com/blog/2013/05/04/rename-file-and-buffer/

(defun rename-file-and-buffer ()
  "Rename the current buffer and file it is visiting."
  (interactive)
  (let ((filename (buffer-file-name)))
    (if (not (and filename (file-exists-p filename)))
        (message "Buffer is not visiting a file!")
      (let ((new-name (read-file-name "New name: " filename)))
        (cond
         ((vc-backend filename) (vc-rename-file filename new-name))
         (t
          (rename-file filename new-name t)
          (set-visited-file-name new-name t t)))))))
(global-set-key (kbd "C-x R")  'rename-file-and-buffer)

;; Find file like vim's Ctrlp

(global-set-key (kbd "C-x p")  'fiplr-find-file)
(setq fiplr-ignored-globs '((directories (".git" ".svn" "node_modules" ".vagrant" "_meta" "env" ".idea" "_build" "deps"))
                            (files ("*.beam" "*.pyc" "*.jpg" "*.png" "*.zip" "*~"))))

;; Replace All Occurrences (NEED TO FIND A KEYSHORT CUT THAT IS NOT USED)
;;(global-set-key (kbd "C-s") 'replace-string)
