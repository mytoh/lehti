(define-module lehti.command.bundle
  (export
    bundle)
;;; import
  (use file.util)
  (use lehti.env)
  (use srfi-13)
  (use util.match)
  (use lehti.command.list)
  (use lehti.command.install)

;;; code
  (begin

    (define (read-bundle-file file)
      (map (lambda (line)
             (string-split line #\ ))
        (file->string-list file)))

    (define (do-command line)
      (let ((command (car line)))
        (match command
          ("install"
           (install-package (cadr line)))
          ("list"
           (list-packages line))
          (else
              (display "error")))))

    (define (bundle args)
      (let ((commands (read-bundle-file (*lehti-bundle-file*))))
        (for-each
            do-command
          commands)))

    ))
