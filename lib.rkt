#lang racket/base
(require simple-python-api racket/promise)
(provide moviepy)

(define moviepy (delay (let ((m (import "moviepy")))
                         (at-exit (lambda () (decrement-reference m)))
                         m)))
