;; Minimal setup for testing Parinfer Smart Mode.

(require 'package)

(add-to-list 'package-archives (cons "melpa" "https://melpa.org/packages/") t)

(package-initialize)

(unless (package-installed-p 'clojure-mode)
  (package-refresh-contents)
  (package-install 'clojure-mode))

(unless (package-installed-p 'selected)
  (package-install 'selected))

(unless (package-installed-p 'cl-lib)
  (package-install 'cl-lib))

(unless (package-installed-p 'paredit)
  (package-install 'paredit))

(load-file (expand-file-name "~/.emacs.d/parinfer-smart.el"))

(add-hook 'clojure-mode-hook #'parinfer-mode)

(setq inhibit-startup-screen t)

(setq initial-major-mode 'clojure-mode)

(remove-hook 'post-self-insert-hook 'blink-paren-post-self-insert-function)

(setq initial-scratch-message ";; Now you can test new parinfer-mode.")
