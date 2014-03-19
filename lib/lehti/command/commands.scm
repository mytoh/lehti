(define-library (lehti command commands)
    (export
      commands)

    ;;; imports
  (import (scheme base)
          (gauche base)
          (file util)
          (lehti env)
          (lehti lehspec)
          (lehti util)
          (lehti scm))

  (begin

    (define (commands args)
      (for-each
          (lambda (c)
            (format #true "~a\n" c))
        (map (lambda (path) (path-sans-extension path))
          (directory-list (build-path (*lehti-directory* ) "lib/lehti/command")
                          :children? #true))))

    ))
