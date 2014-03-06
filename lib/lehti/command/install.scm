
(define-library (lehti command install)
    (export install
            install-package)
  (import (scheme base)
          (scheme write)
          (gauche base)
          (file util)
          (gauche process)
          (lehti env)
          (lehti lehspec)
          (lehti util)
          (lehti scm))

  ;;; code
  (begin

    (define (fetch-package url package)
      (let ((tmpdir (*lehti-cache-directory*)))
        (make-directory* tmpdir)
        (current-directory tmpdir)
        (cond
          ((url-is-git? url)
           (when (file-exists? package)
             (delete-directory* package))
           (run-process `(git clone -q ,url ,package) :wait #t))
          (else
              (print "not supported url")))))


    (define (install args)
      (let ((packages args))
        (for-each
            (lambda (p)
              (if (url-is-git? p)
                (install-git-package p)
                (install-package p)))
          packages)))

    (define (install-package package)
      (get-projects-repository)
      (cond
        ((and (not (package-installed? package)))
         (fetch-package (cadr (search-project-address package)) package)
         (current-directory (build-path (*lehti-cache-directory*)
                                        package))
         (let* ((cache-directory (build-path (*lehti-cache-directory*) package))
                (lehspec (get-package-spec package)))
           (install-lehspec-package-files lehspec)
           (make-executables package)
           (remove-directory* cache-directory)))
        ((package-installed? package)
         (print "package already installed"))))

    (define (install-git-package url)
      (let ((package (git-url-basename url)))
        (cond
          ((not (package-installed? package))
           (fetch-package url package)
           (current-directory (build-path (*lehti-cache-directory*)
                                          package))
           (let* ((cache-directory (build-path (*lehti-cache-directory*) package))
                  (lehspec (get-package-spec package)))
             (install-lehspec-package-files lehspec)
             (make-executables package)
             (remove-directory* cache-directory)))
          ((package-installed? package)
           (print "package already installed")))))

    (define (install-lehspec-package-files spec)
      (let ((files (spec.files spec))
            (package-name (spec.name spec)))
        (make-directory* (build-path (*lehti-dist-directory*) package-name))
        (for-each
            (lambda (file)
              (cond
                ((file-is-directory? file)
                 (make-directory* (build-path (*lehti-dist-directory*) package-name file)))
                (else
                    (make-directory* (build-path (*lehti-dist-directory*) package-name (sys-dirname file)))
                  (copy-file file (build-path (*lehti-dist-directory*) package-name file)))))
          files)))

    (define (get-projects-repository)
      (cond
        ((not (file-exists? (*lehti-projects-repository-directory*)))
         (run-process `(git clone ,(*projects-repository*) ,(*lehti-projects-repository-directory*)) :wait #t))
        (else
            (update-projects-repository))))

    (define (update-projects-repository)
      (run-process '(git pull) :wait #t :directory (*lehti-projects-repository-directory*)))

    (define (project-exists? package)
      (member package (directory-list2 (*lehti-projects-repository-directory*) :children? #t)))

    (define (search-project-address package)
      (if (project-exists? package)
        (car (file->sexp-list (build-path (*lehti-projects-repository-directory*)
                                          package "source.scm")))
        (error "project does not exist!")))

    (define (get-package-spec package)
      (let ((cache-directory (build-path (*lehti-cache-directory*) package)))
        (spec (cdar (file->sexp-list
                     (build-path cache-directory
                                 (path-swap-extension package "lehspec")))))))

    (define (directory-exists-or . dirs)
      (if (null? dirs)
        #f
        (if (file-exists? (car dirs))
          (car dirs)
          (apply directory-exists-or (cdr dirs)))))

    (define (make-executables package)
      (let ((bin-dir (directory-exists-or
                      (build-path (*lehti-dist-directory*)
                                  package "script")
                      (build-path (*lehti-dist-directory*)
                                  package "bin"))))
        (if (and bin-dir
              (file-exists? bin-dir))
          (for-each
              (lambda (f)
                (run-process `(chmod +x ,(build-path bin-dir f)) :wait #t)
                (sys-symlink (build-path bin-dir f)
                             (build-path (*lehti-bin-directory*) f)))
            (directory-list bin-dir :children? #t)))))



    ))
