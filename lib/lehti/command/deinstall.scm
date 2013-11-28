
(define-module lehti.command.deinstall
  (export
    deinstall-package
    deinstall)

  (use file.util)
  (use lehti.base)
  (use lehti.util)
  (use lehti.env)

  (begin

    (define (deinstall args)
      (call-with-packages
       args
       (lambda (p)
         (display (string-append "deinstall " p))
         (deinstall-package p))))

    (define (deinstall-package package)
      (cond
        ((package-installed? package)
         (if (file-exists? (build-path (*lehti-bin-directory*) package))
           (remove-directory* (build-path (*lehti-bin-directory*) package)))
         (if (file-is-symlink? (build-path (*lehti-dist-directory*) package))
           (remove-file (build-path (*lehti-dist-directory*) package))
           (remove-directory* (build-path (*lehti-dist-directory*) package))))))

    ))
