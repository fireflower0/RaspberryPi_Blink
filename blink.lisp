;; Load packages
(load "packages.lisp" :external-format :utf-8)

(in-package :cl-cffi)

;; Load wrapper API
(load "libwiringPi.lisp" :external-format :utf-8)

;; Define GPIO11(pin 23) with the name "+pin+"
(defconstant +pin+ 11)

(defun blink ()
  ;; Initialize GPIO
  (wiringPiSetupGpio)
  
  ;; Set GPIO11 to output mode
  (pinMode +pin+ 1)

  ;; Infinite loop: "Ctrl-c" to exit the loop
  (loop
    ;; Lights the LED with GPIO set to 3.3V
    (digitalWrite +pin+ 1)
    ;; 500ms wait
    (delay 500)
    ;; Set GPIO to 0V and turn off LED
    (digitalWrite +pin+ 0)
    ;; 500ms wait
    (delay 500)))

;; Blink execution
(blink)
