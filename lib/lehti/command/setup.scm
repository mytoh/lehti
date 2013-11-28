(define-module lehti.command.setup
  (export
    setup)
  ;; ** import
  (use srfi-1)
  (use srfi-13)
  (use file.util)
  (use util.match)
  (use lehti.base)
  (use lehti.lehspec)
  (use lehti.env)

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
             (directory-list (*lehti-dist-directory*) :children? #t :add-path? #t)))))

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
            (string-join lst ":"))))

    (define (setup args)
      (match args
        (("load-path")
         (display (list->path (make-load-path))))
        ))

    ))
