
(define-library (lehti command list)
    (export list-packages)
  (import (scheme base)
          (scheme write)
          (srfi 29)
          (gauche base)
          (file util)
          (lehti base)
          (lehti lehspec)
          (lehti env))

  (begin

    (define (list-packages args)
      (for-each
          (lambda (p)
            (display (format "~a\n" p)))
        (map
            (lambda (path)
              (path-sans-extension path))
          (directory-list (build-path (*lehti-directory* ) "dist") :children? #true))))

    ))
