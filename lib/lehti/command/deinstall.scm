
(define-library (lehti command deinstall)
    (export
      deinstall-package
      deinstall)
  (import (scheme base)
          (scheme write)
          (gauche base)
          (file util)
          (lehti base)
          (lehti util)
          (lehti env))

  (begin

    (define (deinstall args)
      (call-with-packages
       args
       (lambda (p)
         (display (string-append "deinstall " p))
         (newline)
         (deinstall-package p))))

    (define (deinstall-package package)
      (cond
        ((package-installed? package)
         (if (file-exists? (build-path (*lehti-bin-directory*) package))
           (remove-directory* (build-path (*lehti-bin-directory*) package)))
         (if (file-is-symlink? (build-path (*lehti-dist-directory*) package))
           (remove-file (build-path (*lehti-dist-directory*) package))
           (remove-directory* (build-path (*lehti-dist-directory*) package))))))

    ))
