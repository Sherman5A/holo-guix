(define-module (holo packages wm)
  #:use-module (guix)
  #:use-module ((guix licenses)
                #:prefix license:)
  #:use-module (gnu packages)
  #:use-module (gnu packages glib)
  #:use-module (gnu packages python)
  #:use-module (gnu packages pkg-config)
  #:use-module (guix build-system meson)
  #:use-module (guix build-system glib-or-gtk)
  #:use-module (guix git-download)
  #:use-module (gnu packages web)
  #:use-module (gnu packages gtk))

(define-public sfwbar
  (package
   (name "sfwbar")
   (version "v1.0_beta17")
   (source
    (origin
     (method git-fetch)
     (uri (git-reference
           (url "https://github.com/LBCrion/sfwbar")
           (commit version)))
     (file-name (git-file-name name version))
     (sha256
      (base32 "0akfmgz84jdyjl37g1kl8zs9km83k1v9b3n47bnxk49rd9qdgsf5"))))
   (native-inputs (list pkg-config))
   (inputs (list json-c gtk-layer-shell gtk+))
   (propagated-inputs (list python))
   (build-system meson-build-system)
   (arguments
    (list
     #:glib-or-gtk? #t
     #:configure-flags
     #~(list ;Required for RUNPATH validation.
        (string-append "-Dc_link_args=-Wl,-rpath="
                       #$output "/lib/sfwbar"))))
   (home-page "https://github.com/LBCrion/sfwbar")
   (synopsis
    "Flexible taskbar application for wayland compositors")
   (description "S* Floating Window Bar.")
   (license license:gpl3)))



(define-public labwc-menu-generator
  (package
   (name "labwc-menu-generator")
   (version "0.2.0")
   (source
    (origin
     (method git-fetch)
     (uri (git-reference
           (url "https://github.com/labwc/labwc-menu-generator")
           (commit version)))
     (file-name (git-file-name name version))
     (sha256
      (base32 "1lqjppkhqswx4xcjcg6qkgf2lbyzgq7ns8m5rbzpphmvwi6n311f"))))
   (native-inputs (list pkg-config))
   (inputs (list glib))
   (build-system meson-build-system)
   (arguments
    `(#:tests? #f
      #:glib-or-gtk? #t))
   (home-page "https://github.com/labwc/labwc-menu-generator")
   (synopsis
    "Freedesktop Menu Entry generator for labwc")
   (description "Menu generator for Openbox 3.6.")
   (license license:gpl2)))

;; This allows you to run guix shell -f wm.scm.
;; Remove this line if you just want to define a package.
;; sfwbar
;; labwc-menu-generator

