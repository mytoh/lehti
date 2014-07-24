(define-library (lehti command specification)

    (export
      specification)
  ;; ** import
  (import (scheme base)
          (scheme write)
          (gauche)
          (srfi 13)
          (srfi 29)
          (lehti lehspec)
          (lehti env)
          (lehti base))

  ;; ** code
  (begin

    (define (specification args)
      (let* ((package (car args))
             (lehspec (package->lehspec package)))
        (display
            (format "~a ~a\n~a ~a\n~a\n~a\n"
              (paint "name:" 39)
              (spec.name lehspec)
              (paint "description:" 29)
              (spec.description lehspec)
              (paint "files:" 66)
              (string-join
                  (map (lambda (s)
                         (string-append "  - " s))
                    (spec.files lehspec))
                "\n")))))

    ))
