(define-module lehti.command.specification

  (export
    specification)
  ;; ** import
  (use srfi-13)
  (use lehti.lehspec)
  (use lehti.env)
  (use lehti.base)

  ;; ** code
  (begin

    (define (specification args)
      (let* ((package (car args))
             (lehspec (package->lehspec package)))
        (format #t "~a ~a\n~a ~a\n~a\n~a\n"
                (paint "name:" 39)
                (spec.name lehspec)
                (paint "description:" 29)
                (spec.description lehspec)
                (paint "files:" 66)
                (string-join
                    (map (lambda (s)
                           (string-append "  - " s))
                      (spec.files lehspec))
                  "\n"))))

    ))
