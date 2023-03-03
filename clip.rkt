#lang racket/base
(require data-abstraction)

(define-data
  clip
  (lib simple-python-api)
  (representation
   (subclip (lambda (c s e)
              ((lazy-load (check-and-handle-attribute c 'subclip get-attribute)
                          (_pyssize _pyssize)
                          ()
                          PyObj*)
               s e)))
   (close-clip (lambda (c)
                 ((compose
                   decrement-reference
                   (lazy-load (check-and-handle-attribute c 'close get-attribute)
                              ()
                              ()
                              PyObj*)))))
   (copy-clip (lambda (c)
                ((lazy-load (check-and-handle-attribute c 'copy get-attribute)
                            ()
                            ()
                            PyObj*))))
   (cutout-clip (lambda (c s e)
                  ((lazy-load (check-and-handle-attribute c 'cutout get-attribute)
                              ;;only as seconds
                              (_pyssize _pyssize)
                              ()
                              PyObj*)
                   s e)))
   )
  (abstraction
   (call-with-clip
    (lambda (constructor proc)
      (define c (constructor))
      (dynamic-wind void
                    (lambda () (proc c))
                    (lambda () (close-clip c)))))))
