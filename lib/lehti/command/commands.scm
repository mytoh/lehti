(define-module lehti.command.commands
  (export
    commands)

    ;;; imports
  (use file.util)
  (use lehti.env)
  (use lehti.lehspec)
  (use lehti.util)
  (use lehti.scm)


  (begin

    (define (commands args)
      (for-each
          (lambda (c)
            (format #t "~a\n" c))
        (map (lambda (path) (path-sans-extension path))
          (directory-list (build-path (*lehti-directory* ) "lib/lehti/command") :children? #t))))

    ))
