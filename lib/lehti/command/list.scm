
(define-module lehti.command.list
  (export
    list-packages)
  ;; ** import
  (use file.util)
  (use lehti.base)
  (use lehti.lehspec)
  (use lehti.env)

  (begin

    (define (list-packages args)
      (for-each
          (lambda (p)
            (format #t "~a\n" p))
        (map
            (lambda (path)
              (path-sans-extension path))
          (directory-list (build-path (*lehti-directory* ) "dist" ) :children? #t))))

    ))
