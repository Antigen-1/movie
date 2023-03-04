#lang racket/base
(require "lib.rkt" simple-python-api)

(define-moviepy
  "clip"
  ((close-clip (PyObj*) () _pyvoid)
   (copy-clip (PyObj*) () PyObj*)
   (cut-clip (PyObj* _pydouble _pydouble) () PyObj*)
   (subclip (PyObj* _pydouble _pydouble) () PyObj*)
   (map-frames (PyObj* PyObj*)
               (("p" _pybool)
                ("o" PyObj*)
                ("d" _pybool))
               PyObj*)
   (set-fps (PyObj* _pyssize)
            ()
            PyObj*))
  ((call-with-clip (lambda (constructor proc)
                     (define c (constructor))
                     (dynamic-wind void
                                   (lambda () (proc c))
                                   (lambda () (close-clip c)))))))
