(define-module lehti.command.clean

  (export
    clean)

  ;; ** import
  (use file.util)
  (use lehti.env)

  ;; ** code
  (begin

    (define (clean args)
      (cond
        ((null? args)
         (for-each
             remove-directory*
           (directory-list (*lehti-cache-directory*)
                           :children? #t :add-path? #t)))))

    ))
