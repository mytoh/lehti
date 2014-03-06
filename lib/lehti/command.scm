
(define-library (lehti command)
    (export install
            deinstall
            clean
            specification
            list-packages
            projects
            environment
            setup
            search
            bundle
            commands)
  (import (scheme base)
          (lehti command install)
          (lehti command bundle)
          (lehti command deinstall)
          (lehti command clean)
          (lehti command specification)
          (lehti command list)
          (lehti command projects)
          (lehti command environment)
          (lehti command setup)
          (lehti command commands)
          (lehti command search))
  )
;; update
;; reinstall
;; fetch
;; contents
;; completion
;; clone
