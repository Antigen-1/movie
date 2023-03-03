#lang racket/base
(require data-abstraction)

(define-data
  videoclip
  (lib simple-python-api "lib.rkt")
  (representation
   (read-videoclip (lazy-load (get-object-by-name moviepy 'VideoFileClip)
                              (_pyunicode)
                              ()
                              PyObj*))
   (append-videoclip
    (lazy-load
     (get-object-by-name moviepy 'concatenate_videoclips)
     ((pylistof PyObj*))
     ()
     PyObj*))
   (write-videoclip
    (lambda (c s)
      (decrement-reference
       ((lazy-load (check-and-handle-attribute c 'write_videofile get-attribute)
                   (_pyunicode)
                   ()
                   PyObj*)
        s))))
   (get-frames (lambda (c)
                 (define r
                   ((lazy-load (check-and-handle-attribute c 'iter_frames get-attribute)
                               ()
                               (("dtype" _pyunicode))
                               PyObj*)
                    #:dtype "uint8"))
                 (define f
                   ((lazy-load (check-and-handle-attribute r 'tolist get-attribute)
                               ()
                               ()
                               (pylistof (pylistof _pyssize)))))
                 (decrement-reference r)
                 f)))
   (stack-videoclips
    (lazy-load
     (get-object-by-name moviepy 'clips_array
                         ((pylistof (pylistof PyObj*)))
                         ()
                         PyObj*)))
   (resize-videoclip
    (lambda (c s)
      ((lazy-load (check-and-handle-attribute c 'resize get-attribute)
                  ()
                  (("new_size" (pytuple _pyssize _pyssize)))
                  PyObj*)
       #:new_size s))))
  (abstraction))
