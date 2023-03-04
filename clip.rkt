#lang racket/base
(require "lib.rkt" simple-python-api)

(define-moviepy
  "clip"
  ((close_clip (PyObj*) () PyObj*)
   (copy_clip (PyObj*) () PyObj*)
   (cut_clip (PyObj* _pydouble _pydouble) () PyObj*)
   (subclip (PyObj* _pydouble _pydouble) () PyObj*)
   (map_clips (PyObj* PyObj*)
              (("p" PyObj*)
               ("o" PyObj*)
               ("d" PyObj*))
              PyObj*)
   (set_fps (PyObj* _pyssize)
            ()
            PyObj*))
  ((call-with-clip (lambda (constructor proc)
                     (define c (constructor))
                     (dynamic-wind void
                                   (lambda () (proc c))
                                   (lambda () (close-clip c)))))))
