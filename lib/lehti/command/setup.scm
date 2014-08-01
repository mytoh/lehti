
(define-library (lehti command setup)
    (export
      setup)
  ;; ** import
  (import (scheme base)
          (scheme write)
          (scheme file)
          (gauche base)
          (srfi 1)
          (srfi 13)
          (file util)
          (util match)
          (lehti base)
          (lehti lehspec)
          (lehti env))

  (begin

    (define (clean-list lst)
      (remove null? lst))

    (define (make-load-path)
      (append
          (clean-list
           (map (lambda (e)
                  (cond
                    ((file-exists? (build-path e "lib"))
                     (build-path e "lib"))
                    (else
                        '())))
             (directory-list (*lehti-dist-directory*)
                             :children? #true
                             :add-path? #true)))))

    (define (list->path lst)
      (cond
        ((= (length lst) 1)
         (car lst))
        (else
            (string-join lst ":"))))

    (define (list->path/fish lst)
      (cond
        ((= (length lst) 1)
         (car lst))
        (else
            (string-join lst " "))))

    (define (setup args)
      (match args
             (("load-path")
              (display (list->path (make-load-path))))
             (("load-path" "fish")
              (display (list->path (make-load-path))))))

    ))
