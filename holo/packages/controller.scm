(define-module (holo packages controller)
  #:use-module (guix)
  #:use-module (guix licenses)
  #:use-module (guix build-system cargo)
  #:use-module (guix git-download))

(define-public libextest
  (package
   (name "libextest")
   (version "1.0.3")
   (source
    (origin
     (method git-fetch)
     (uri (git-reference
           (url "https://github.com/Supreeeme/extest")
           (commit version)))
     (sha256
      (base32 "058sll7hx8d55j0835a9124pl52izckq8nqyxkywjal78q7mj9g1"))
     (file-name (git-file-name name version))))
   (build-system cargo-build-system)
   (arguments
    (list
     #:install-source? #f
     #:target "i686-linux-gnu"
     #:phases
     #~(modify-phases %standard-phases
         (add-after 'install 'install-library
           (lambda _
             ;; Target directory is 'target/i686-unknown-linux-gnu/release/' 
             ;; install-file takes (file destination-directory)
             (install-file "target/i686-unknown-linux-gnu/release/libextest.so"
                           (string-append #$output "/lib")))))
     ;; #~(modify-phases %standard-phases
     ;; (add-after 'install 'install-library
     ;; (lambda* (#:key outputs #:allow-other-keys)
     ;; (let* ((out (assoc-ref outputs "out"))
     ;; (lib (string-append out "/lib")))
     ;; ;; Create the output /lib directory
     ;; (mkdir-p lib)
     ;; ;; Find and copy the .so file from the cargo build directory
     ;; ;; (Adjust "target/release/" if your build profile is different)
     ;; (install-file "target/release/libextest.so" lib)))))
     ))
   (inputs (cargo-inputs 'extest-controller
                         #:module '(holo packages rust-crates)))
   (home-page "https://github.com/Supreeeme/extest")
   (synopsis "X11 XTEST Reimplementation for Steam Controller on Wayland")
   (description
    "Extest is a drop in replacement for the X11 XTEST extension. It creates a virtual device with the uinput kernel module. It's been primarily developed for allowing the desktop functionality on the Steam Controller to work while Steam is open on Wayland.")
   (license expat)))
