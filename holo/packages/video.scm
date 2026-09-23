(define-module (holo packages video)
  #:use-module (gnu packages video)
  #:use-module (guix packages)
  #:use-module (guix git-download))

(define-public gallery-dl-1.32.10
  (package
   (inherit gallery-dl)
   (version "1.32.10")
   (source
    (origin
     (method git-fetch)
     (uri (git-reference
           (url "https://codeberg.org/mikf/gallery-dl")
           (commit (string-append "v" version))))
     (file-name (git-file-name "gallery-dl" version))
     (sha256 (base32 "028n7vbyldmi8gcf7jam1sz1sxwd7fnkkn2d6j43xdmb9bakrbdx"))))))

;; gallery-dl-1.32.10
