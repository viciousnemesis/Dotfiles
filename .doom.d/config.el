;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-
;; Place your private configuration here! Remember, you do not need to run 'doom
;; sync' after modifying this file!

;; Some functionality uses this to identify you, e.g. GPG configuration, email
;; clients, file templates and snippets.
(setq user-full-name "Vicious"
      user-mail-address "brutis88@gmail.com")

;; Doom exposes five (optional) variables for controlling fonts in Doom. Here
;; are the three important ones:
;;
;; + `doom-font'
;; + `doom-variable-pitch-font'
;; + `doom-big-font' -- used for `doom-big-font-mode'; use this for
;;   presentations or streaming.
;;
;; They all accept either a font-spec, font string ("Input Mono-12"), or xlfd
;; font string. You generally only need these two:
;; (setq doom-font (font-spec :family "monospace" :size 12 :weight 'semi-light)
;;       doom-variable-pitch-font (font-spec :family "sans" :size 13))
;; Font List
;;       CMU Concrete
;;       CMU Typewriter Text
;;       Deja Vu Sans
;;       Fira Code
;;       Fira Sans
;;       Simonetta

;; There are two ways to load a theme. Both assume the theme is installed and
;; available. You can either set `doom-theme' or manually load a theme with the
;; `load-theme' function. This is the default:
(setq doom-theme 'doom-monokai-pro)  ; 'doom-gruvbox); 'doom-dark+)

;; This determines the style of line numbers in effect. If set to `nil', line
;; numbers are disabled. For relatie line numbers, set this to `relative'.
(setq display-line-numbers-type t)

;; Here are some additional functions/macros that could help you configure Doom:
;;
;; - `load!' for loading external *.el files relative to this one
;; - `use-package!' for configuring packages
;; - `after!' for running code after a package has loaded
;; - `add-load-path!' for adding directories to the `load-path', relative to
;;   this file. Emacs searches the `load-path' when you load packages with
;;   `require' or `use-package'.
;; - `map!' for binding new keys
;
;; To get information about any of these functions/macros, move the cursor over
;; the highlighted symbol at press 'K' (non-evil users must press 'C-c c k').
;; This will open documentation for it, including demos of how they are used.
;;
;; You can also try 'gd' (or 'C-c c d') to jump to their definition and see how
;; they are implemented.

;; HiDPI Mode: 
;; https://emacs.stackexchange.com/questions/28390/quickly-adjusting-text-to-dpi-changes
(setq font-family "Fira Code")
(setq variable-font-family "CMU Concrete")
(setq doom-font (font-spec :family font-family :size 25 :weight 'regular)
       doom-big-font (font-spec :family font-family :size 25 :weight 'regular)
       doom-variable-pitch-font (font-spec :family variable-font-family :size 30))
;(if (equal (display-pixel-width) 3840)
;    (setq doom-font (font-spec :family font-family :size 25)
;          doom-big-font (font-spec :family font-family :size 35))
;  (setq doom-font (font-spec :family font-family :size 70)
;        doom-big-font (font-spec :family font-family :size 80)))
(defun vicious/set-initial-frame ()
  "Set initial frame size and position"
    ;;(set-frame-position (selected-frame) 1920 50)
    (set-frame-position (selected-frame) 0 50)
    (set-frame-size (selected-frame) 1850 2010 t))

(vicious/set-initial-frame)


;;Keybindings.
(general-define-key
 "<escape>" 'keyboard-escape-quit
 "C-M-j" 'counsel-switch-buffer)


;; Trackpad functionality ---------------------------------------------------------------------------
;; Turn off trackpad when we get into Emacs, turn it back on when we leave
;; https://www.reddit.com/r/emacs/comments/38o0tr/i_have_to_share_this_switch_your_touchpad_off/
(defun vicious/turn-off-trackpad-tap-to-click (&optional frame)
  (interactive)
  (let ((inhibit-message t) (default-directory "~"))
    (shell-command "xinput set-prop \"Synaptics TM3418-002\" 354 0")))

(defun vicious/turn-on-trackpad-tap-to-click (&optional frame)
  (interactive)
  (let ((inhibit-message t) (default-directory "~"))
    (shell-command "xinput set-prop \"Synaptics TM3418-002\" 354 1")))

(add-hook 'focus-in-hook #'vicious/turn-off-trackpad-tap-to-click)
(add-hook 'focus-out-hook #'vicious/turn-on-trackpad-tap-to-click)
(add-hook 'delete-frame-functions #'vicious/turn-on-trackpad-tap-to-click)




;; Org Mode Configuration -------------------------------------------------------------------------
;; https://github.com/daviwil/emacs-from-scratch/commit/1a13fcf0dd6afb41fce71bf93c5571931999fed8
(defun vicious/org-mode-setup ()
  (org-indent-mode)
  (variable-pitch-mode 1)
  (visual-line-mode 1)
  ;(setq evil-auto-indent nil)
  )

(defun vicious/org-font-setup ()

  ;; General font for org-mode
  (setq org-font "Cantarell")

  ;; Get rid of bullets in headers NOTE the 'Zero-Width Space' inside the quotes
  (setq org-superstar-headline-bullets-list '("​"))

  ;; Get rid of shitty auto-formatting
  (setq org-superstar-prettify-item-bullets nil)

  ;; Replace hyphens with dots
  (font-lock-add-keywords 'org-mode
                          '(("^ *\\([-]\\) "
                            (0 (prog1 () (compose-region (match-beginning 1) (match-end 1) "•"))))))

  ;; Set font size for different headings
  (dolist (face '((org-level-1 . 1.5)
                  (org-level-2 . 1.4)
                  (org-level-3 . 1.3)
                  (org-level-4 . 1.3)
                  (org-level-5 . 1.3)
                  (org-level-6 . 1.3)
                  (org-level-7 . 1.3)
                  (org-level-8 . 1.3)))
    (set-face-attribute (car face) nil :font org-font :weight 'regular :height (cdr face)))

  ;; Ensure that anything that should be fixed-pitch in Org files appears that way
  ;; Run 'M-x describe-face', 'org-'
  (set-face-attribute 'org-block nil :foreground nil :inherit 'fixed-pitch)
  (set-face-attribute 'org-code nil   :inherit '(shadow fixed-pitch))
  (set-face-attribute 'org-table nil   :inherit '(shadow fixed-pitch))
  (set-face-attribute 'org-verbatim nil :inherit '(shadow fixed-pitch))
  (set-face-attribute 'org-special-keyword nil :inherit '(font-lock-comment-face fixed-pitch))
  (set-face-attribute 'org-meta-line nil :inherit '(font-lock-comment-face fixed-pitch))
  (set-face-attribute 'org-checkbox nil :inherit 'fixed-pitch)
  )

(use-package! org
  :hook (org-mode . vicious/org-mode-setup)
  :config
  (setq org-ellipsis " ▼")  ;▾
  (setq org-hide-emphasis-markers t)
  (setq org-agenda-start-with-log-mode t)
  (setq org-log-done-with-time t)
  (setq org-log-into-drawer t)
  (setq org-directory "~/Documents/OrgFiles/")
  (setq org-agenda-files
        (list
         (concat org-directory "contacts.org")
         (concat org-directory "tasks.org")))
  (setq org-todo-keywords
        '((sequence "TODO(t)" "NEXT(n)" "|" "DONE(d!)"))) ;(sequence "BACKLOG(b)" "PLAN(p)" "READY(r)" "ACTIVE(a)" "REVIEW(v)" ;"WAIT(w@/!)" "HOLD(h)" "|" "COMPLETED(c)" "CANCELLED(k@)"))
  (vicious/org-font-setup)
  )

;; Make Org-Mode look and feel like a 'Word' document
(defun vicious/org-mode-visual-fill ()
  (setq visual-fill-column-width 100
        visual-fill-column-center-text t)
 (visual-fill-column-mode 1))
(use-package! visual-fill-column
  :hook (org-mode . vicious/org-mode-visual-fill))

