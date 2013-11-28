
(define-module lehti.command
  (export install
          deinstall
          clean
          specification
          list-packages
          projects
          environment
          setup
          search
          commands)
  (use lehti.command.install)
  (use lehti.command.deinstall)
  (use lehti.command.clean)
  (use lehti.command.specification)
  (use lehti.command.list)
  (use lehti.command.projects)
  (use lehti.command.environment)
  (use lehti.command.setup)
  (use lehti.command.commands)
  (use lehti.command.search)
  )
;; update
;; search
;; reinstall
;; fetch
;; contents
;; completion
;; clone
