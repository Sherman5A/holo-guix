(define-module (holo gtk)
  #:use-module (guix)
  #:use-module ((guix licenses)
                #:prefix license:)
  #:use-module (gnu packages)
  #:use-module (guix build-system copy)
  #:use-module (guix git-download)
  #:use-module (gnu packages web))

(define-public raleigh-theme
  (package
   (name "raleigh-theme")
   (version "1.2.1")
   (source
     (origin
      (method git-fetch)
      (uri (git-reference
             (url "https://github.com/thesquash/gtk-theme-raleigh/")
             (commit version)))
     (sha256
       (base32
         "009qi8cdzj1ks4040kxc14wn2hq8v4m68s51zqxv94awip0yzc0c"))
     (file-name (git-file-name name version))))
   (build-system copy-build-system)
   (arguments
    `(#:install-plan
      `(("themes" "share/themes") ("icons" "share/icons"))))
   (home-page "https://github.com/thesquash/gtk-theme-raleigh")
   (synopsis "A GTK+ 3 version of the old Raleigh theme for GTK+ 2")
   (description "Gtk-Theme-Raleigh is a re-creation of the original Raleigh theme.")
   (license license:gpl3)))


;; This allows you to run guix shell -f gtk.scm.
;; Remove this line if you just want to define a package.
;; raleigh-theme

