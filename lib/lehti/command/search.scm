
(define-module lehti.command.search

  (export
    search)
  ;; ** import
  (use srfi-1)
  (use srfi-13)
  (use file.util)
  (use util.match)
  (use lehti.env)
  (use lehti.base)
  (use lehti.util)

  (begin


    (define (all-packages)
      (let ((package-list (remove-dot-directory
                           (directory-list2 (*lehti-projects-repository-directory*)))))
        (for-each
            (lambda (p) (display p)
                    (newline))
          package-list)))

    (define (remove-dot-directory lst)
      (remove
          (lambda (x)
            (equal? (string-ref x 0) #\.))
        lst))

    (define (search-package package)
      (let ((package-list (remove-dot-directory
                           (directory-list2 (*lehti-projects-repository-directory*)))))
        (cond
          ((member package package-list)
           (display package)
           (newline))
          (else
              (format #t "~a not found!" package)
            (newline)))))

    (define (search args)
      (match args
        (()
         (all-packages))
        (else
            (if (file-exists? (*lehti-projects-repository-directory*))
              (search-package (car args))
              (display "please install lehti")))))


    ))
