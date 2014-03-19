
(define-library (lehti env)

    ;;; exports
    (export *lehti-dist-directory*
            *lehti-directory*
            *lehti-cache-directory*
            *lehti-bin-directory*
            *lehti-projects-repository-directory*
            *lehti-bundle-file*
            *projects-repository*)

  ;;; imports
  (import (scheme base)
          (scheme process-context)
          (srfi 98)
          (file util)
          (gauche parameter))

 ;;; code
  (begin

    (define *lehti-directory*
      (make-parameter
          (let ((env (get-environment-variable "lehti")))
            (if env
              env
              (build-path (get-environment-variable "HOME") ".config/lehti")))))

    (define *lehti-dist-directory*
      (make-parameter
          (build-path (*lehti-directory*) "dist")))

    (define *lehti-cache-directory*
      (make-parameter
          (build-path (*lehti-directory*) "cache")))


    (define *lehti-bin-directory*
      (make-parameter
          (build-path (*lehti-directory*) "bin")))

    (define *lehti-projects-repository-directory*
      (make-parameter
          (build-path (*lehti-directory*) "projects")))

    (define *projects-repository*
      (make-parameter "git://github.com/mytoh/lehti-projects"))

    (define *lehti-bundle-file*
      (make-parameter "Lehtifile"))

    ))
