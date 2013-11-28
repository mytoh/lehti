
(define-module lehti.cli

  (export run)
  (use util.match)
  (use lehti.command)

  (begin

    (define (run args)
      (let ((command (cadr args))
            (rest (cddr args)))
        (match command
          ("install"
           (install rest))
          ("clean"
           (clean rest))
          ("spec"
           (specification rest))
          ("list"
           (list-packages rest))
          ("env"
           (environment rest))
          ("setup"
           (setup rest))
          ("search"
           (search rest))
          ("deinstall"
           (deinstall rest))
          ("commands"
           (commands rest))
          ("projects"
           (projects rest)))))

    ))
