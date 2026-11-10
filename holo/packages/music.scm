(define-module (holo packages music)
  #:use-module (gnu packages)
  #:use-module (gnu packages music)
  #:use-module (gnu packages pkg-config)
  #:use-module (gnu packages qt)
  #:use-module (guix packages)
  #:use-module (guix utils)
  #:use-module (guix gexp)
  #:use-module ((guix licenses)
                #:prefix license:)
  #:use-module (guix build-system qt)
  #:use-module (guix git-download))

(define (lastfm-secret field)
  (let
      ((file (string-append (or (getenv "HOME") "")
                            "/.config/guix/last-fm-env.scm")))
    (if (file-exists? file)
        (or (assoc-ref (call-with-input-file file read) field) "")
        "")))

(define-public fooyin-dev-headers
  (package
   (inherit fooyin)
   (name "fooyin-dev-headers")
   (version "v0.15.1")
   (source (origin
	    (method git-fetch)
	    (uri (git-reference
		  (url "https://github.com/fooyin/fooyin")
		  (commit version)))
	    (file-name (git-file-name name version))
	    (sha256
	     (base32
	      "0lms3vq9pd4b4fhn0jn9m9s0bjl0lfvfbjhs0zsfr1vyiv4hklxn"))))
   (arguments
    (substitute-keyword-arguments
     arguments
     ((#:configure-flags original-flags '())
      #~(cons "-DINSTALL_HEADERS=ON" #$original-flags)
      )))
   (native-search-paths
    (list
     (search-path-specification
      (variable "FOOYIN_PLUGIN_PATH")
      (files (list "lib/fooyin/plugins")))))))


(define-public foo-scrobbler-yin
  (package
   (name "foo-scrobbler-yin")
   (version "v2.0.2")
   (source (origin
	    (method git-fetch)
	    (uri (git-reference
		  (url "https://github.com/zfoxer/foo_scrobbler_yin")
		  (commit version)))
	    (file-name (git-file-name name version))
	    (sha256
	     (base32
	      "0xr70n6mcd6jdqg3wp6v346cgxjilpanlpbrl7bcsfnnv77a64la"))))
   (build-system qt-build-system)
   (arguments
    (list
     #:qtbase qtbase
     #:tests? #false
     #:phases
     #~(modify-phases %standard-phases
		      (add-before 'configure 'set-secrets
				  (lambda _
				    (setenv "LASTFM_API_KEY" #$(lastfm-secret 'key))
				    (setenv "LASTFM_API_SECRET" #$(lastfm-secret 'secret))))
		      (replace 'install
			       (lambda _
				 (let ((plugin-dir (string-append #$output "/lib/fooyin/plugins")))
				   (mkdir-p plugin-dir)
				   (install-file "fyplugin_foo_scrobbler_yin.so" plugin-dir)))))))
   (inputs
    (list fooyin-dev-headers))
   (home-page "https://github.com/zfoxer/foo_scrobbler_yin")
   (synopsis "Last.fm scrobbler (foo_scrobbler_yin) for fooyin.")
   (description "A Last.fm scrobbler plugin for fooyin, ported from Foo Scrobbler for foobar2000.")
   (license license:expat)))
