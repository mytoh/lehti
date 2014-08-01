
(define-library (lehti command projects)
    (export
      projects)
  (import (scheme base)
          (scheme file)
          (gauche base)
          (srfi 1)
          (file util)
          (lehti env)
          (lehti base)
          (lehti util))
  (begin

    (define (remove-dot-directory lst)
      (remove
          (lambda (x)
            (equal? (string-ref x 0) #\.))
        lst))

    (define (projects-list)
      (cond
        ((file-exists? (*lehti-projects-repository-directory*))
         (let ((lst (remove-dot-directory
                     (directory-list2 (*lehti-projects-repository-directory*)
                                      :children? #true))))
           (print (paint "lehti projects" 44))
           (for-each print lst)))))

    (define (projects args)
      (projects-list))

    ))
