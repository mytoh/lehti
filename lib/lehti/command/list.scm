
(define-library (lehti command list)
    (export list-packages)
  (import (scheme base)
          (gauche base)
          (file util)
          (lehti base)
          (lehti lehspec)
          (lehti env))

  (begin

    (define (list-packages args)
      (for-each
          (lambda (p)
            (format #true "~a\n" p))
        (map
            (lambda (path)
              (path-sans-extension path))
          (directory-list (build-path (*lehti-directory* ) "dist") :children? #true))))

    ))
