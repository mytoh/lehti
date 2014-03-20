
(define-library (lehti command deinstall)
    (export
      deinstall-package
      deinstall)
  (import (scheme base)
          (scheme write)
          (scheme file)
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

    (define (remove-bin-files package)
      (if (file-exists? (build-path (*lehti-bin-directory*) package))
        (delete-file (build-path (*lehti-bin-directory*) package))))

    (define (remove-dist-files package)
      (if (not (file-is-symlink? (build-path (*lehti-dist-directory*) package)))
        (remove-directory* (build-path (*lehti-dist-directory*) package))))

    (define (deinstall-package package)
      (cond
        ((package-installed? package)
         (remove-bin-files package)
         (remove-dist-files package))))

    ))
