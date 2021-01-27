;;                                 _
;;  __ _  ___ _ __   ___ _ __ __ _| |
;; / _` |/ _ \ '_ \ / _ \ '__/ _` | |
;;| (_| |  __/ | | |  __/ | | (_| | |
;; \__, |\___|_| |_|\___|_|  \__,_|_|
;; |___/


;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(require 'package)
(setq package-archives
      '(("melpa" . "https://melpa.org/packages/")
        ("gnu" . "https://elpa.gnu.org/packages/")
        ("org" . "http://orgmode.org/elpa/")))
(package-initialize)

;;fun
;;(global-set-key (kbd "C-x C-s") 'spook)

;; no welcome message please
(setq inhibit-startup-message t)

;; inital scratch text
(setq initial-scratch-message "..oo00OO Scratchpad OO00oo..

")

(add-to-list 'load-path "~/.emacs.d/plugins")
;;(load "php-mode")
;;(load "lorem-ipsum.el")
(load "linum.el")
;;(load "word-count.el")

;; lorem ipsum
(autoload 'lorem-ipsum-insert-paragraphs "lorem-ipsum" "" t)
(autoload 'lorem-ipsum-insert-sentences "lorem-ipsum" "" t)
(autoload 'lorem-ipsum-insert-list "lorem-ipsum" "" t)

;; syntax highlighting
(global-font-lock-mode 't)
(setq font-lock-maximum-decoration 't)
(setq font-lock-maximum-size '262144)

;; show me line and column nos
(line-number-mode 't)
(column-number-mode 't)

;; none of these please
(scroll-bar-mode '0)
(tool-bar-mode '0)
(menu-bar-mode '0)

;; save and restore my buffers every time
;;(desktop-save-mode 1)

;; Show Date And time in mode-line
;;(setq display-time-day-and-date t )
;;(setq display-time-24hr-format t)
;;(display-time)

;; line numbers
(global-linum-mode 1)

;; make it easy on eyes ...
;; fg
(if window-system
     (set-foreground-color "#000000")
   (set-foreground-color "#ffffff")
   )
;; bg
(if window-system
     (set-background-color "#ffffff")
   (set-background-color "#000000")
   )
  

;; window modifications
(global-set-key (kbd "S-C-<left>") 'shrink-window-horizontally)
(global-set-key (kbd "S-C-<right>") 'enlarge-window-hporizontally)
(global-set-key (kbd "S-C-<down>") 'shrink-window)
(global-set-key (kbd "S-C-<up>") 'enlarge-window)

;; scrolling
(setq
 scroll-margin 5 ;; when to start scrolling
 scroll-conservatively 0
)
(setq-default
 scroll-up-aggressively 0.01
 scroll-down-aggressively 0.01
)

(defun scroll-down-keep-cursor ()
   ;; Scroll the text one line down while keeping the cursor
   (interactive)
   (scroll-down 1))

(defun scroll-up-keep-cursor ()
   ;; Scroll the text one line up while keeping the cursor
   (interactive)
   (scroll-up 1))

(global-set-key (kbd "C-,") 'scroll-down-keep-cursor)
(global-set-key (kbd "C-.") 'scroll-up-keep-cursor)
;(global-set-key (kbd "C-c d") 'insert-current-date)

;; scrolling mouse
(setq mouse-wheel-scroll-amount '(2 ((shift) . 1))) ;; two lines at a time
(setq mouse-wheel-progressive-speed nil) ;; don't accelerate scrolling
(setq mouse-wheel-follow-mouse 't) ;; scroll window under mouse

;; Interactively Do Things mode
(require 'ido)
(ido-mode t)

;; fill column indicator
;; (add-to-list 'load-path "~/.emacs.d/fill-column-indicator.el")
;; (require 'fill-column-indicator)
;; (define-globalized-minor-mode
;;   global-fci-mode fci-mode (lambda() (fci-mode 0)))
;; (setq fci-rule-width 1)
;; (setq fci-rule-color "darkgrey")
;; (setq-default fci-rule-column 80)

;; fci-mode sux in the terminal, i want it just in graphical mode
;; (if (display-graphic-p)
;;     (progn
;;       ;; if graphic
;;       (global-fci-mode 1))
;;       ;; else
;;   (global-fci-mode 0)
;; )

;; highlight the current line
;;(setq hl-line-face 'hl-line)
(global-hl-line-mode '0)
;;(setq highlight-current-line-globally t)
;;(setq highlight-current-line-high-faces nil)
;;(setq highlight-current-line-whole-line nil)
;;(setq hl-line-face (quote highlight))

;; custom keyboard shortcuts
(global-set-key (kbd "C-c m") 'compile)

;; comment/uncomment
(global-set-key (kbd "C-c c") 'comment-region)
(global-set-key (kbd "C-c u") 'uncomment-region)

;; indent
(global-set-key (kbd "C-c i") 'indent-region)

;; enable clipboard
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(org-agenda-files (quote ("~/Dropbox/Documents/Orgzly/db.org")))
 '(package-selected-packages (quote (lua-mode lorem-ipsum org))))

;; tern
(autoload 'tern-mode "tern.el" nil t)
(add-hook 'js2-mode-hook (lambda () (tern-mode t)))
(add-hook 'js2-mode-hook (lambda () (auto-complete-mode t)))

;; tern auto-complete
(eval-after-load 'tern
   '(progn
      (require 'tern-auto-complete)
      (tern-ac-setup)))

;; current date
(defun insert-current-date() (interactive)
  (insert (shell-command-to-string "echo -n $(date '+%Y-%m-%d %k:%M')")))
(global-set-key (kbd "C-c d") 'insert-current-date)

;; auctex
;; (load "auctex.el" nil t t)
;; (load "preview-latex.el" nil t t)

;; convenience
(global-set-key (kbd "C-c r") (lambda() (interactive) (load-file "~/.emacs")))
(defun em ()
   (interactive)
   (find-file "~/.emacs")
   )
(defun awe ()
   (interactive)
   (find-file "~/.config/awesome/rc.lua")
   )

;; emacs paste on line curser (not mouse)
(setq mouse-yank-at-point t)

;; printer command
(setq lpr-command "lp")
(setq lpr-add-switches nil)

;; switch window with tab
(global-set-key [C-M-tab]
 (lambda ()
 (interactive)
 (other-window -1)))
(global-set-key [C-tab] 'other-window)

;; auto break lines in paragraphs
(add-hook 'text-mode-hook 'turn-on-auto-fill)


;; _
;;| | __ _ _ __   __ _ _   _  __ _  __ _  ___  ___
;;| |/ _` | '_ \ / _` | | | |/ _` |/ _` |/ _ \/ __|
;;| | (_| | | | | (_| | |_| | (_| | (_| |  __/\__ \
;;|_|\__,_|_| |_|\__, |\__,_|\__,_|\__, |\___||___/
;;               |___/             |___/

; highlight parentheses when the cursor is next to them
(require 'paren)
(show-paren-mode t)


;; c mode customizations
(cwarn-mode t)
(setq c-default-style "linux")
(which-function-mode t)
(setq c-basic-offset 2)
(global-set-key (kbd "C-c p") 'compile)

;; auto complete
;;(add-to-list 'load-path "~/.emacs.d/auto-complete-installation")
;;(require 'auto-complete-config)
;;(ac-config-default)

;;(global-auto-complete-mode t)

;; matlab
;;(add-to-list 'load-path "~/.emacs.d/matlab_emacs.d")
;;(require 'matlab-load)

;; ya-snippet
;;(add-to-list 'load-path
;;"~/.emacs.d/plugins/yasnippet")
;;(require 'yasnippet)
;;(yas-global-mode 1)

;; subword mode (camelcase mode)
(global-subword-mode 1)

;; i hate tabs!
(setq-default indent-tabs-mode nil)

;; python mode
;;(add-to-list 'load-path "~/.emacs.d/python-mode.el-6.1.1")
;;(setq py-install-directory "~/.emacs.d/python-mode.el-6.1.1")
;;(require 'python-mode)
(add-hook 'python-mode-hook
      (lambda ()
        (setq indent-tabs-mode nil)
        (setq tab-width 4)
        (setq python-indent 4)))

;; ipython
;;(setq py-shell-name "ipython")
;;(require 'ipython)

;; mail mode
;;(server-start)
;;(add-to-list 'auto-mode-alist '("/mutt" . mail-mode))

;; java mode
(add-hook 'java-mode-hook (lambda ()
                            (setq c-basic-offset 2)))

;; refresh buffers on change
(global-auto-revert-mode t)

;; javadoc-lookup
;; (add-to-list 'load-path "~/.emacs.d/javadoc-lookup")
;; (load "javadoc-lookup.el")
;; (global-set-key (kbd "C-h j") 'javadoc-lookup)
;; (javadoc-add-roots "/usr/share/doc/openjdk-7-jdk/api")
;; (javadoc-add-roots "/usr/share/doc/bouncy-castle/docs1.5on")


;; This snippet enables lua-mode
;; This line is not necessary, if lua-mode.el is already on your load-path
(add-to-list 'load-path "~/.emacs.d/lua-mode")

(autoload 'lua-mode "lua-mode" "Lua editing mode." t)
(add-to-list 'auto-mode-alist '("\\.lua$" . lua-mode))
(add-to-list 'interpreter-mode-alist '("lua" . lua-mode))
;;; Emacs/W3 Configuration
(setq load-path (cons "/usr/share/emacs/site-lisp" load-path))
(condition-case () (require 'w3-auto "w3-auto") (error nil))


;; web-mode
;; (add-to-list 'load-path "~/.emacs.d/web-mode")
;; (require 'web-mode)
;; (add-to-list 'auto-mode-alist '("\\.phtml\\'" . web-mode))
;; (add-to-list 'auto-mode-alist '("\\.tpl\\.php\\'" . web-mode))
;; (add-to-list 'auto-mode-alist '("\\.jsp\\'" . web-mode))
;; (add-to-list 'auto-mode-alist '("\\.as[cp]x\\'" . web-mode))
;; (add-to-list 'auto-mode-alist '("\\.erb\\'" . web-mode))
;; (add-to-list 'auto-mode-alist '("\\.mustache\\'" . web-mode))
;; (add-to-list 'auto-mode-alist '("\\.djhtml\\'" . web-mode))
;; (add-to-list 'auto-mode-alist '("\\.html\\'" . web-mode))
;; (add-to-list 'auto-mode-alist '("\\.htm\\'" . web-mode))
;; (add-to-list 'auto-mode-alist '("\\.php\\'" . web-mode))

;; javascript
(require 'js2-mode)
(add-to-list 'auto-mode-alist '("\\.js\\'" . js2-mode))
(setq js2-basic-offset 2)


;; notmuch
(autoload 'notmuch "notmuch" "notmuch mail" t)


;;                                           _
;;  ___  _ __ __ _       _ __ ___   ___   __| | ___
;; / _ \| '__/ _` |_____| '_ ` _ \ / _ \ / _` |/ _ \
;;| (_) | | | (_| |_____| | | | | | (_) | (_| |  __/
;; \___/|_|  \__, |     |_| |_| |_|\___/ \__,_|\___|
;;           |___/

(require 'org-install)
(add-to-list 'auto-mode-alist '("\\.org$" . org-mode))
(add-hook 'org-mode (lambda () (linum-mode -1)))

(defun nolinum ()
  (global-linum-mode 0)
)

(add-hook 'org-mode-hook 'nolinum)


(global-set-key (kbd "C-c a") 'org-agenda)
;;(global-set-key (kbd "C-c c") 'org-capture)
(setq org-log-done t)
(setq org-directory "~/org")

;;(setq org-agenda-files (list "~/Dropbox/Documents/Orgzly/db.org"
;;                             "~/org/linuxlog.org"))
(setq org-agenda-files (list "~/Dropbox/Documents/Orgzly/db.org"))
;;(setq org-agenda-files (list "~/Dropbox/Documents/Orgzly"))
;;(setq org-agenda-files (list "~/Org"))
  
;; unset some key bindings
(add-hook 'org-mode-hook
      (lambda ()
        (local-unset-key (kbd "C-,"))))

;;(setq org-mobile-directory "/munkyjinn.ddns.net:MobileOrg")
;;(setq org-mobile-directory "/84.114.158.210:MobileOrg")
;;(setq org-mobile-directory "/org@192.168.66.70:MobileOrg")
;;(setq org-mobile-directory "/org@jinn.at:MobileOrg")
;;(setq org-mobile-inbox-for-pull (concat org-mobile-directory "/index.org"))

;; org mobile sync
;;(add-hook 'after-init-hook 'org-mobile-pull)
;;(add-hook 'kill-emacs-hook 'org-mobile-push)

;; gtd shortcut
(defun gtd ()
   (interactive)
   (find-file "~/org/gtd.org")
 )

;; linux log shortcut
(defun ll ()
   (interactive)
   (find-file "~/Dropbox/Documents/Orgzly/linuxlog.org")
 )

;; inbox shortcut
(defun inbox ()
  (interactive)
  (find-file "~/Dropbox/Documents/Orgzly/inbox.org")
  )

(defun in ()
  (interactive)
  (find-file "~/Dropbox/Documents/Orgzly/inbox.org")
  )

;; learn timer and notes shortcut
(defun learn ()
  (interactive)
  (find-file "~/Dropbox/Documents/Orgzly/learn-session.org")
  )

;; einkaufsliste shortcut
(defun eink ()
  (interactive)
  (find-file "~/Dropbox/Documents/Orgzly/einkaufen.org")
  )


;;; drag without arrow keys, they are just too far away
(global-set-key (kbd "M-H") 'org-metaup)
(global-set-key (kbd "M-L") 'org-metadown)
(global-set-key (kbd "M-J") 'org-metaleft)
(global-set-key (kbd "M-K") 'org-metaright)

;;; org mode todo keywords
(setq org-todo-keywords
      '((sequence "TODO(t)" "UPTO(u)" "NEXT(n)" "WAITING(w)" "DELEGATED(g)" "|" "DONE(d)" "CANCELED(c)")))

;; org mode, associate pdf with evince
(eval-after-load "org"
  '(progn
     ;; Change .pdf association directly within the alist
     (setcdr (assoc "\\.pdf\\'" org-file-apps) "evince %s")))

;; show next 7 days
(setq org-agenda-span 7)
(setq org-agenda-start-on-weekday nil)

;; custom agenda views
 (setq org-agenda-custom-commands
       '(("td" agenda "" ((org-agenda-ndays 1)))
         ("d" todo "DELEGATED" nil)
         ("c" todo "DONE|CANCELED" nil)
         ("w" todo "WAITING" nil)
         ("i" tags "+ikea")))

;; capture
(setq org-default-notes-file (concat org-directory "/gtd.org"))
(setq org-capture-templates
      '(("t" "Todo" entry (file+headline "~/org/gtd.org" "In")
         "* TODO %?\n  %i\n")
      ("i" "Info" entry (file+headline "~/org/gtd.org" "In")
             "* %?\n  %i\n")))

;; icons
(setq org-agenda-category-icon-alist
      '(("General" "/home/jinn/org/pix/dice_small.png")
        ("Job" "/home/jinn/org/pix/flash_small.png")
        ("Kungfu" "/home/jinn/org/pix/kungfu_small.png")
        ("Vars" "/home/jinn/org/pix/vars_small.png")
        ("In" "/home/jinn/org/pix/in_small.png")
        ("People" "/home/jinn/org/pix/awesome_small.png")
        ("WG" "/home/jinn/org/pix/house_small.png")
        ("Bank" "/home/jinn/org/pix/dice_small.png")
        ("Urlaub" "/home/jinn/org/pix/palm.png")
        ("Party" "/home/jinn/org/pix/party.png")
        ))

;; timer
(setq org-clock-persist 'history)
(org-clock-persistence-insinuate)

;; update clocks
(global-set-key (kbd "C-c C-x C-u") 'org-clock-update-time-maybe)

;; export
(defun org-export-output-file-name-modified (orig-fun extension &optional subtreep pub-dir)
  (unless pub-dir
    (setq pub-dir "exports")
    (unless (file-directory-p pub-dir)
      (make-directory pub-dir)))
  (apply orig-fun extension subtreep pub-dir nil))
(advice-add 'org-export-output-file-name :around #'org-export-output-file-name-modified)


;; mobile sync push
;; (defvar org-mobile-push-timer nil
;;   "Timer that `org-mobile-push-timer' used to reschedule itself, or nil.")

;; (defun org-mobile-push-with-delay (secs)
;;   (when org-mobile-push-timer
;;     (cancel-timer org-mobile-push-timer))
;;   (setq org-mobile-push-timer
;;         (run-with-idle-timer
;;          (* 1 secs) nil 'org-mobile-push)))

;; (add-hook 'after-save-hook 
;;  (lambda () 
;;    (when (eq major-mode 'org-mode)
;;      (dolist (file (org-mobile-files-alist))
;;       (if (string= (file-truename (expand-file-name (car file)))
;; 		   (file-truename (buffer-file-name)))
;;            (org-mobile-push-with-delay 30)))
;;    )))

;; (run-at-time "00:05" 86400 '(lambda () (org-mobile-push-with-delay 1))) ;; refreshes agend
;;a file each day
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )


;(setq org-todo-keyword-faces
;      '(("TODO" . "#30419C") ("STARTED" . "green")
;        ("CANCELED" . (:foreground "blue" :weight bold))))

;; Minted (colored) Code Ouput
;; need package pygments: pip install pygments
(require 'org)
(require 'ox-latex)
;;(add-to-list 'org-latex-packages-alist '("" "minted"))
(setq org-latex-listings 'minted) 

(setq org-latex-pdf-process
      '("pdflatex -shell-escape -interaction nonstopmode -output-directory %o %f"
        "pdflatex -shell-escape -interaction nonstopmode -output-directory %o %f"
        "pdflatex -shell-escape -interaction nonstopmode -output-directory %o %f"))

(setq org-src-fontify-natively t)

(org-babel-do-load-languages
 'org-babel-load-languages
 '((js . t)
   (latex . t)))

;; enbale easy-templates (https://www.reddit.com/r/emacs/comments/ad68zk/get_easytemplates_back_in_orgmode_92/)
(require 'org-tempo)


;; _            
;;| |_ _____  __
;;| __/ _ \ \/ /
;;| ||  __/>  < 
;; \__\___/_/\_\
;;

;;(setq tex-dvi-view-command "xdvi")


;;  _            _   _             
;; | |_ ___  ___| |_(_)_ __   __ _ 
;; | __/ _ \/ __| __| | '_ \ / _` |
;; | ||  __/\__ \ |_| | | | | (_| |
;;  \__\___||___/\__|_|_| |_|\__, |
;;                           |___/ 

;; AUTO-COMPLETE

(require 'package)


