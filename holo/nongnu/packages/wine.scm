;;; SPDX-License-Identifier: GPL-3.0-or-later
;;; Copyright © 2019 Pierre Neidhardt <mail@ambrevar.xyz>

(define-module (holo nongnu packages wine)
  #:use-module (ice-9 match)
  #:use-module ((guix licenses) :prefix license:)
  #:use-module (guix packages)
  #:use-module (guix build-system gnu)
  #:use-module (guix build-system trivial)
  #:use-module (guix build-system copy)
  #:use-module (guix download)
  #:use-module (guix gexp)
  #:use-module (guix git-download)
  #:use-module (gnu packages base)
  #:use-module (gnu packages bash)
  #:use-module (gnu packages perl)
  #:use-module (gnu packages wget)
  #:use-module (gnu packages compression)
  #:use-module (gnu packages gnome)
  #:use-module (gnu packages wine))

(define-public winetricks
  (package
   (name "winetricks")
   (version "20260125")
   (source (origin
            (method git-fetch)
            (uri (git-reference
                  (url "https://github.com/Winetricks/winetricks")
                  (commit version)))
            (file-name (git-file-name name version))
            (sha256
             (base32
              "0f8wplyjzp3wnkfa7wrqnqdmr75dlpx7fmkwbvmpxc4v4w8mb05q"))))
   (build-system gnu-build-system)
   (inputs
    (list cabextract
          p7zip
          perl
          ;; unrar ; TODO: Include unrar?  It is referenced in the source.
          unzip
          wget
          zenity))
   (arguments
    (list
     #:tests? #f
     ;; TODO: Checks need bashate, shellcheck (in Guix), and checkbashisms.
     #:make-flags #~(list (string-append "DESTDIR=" #$output)
                          "PREFIX=")
     #:phases
     #~(modify-phases %standard-phases
		      (delete 'configure)
		      (add-after 'install 'wrap-program
				 ;; The script relies on WINETRICKS_GUI being exactly "zenity", so
				 ;; we can't patch the path directly.  Probably same for other dependencies.
				 (lambda _
				   (let* ((winetricks (string-append #$output "/bin/winetricks"))
					  (paths (map
						  (lambda (p) (string-append p "/bin"))
						  (list #$(this-package-input "cabextract")
							#$(this-package-input "p7zip")
							#$(this-package-input "perl")
							#$(this-package-input "unzip")
							#$(this-package-input "wget")
							#$(this-package-input "zenity")))))
				     (wrap-program winetricks
						   `("PATH" prefix ,paths)))))
		      (add-after 'install 'patch-perl-path
				 (lambda _
				   (let* ((perl (string-append #$(this-package-input "perl")
							       "/bin/perl"))
					  (winetricks (string-append #$output "/bin/winetricks")))
				     (substitute* winetricks
						  (("#!/usr/bin/env perl") (string-append "#!" perl)))))))))
   (home-page "https://github.com/Winetricks/winetricks")
   (synopsis "Easy way to work around problems in Wine")
   (description "Winetricks is an easy way to work around problems in Wine.
It has a menu of supported games/apps for which it can do all the workarounds
automatically.  It also allows the installation of missing nonfree DLLs and
tweaking of various Wine settings.")
   (license license:lgpl2.1)))
