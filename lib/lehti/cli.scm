
(define-library (lehti cli)
    (export run)
  (import (scheme base)
          (util match)
          (lehti command))

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
               ("bundle"
                (bundle rest))
               ("projects"
                (projects rest)))))

    ))
