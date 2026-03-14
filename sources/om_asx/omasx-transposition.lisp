;============================================================================
; OM-SuperVP
; SuperVP sound analysis and processing for OM
;============================================================================
;
;   This program is free software. For information on usage 
;   and redistribution, see the "LICENSE" file in this distribution.
;
;   This program is distributed in the hope that it will be useful,
;   but WITHOUT ANY WARRANTY; without even the implied warranty of
;   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. 
;
;============================================================================
;;; SOUND PROCESSING
;;; Transposition, Pitch shifting, Time stretching, Band filter, Format filter, 
;;; Surface filter, Break-point filter, Clipping, Freezing, Gain ...
;;;
;;; OM_ASX functions by Hans Tutschku 25/10/98 IRCAM
;;; Integration/modifs for OM-SuperVP, M. Stroppa / J. Bresson 2019
;===================================================

(in-package :asx)

;;; new params : portamento / min-portamento
(om::defmethod! trans-melody ((LMIDIC list) 
                              (LDUR list)
                              (mirror integer)
                              (portamento number)
                              &key (min-portamento 0.001) 
                              filename)
  :initvals '(nil nil 6000 0.005 0.001 nil)
  :indoc '("list of midicents" "list of durations" "transposition axis in midicents" "duration of transition" 
           "minimum default value for portamento" "filename")
  :icon 999
  :doc"Generates a parameter file for supervp-transpositon from a melodic line."
  
  (let* ((times (om::ms->sec (om::dx->x 0 (om::flat LDUR))))
         (timeline (om::mat-trans    
                    (list (butlast times)
                          (cdr (om::om- times portamento)))))
    
         (data (loop for segment in timeline 
                     for pitch in (om::flat LMIDIC) 
                     append (list 
                             (list (first segment) (- pitch mirror))
                             (list (if (> (second segment) (first segment))
                                       (second segment)
                                     (+ (first segment) 0.05))
                                   (- pitch mirror))))))
               
    (if filename 
        (om:save-data data (om::svp-paramfile filename))
      data)
    ))
