#lang racket/base
(require "lib.rkt")

(define-moviepy
  "videoclip"
  ((read_videoclip (_pyunicode) () PyObj*)
   (get_height (PyObj*) () _pyssize)
   (get_width (PyObj*) () _pyssize)
   (get_frames_num (PyObj*) () _pyssize)
   (resize_videoclip (PyObj* _pydouble) () PyObj*)
   (rotate_videoclip (PyObj* _pydouble) () PyObj*)
   (extract_subregion (PyObj* (pylist _pyssize _pyssize) (pylist _pyssize _pyssize))
                      ()
                      PyObj*)
   (mirror_x (PyObj*)
             ()
             PyObj*)
   (mirror_y (PyObj*
              ()
              PyObj*))
   (save_frame (PyObj* _pyunicode _pydouble)
               ()
               PyObj*)
   (write_videoclip (PyObj* _pyunicode)
                    ()
                    PyObj*)
   (write_videoclip_to_gif
    (PyObj* _pyunicode)
    ()
    PyObj*)
   (write_videoclip_to_images
    (PyObj* _pyunicode)
    ()
    PyObj*))
  ())