
(define-library (lehti util)
    (export
      call-with-packages
      package-installed?
      print)
  (import (scheme base)
          (scheme write)
          (file util)
          (lehti env))

  (begin

    (define (package-installed? package)
      (let ((dir (build-path (*lehti-dist-directory* ) package)))
        (eq? 'directory (file-type dir))))

    (define (call-with-packages package-list proc)
      (for-each
          (lambda (p)
            (proc p))
        package-list))

    (define (print x)
      (display x)
      (newline))

    ))
