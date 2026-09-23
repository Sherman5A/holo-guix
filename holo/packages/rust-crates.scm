;;; GNU Guix --- Functional package management for GNU
;;; Copyright © 2025 Hilton Chain <hako@ultrarare.space>
;;;
;;; This file is part of GNU Guix.
;;;
;;; GNU Guix is free software; you can redistribute it and/or modify it
;;; under the terms of the GNU General Public License as published by
;;; the Free Software Foundation; either version 3 of the License, or (at
;;; your option) any later version.
;;;
;;; GNU Guix is distributed in the hope that it will be useful, but
;;; WITHOUT ANY WARRANTY; without even the implied warranty of
;;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;;; GNU General Public License for more details.
;;;
;;; You should have received a copy of the GNU General Public License
;;; along with GNU Guix.  If not, see <http://www.gnu.org/licenses/>.

(define-module (holo packages rust-crates)
  #:use-module (guix gexp)
  #:use-module (guix packages)
  #:use-module (guix download)
  #:use-module (guix git-download)
  #:use-module (guix build-system cargo)
  #:use-module ((gnu packages rust-sources) #:prefix package:)
  #:export (lookup-cargo-inputs))

;;;
;;; This file is managed by ‘guix import’.  Do NOT add definitions manually.
;;;

;;;
;;; Rust libraries fetched from crates.io and non-workspace development
;;; snapshots.
;;;

(define qqqq-separator 'begin-of-crates)

(define rust-autocfg-1.5.1
  (crate-source "autocfg" "1.5.1"
                "0lqasy5i30flcgih1b50kvsk6z32g09r1q4ql7q81pj6228jy0zj"))

(define rust-bitflags-1.3.2
  (crate-source "bitflags" "1.3.2"
                "12ki6w8gn1ldq7yz9y680llwk5gmrhrzszaa17g1sbrw2r2qvwxy"))

(define rust-bitflags-2.13.2
  (crate-source "bitflags" "2.13.2"
                "01hbgjwvid66850fzi76mvn5f2bqycx6sf165ng1kfjqq9bl1v9x"))

(define rust-bitvec-1.1.1
  (crate-source "bitvec" "1.1.1"
                "0dqq44v9877q0xbl4g6aaaf3xhh3m1ca7ag0iy4l17ap5k8w7knx"))

(define rust-cc-1.4.7
  (crate-source "cc" "1.4.7"
                "04z3q2wqsg4qgx4vsqsd01s27svz0bgdymjiyccgbnn24gg3whal"))

(define rust-cfg-aliases-0.2.2
  (crate-source "cfg_aliases" "0.2.2"
                "09rm3dv28gbsal7w6q76lg2nfyn8wp789ska9b8vr1w750xfhygh"))

(define rust-cfg-if-1.0.5
  (crate-source "cfg-if" "1.0.5"
                "0026j56901nzjraap3da0a8njw42j66zcxnn6s2s9aa5bcblhxjf"))

(define rust-dlib-0.5.3
  (crate-source "dlib" "0.5.3"
                "0jpr4smrwrv8xj70mz4ixnbc6ljm82f12z2mz1hv89056y3wv3mb"))

(define rust-downcast-rs-1.2.1
  (crate-source "downcast-rs" "1.2.1"
                "1lmrq383d1yszp7mg5i7i56b17x2lnn3kb91jwsq0zykvg2jbcvm"))

(define rust-evdev-0.13.2
  (crate-source "evdev" "0.13.2"
                "16gaxdjwv0ng6jx1qd196vlg878g2wibmxhgi298vw577dk8ddi5"))

(define rust-find-msvc-tools-0.1.13
  (crate-source "find-msvc-tools" "0.1.13"
                "16ykhz2icc0xx8i3vr8fpp6h3djpik2zw5bcxbff9bxba5g909gg"))

(define rust-funty-2.0.0
  (crate-source "funty" "2.0.0"
                "177w048bm0046qlzvp33ag3ghqkqw4ncpzcm5lq36gxf2lla7mg6"))

(define rust-hermit-abi-0.3.9
  (crate-source "hermit-abi" "0.3.9"
                "092hxjbjnq5fmz66grd9plxd0sh6ssg5fhgwwwqbrzgzkjwdycfj"))

(define rust-io-lifetimes-1.0.11
  (crate-source "io-lifetimes" "1.0.11"
                "1hph5lz4wd3drnn6saakwxr497liznpfnv70via6s0v8x6pbkrza"))

(define rust-libc-0.2.189
  (crate-source "libc" "0.2.189"
                "1whjfs375vlng2q6yrbzs73cvp5lm3w1n2gfqajb2vgf7zg3xbry"))

(define rust-libloading-0.8.9
  (crate-source "libloading" "0.8.9"
                "0mfwxwjwi2cf0plxcd685yxzavlslz7xirss3b9cbrzyk4hv1i6p"))

(define rust-log-0.4.34
  (crate-source "log" "0.4.34"
                "1ihkzn0m33ab79fcl4mkb04n5iwqzbxzyw7l7hazqkffaqzbvy7r"))

(define rust-memchr-2.8.3
  (crate-source "memchr" "2.8.3"
                "161xa63ipfanf8v3nb82xd5hqgydv55nzw59wyngqbz6alfaz2yg"))

(define rust-memoffset-0.7.1
  (crate-source "memoffset" "0.7.1"
                "1x2zv8hv9c9bvgmhsjvr9bymqwyxvgbca12cm8xkhpyy5k1r7s2x"))

(define rust-nix-0.26.4
  (crate-source "nix" "0.26.4"
                "06xgl4ybb8pvjrbmc3xggbgk3kbs1j0c4c0nzdfrmpbgrkrym2sr"))

(define rust-nix-0.29.0
  (crate-source "nix" "0.29.0"
                "0ikvn7s9r2lrfdm3mx1h7nbfjvcc6s9vxdzw7j5xfkd2qdnp9qki"))

(define rust-once-cell-1.21.4
  (crate-source "once_cell" "1.21.4"
                "0l1v676wf71kjg2khch4dphwh1jp3291ffiymr2mvy1kxd5kwz4z"))

(define rust-pkg-config-0.3.34
  (crate-source "pkg-config" "0.3.34"
                "0j05h08nzg0q8rf6lzw7nry0b7kn7x97vc9n4hwrl52fqzxn9d7n"))

(define rust-proc-macro2-1.0.107
  (crate-source "proc-macro2" "1.0.107"
                "1nb6ly8kp65f724kj73ippc7lvydss24sm2vagk6qpklpg4pwplq"))

(define rust-quick-xml-0.28.2
  (crate-source "quick-xml" "0.28.2"
                "1lfr3512x0s0i9kbyglyzn0rq0i1bvd2mqqfi8gs685808rfgr8c"))

(define rust-quote-1.0.47
  (crate-source "quote" "1.0.47"
                "00ch0yyzvv6s671ik0kcsbw8nigdaj2g3fr61kcahwx48aqlvgqz"))

(define rust-radium-0.7.0
  (crate-source "radium" "0.7.0"
                "02cxfi3ky3c4yhyqx9axqwhyaca804ws46nn4gc1imbk94nzycyw"))

(define rust-scoped-tls-1.0.1
  (crate-source "scoped-tls" "1.0.1"
                "15524h04mafihcvfpgxd8f4bgc3k95aclz8grjkg9a0rxcvn9kz1"))

(define rust-shlex-2.0.1
  (crate-source "shlex" "2.0.1"
                "1fjsll1cd7d2bcpdij9kd6w62rpbc7qqzvydvs021vsmr1cxvypq"))

(define rust-smallvec-1.16.1
  (crate-source "smallvec" "1.16.1"
                "14gqvsqdli51r1bii3hfqv5vx1b9r0gic4br0x9fsixmy5b70ims"))

(define rust-tap-1.0.1
  (crate-source "tap" "1.0.1"
                "0sc3gl4nldqpvyhqi3bbd0l9k7fngrcl4zs47n314nqqk4bpx4sm"))

(define rust-unicode-ident-1.0.26
  (crate-source "unicode-ident" "1.0.26"
                "0m3915ipi4zz7isncf5k1dz47ys0nq9j7l4l2n2rm03zaxwg8ifj"))

(define rust-wayland-backend-0.1.2
  (crate-source "wayland-backend" "0.1.2"
                "1n1yi6vna23wfkrpk1j46sx5qbsijh50viha4sra73by8lkqxd21"))

(define rust-wayland-client-0.30.2
  (crate-source "wayland-client" "0.30.2"
                "1j3as2g1znrs2lpkksqcvx8pag85yiwwbcv6wb3lyrqgfxa9d728"))

(define rust-wayland-protocols-0.30.1
  (crate-source "wayland-protocols" "0.30.1"
                "0kcvvli38gdjb9c7dpa2s0ix4nnqfq7n2bbc39370kx9bhg10a1v"))

(define rust-wayland-scanner-0.30.1
  (crate-source "wayland-scanner" "0.30.1"
                "03ikmfwacsgbym2y4raf05knl1qjlgg81sy0174jxhzvayr77f5r"))

(define rust-wayland-sys-0.30.1
  ;; TODO REVIEW: Check bundled sources.
  (crate-source "wayland-sys" "0.30.1"
                "01man4ll2kyxp9x2934rhnf98522pzwsd2c6jwr73q08qqma1cln"))

(define rust-windows-aarch64-gnullvm-0.48.5
  (crate-source "windows_aarch64_gnullvm" "0.48.5"
                "1n05v7qblg1ci3i567inc7xrkmywczxrs1z3lj3rkkxw18py6f1b"))

(define rust-windows-aarch64-msvc-0.48.5
  (crate-source "windows_aarch64_msvc" "0.48.5"
                "1g5l4ry968p73g6bg6jgyvy9lb8fyhcs54067yzxpcpkf44k2dfw"))

(define rust-windows-i686-gnu-0.48.5
  (crate-source "windows_i686_gnu" "0.48.5"
                "0gklnglwd9ilqx7ac3cn8hbhkraqisd0n83jxzf9837nvvkiand7"))

(define rust-windows-i686-msvc-0.48.5
  (crate-source "windows_i686_msvc" "0.48.5"
                "01m4rik437dl9rdf0ndnm2syh10hizvq0dajdkv2fjqcywrw4mcg"))

(define rust-windows-link-0.2.1
  (crate-source "windows-link" "0.2.1"
                "1rag186yfr3xx7piv5rg8b6im2dwcf8zldiflvb22xbzwli5507h"))

(define rust-windows-sys-0.48.0
  ;; TODO REVIEW: Check bundled sources.
  (crate-source "windows-sys" "0.48.0"
                "1aan23v5gs7gya1lc46hqn9mdh8yph3fhxmhxlw36pn6pqc28zb7"))

(define rust-windows-targets-0.48.5
  (crate-source "windows-targets" "0.48.5"
                "034ljxqshifs1lan89xwpcy1hp0lhdh4b5n0d2z4fwjx2piacbws"))

(define rust-windows-x86-64-gnu-0.48.5
  (crate-source "windows_x86_64_gnu" "0.48.5"
                "13kiqqcvz2vnyxzydjh73hwgigsdr2z1xpzx313kxll34nyhmm2k"))

(define rust-windows-x86-64-gnullvm-0.48.5
  (crate-source "windows_x86_64_gnullvm" "0.48.5"
                "1k24810wfbgz8k48c2yknqjmiigmql6kk3knmddkv8k8g1v54yqb"))

(define rust-windows-x86-64-msvc-0.48.5
  (crate-source "windows_x86_64_msvc" "0.48.5"
                "0f4mdp895kkjh9zv8dxvn4pc10xr7839lf5pa9l0193i2pkgr57d"))

(define rust-wyz-0.5.1
  (crate-source "wyz" "0.5.1"
                "1vdrfy7i2bznnzjdl9vvrzljvs4s3qm8bnlgqwln6a941gy61wq5"))

(define ssss-separator 'end-of-crates)

;;;
;;; Cargo inputs.
;;;

(define-cargo-inputs lookup-cargo-inputs
  (extest-controller =>
                     (list rust-autocfg-1.5.1
                           rust-bitflags-1.3.2
                           rust-bitflags-2.13.2
                           rust-bitvec-1.1.1
                           rust-cc-1.4.7
                           rust-cfg-if-1.0.5
                           rust-cfg-aliases-0.2.2
                           rust-dlib-0.5.3
                           rust-downcast-rs-1.2.1
                           rust-evdev-0.13.2
                           rust-find-msvc-tools-0.1.13
                           rust-funty-2.0.0
                           rust-hermit-abi-0.3.9
                           rust-io-lifetimes-1.0.11
                           rust-libc-0.2.189
                           rust-libloading-0.8.9
                           rust-log-0.4.34
                           rust-memchr-2.8.3
                           rust-memoffset-0.7.1
                           rust-nix-0.26.4
                           rust-nix-0.29.0
                           rust-once-cell-1.21.4
                           rust-pkg-config-0.3.34
                           rust-proc-macro2-1.0.107
                           rust-quick-xml-0.28.2
                           rust-quote-1.0.47
                           rust-radium-0.7.0
                           rust-scoped-tls-1.0.1
                           rust-shlex-2.0.1
                           rust-smallvec-1.16.1
                           rust-tap-1.0.1
                           rust-unicode-ident-1.0.26
                           rust-wayland-backend-0.1.2
                           rust-wayland-client-0.30.2
                           rust-wayland-protocols-0.30.1
                           rust-wayland-scanner-0.30.1
                           rust-wayland-sys-0.30.1
                           rust-windows-link-0.2.1
                           rust-windows-sys-0.48.0
                           rust-windows-targets-0.48.5
                           rust-windows-aarch64-gnullvm-0.48.5
                           rust-windows-aarch64-msvc-0.48.5
                           rust-windows-i686-gnu-0.48.5
                           rust-windows-i686-msvc-0.48.5
                           rust-windows-x86-64-gnu-0.48.5
                           rust-windows-x86-64-gnullvm-0.48.5
                           rust-windows-x86-64-msvc-0.48.5
                           rust-wyz-0.5.1)))
