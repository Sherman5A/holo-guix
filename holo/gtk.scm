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

(define-public raleigh-olive-theme
  (package
    (name "raleigh-olive-theme")
    (version "3.24.19")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/Aalexeey/gtk-theme-raleigholive/")
             (commit version)))
       (sha256
        (base32
         "1zj997vn54n0fcs1ln4ijdbs04cj0h3z7n2kh8g7icnzln16n63x"))
       (file-name (git-file-name name version))))
    (build-system copy-build-system)
    (arguments
     `(#:install-plan
       `(("themes" "share/themes") ("icons" "share/icons"))))
    (home-page "https://github.com/Aalexeey/gtk-theme-raleigholive")
    (synopsis "Olive version of the old Raleigh theme for GTK+ 2 & GTK+ 3")
    (description "Olive version of Raleigh. Includes theme and icons.")
    (license license:gpl2)))


;; This allows you to run guix shell -f gtk.scm.
;; Remove this line if you just want to define a package.
;; raleigh-theme
;;raleigh-olive-theme
