(define-library (lehti command clean)
    (export
      clean)
  (import (scheme base)
          (scheme write)
          (file util)
          (lehti env))

  ;; ** code
  (begin

    (define (clean args)
      (cond
        ((null? args)
         (for-each
             (lambda (d)
               (remove-directory* d)
               (display (string-append "clean " d))
               (newline))
           (directory-list (*lehti-cache-directory*)
                           :children? #t :add-path? #t)))))

    ))
