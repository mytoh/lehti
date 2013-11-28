(define-module lehti.scm
  (export
    url-is-git?
    git-url-basename)
  (use file.util)

  (begin

    (define (url-is-git? url)
      (or (#/^git:\/\// url)
        (#/^[a-z]+:\/\/.*\.git/ url)))

    (define (git-url-basename url)
      (path-sans-extension (sys-basename url)))



    ))
