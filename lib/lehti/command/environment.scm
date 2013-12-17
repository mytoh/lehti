(define-module lehti.command.environment
  (export
    environment)
  ;; ** import
  (use srfi-13)
  (use file.util)
  (use lehti.base)
  (use lehti.lehspec)
  (use lehti.env)

  (begin

    (define (environment args)
      (display
          (string-join
              `("Lehti Environment:"
                ,(subject (paint "INSTALLATION DIRECTORY" 109) ": "  (*lehti-directory*))
                ,(subject (paint "LEHTI BIN PATHS" 28) ": " (*lehti-bin-directory*))
                ,(subject (paint "LEHTI LOAD PATHS" 128) ":" )
                ,@(map
                      (lambda (path)
                        (string-append
                            "     - " path))
                    (make-load-path)))
            "\n"
            'suffix)))

    (define (subject . strs)
      (apply string-append " - " strs))

    (define (make-load-path)
      (append
          (remove null?
            (map
                (lambda (e)
                  (cond
                    ((file-exists? (build-path e "lib"))
                     (build-path e "lib"))
                    (else
                        '())))
              (directory-list (*lehti-dist-directory*) :children? #t :add-path? #t)))))

    ))
