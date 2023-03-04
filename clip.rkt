#lang racket/base
(require "lib.rkt" simple-python-api)

(define-moviepy
  "clip"
  ((close-clip (PyObj*) () PyObj*)
   (copy-clip (PyObj*) () PyObj*)
   (cut-clip (PyObj* _pydouble _pydouble) () PyObj*)
   (subclip (PyObj* _pydouble _pydouble) () PyObj*)
   (map-clips (PyObj* PyObj*)
              (("p" PyObj*)
               ("o" PyObj*)
               ("d" PyObj*))
              PyObj*)
   (set-fps (PyObj* _pyssize)
            ()
            PyObj*))
  ((call-with-clip (lambda (constructor proc)
                     (define c (constructor))
                     (dynamic-wind void
                                   (lambda () (proc c))
                                   (lambda () (close-clip c)))))))
