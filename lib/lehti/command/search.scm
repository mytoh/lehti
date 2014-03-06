
(define-library (lehti command search)

    (export
      search)
  (import (scheme base)
          (scheme write)
          (gauche base)
          (srfi-1)
          (srfi-13)
          (file util)
          (util match)
          (lehti env)
          (lehti base)
          (lehti util))

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
