(define-module (holo packages music)
  #:use-module (gnu packages music)
  #:use-module (gnu packages backup)
  #:use-module (guix packages)
  #:use-module (guix git-download))

(define-public fooyin-0.14.1
  (package
   (inherit fooyin)
   (version "0.14.1")
   (source
    (origin
     (method git-fetch)
     (uri (git-reference
           (url "https://github.com/fooyin/fooyin")
           (commit (string-append "v" version))))
     (file-name (git-file-name "fooyin" version))
     (sha256 (base32 "1ad8rmdn0j3piw4jxrjda2fl8vc83mh8l2nvhcpp6d0r0ad40jyh"))))
   (inputs (modify-inputs inputs (append libarchive)))))

;; fooyin-0.14.1
