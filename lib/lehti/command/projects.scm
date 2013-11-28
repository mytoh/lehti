
(define-module lehti.command.projects

  (export
    projects)
  ;; ** import
  (use srfi-1)
  (use file.util)
  (use lehti.env)
  (use lehti.base)
  (use lehti.util)

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
                     (directory-list2 (*lehti-projects-repository-directory*) :children? #t))))
           (print (paint "lehti projects" 44))
           (for-each print lst)))))

    (define (projects args)
      (projects-list))

    ))
