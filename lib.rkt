#lang racket/base
(require simple-python-api)
(provide moviepy)

(define moviepy (delay (let ((m (import "moviepy")))
                         (at-exit (lambda () (decrement-reference m)))
                         m)))
