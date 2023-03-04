#lang racket/base
(require data-abstraction racket/runtime-path racket/promise
         (for-syntax racket/base racket/string))
(provide define-moviepy)

(define-runtime-path libdir "py")

(define-syntax (define-moviepy stx)
  (syntax-case stx ()
    ((_ lib
      ((binding (arg ...) ((key value) ...) out) ...)
      ((abstract body) ...))
     (with-syntax ((name (datum->syntax #'stx (string->symbol (syntax->datum #'lib))))
                   ((id ...) (map
                              (compose (lambda (s) (datum->syntax #'stx s))
                                       string->symbol
                                       (lambda (sym)
                                         (string-replace (symbol->string sym) "_" "-")))
                              (syntax->datum #'(binding ...)))))
       #'(begin
           (define mod (delay
                         (set-python-path (path->complete-path libdir))
                         (define m (import lib))
                         (at-exit (lambda () (decrement-reference m)))
                         m))
           (define-date
             name
             (lib simple-python-api)
             (representation
              (id (lazy-load (get-object-by-name (force mod) (quote binding))
                             (arg ...)
                             ((key value) ...)
                             out))
              ...)
             (abstraction
              (abstract body)
              ...)))))))
  
