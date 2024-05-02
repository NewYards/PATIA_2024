;; verified (solution exists)

(define (problem p27-net3-b18-g6)
  (:domain pipesworld_strips)
  (:objects
   B10 B17 B14 B4 B6 B15 B13 B8 B2 B11 B5 B0 B1 B7 B12 B9 B3 B16 - batch-atom
   A1 A2 A3 A4 - area
   S12 S13 S34 - pipe
   )

  (:init
   ;; speed of pipe segments
   (= (speed S12) 2)
   (= (speed S13) 2)
   (= (speed S34) 1)
   ;; All pipelines segments are in normal state
   (normal S12)
   (normal S13)
   (normal S34)
   ;; Interfaces restrictions
   (may-interface lco lco)
   (may-interface gasoleo gasoleo)
   (may-interface rat-a rat-a)
   (may-interface oca1 oca1)
   (may-interface oc1b oc1b)
   (may-interface lco gasoleo)
   (may-interface gasoleo lco)
   (may-interface lco oca1)
   (may-interface oca1 lco)
   (may-interface lco oc1b)
   (may-interface oc1b lco)
   (may-interface lco rat-a)
   (may-interface rat-a lco)
   (may-interface gasoleo rat-a)
   (may-interface rat-a gasoleo)
   (may-interface gasoleo oca1)
   (may-interface oca1 gasoleo)
   (may-interface gasoleo oc1b)
   (may-interface oc1b gasoleo)
   (may-interface oca1 oc1b)
   (may-interface oc1b oca1)
   ;; Network topology definition
   (connect A1 A2 S12)
   (connect A1 A3 S13)
   (connect A3 A4 S34)
   ;; Batch-atoms products
   (is-product B10 gasoleo)
   (is-product B17 oca1)
   (is-product B14 gasoleo)
   (is-product B4 oc1b)
   (is-product B6 gasoleo)
   (is-product B15 lco)
   (is-product B13 oca1)
   (is-product B8 oca1)
   (is-product B2 gasoleo)
   (is-product B11 oca1)
   (is-product B5 lco)
   (is-product B0 oc1b)
   (is-product B1 oc1b)
   (is-product B7 oca1)
   (is-product B12 oca1)
   (is-product B9 rat-a)
   (is-product B3 oc1b)
   (is-product B16 rat-a)
   ;; Batch-atoms initially located in areas
   (on B14 A2)
   (on B4 A3)
   (on B13 A1)
   (on B8 A4)
   (on B2 A4)
   (on B11 A4)
   (on B5 A3)
   (on B1 A1)
   (on B7 A1)
   (on B12 A1)
   (on B9 A1)
   (on B3 A1)
   (on B16 A3)
   ;; Batch-atoms initially located in pipes
   (first B0 S12)
   (follow B10 B0)
   (last B10 S12)
   (first B15 S13)
   (follow B6 B15)
   (last B6 S13)
   (first B17 S34)
   (last B17 S34)
   ;; Unitary pipeline segments
   (not-unitary S12)
   (not-unitary S13)
   (unitary S34)
   )

  (:goal (and
	  (on B17 A1)
	  (on B4 A2)
	  (on B6 A2)
	  (on B11 A3)
	  (on B1 A2)
	  (on B3 A3)
	  ))

  (:constraints (and
		 (within 8.1 (on b17 a1))
		 (within 11.1 (on b3 a3))
		 (within 4.6 (on b11 a3))
		 (within 9.1 (on b1 a2))
		 (within 8.1 (on b6 a2))
		 (within 6.1 (on b4 a2))
		 (always-within 8.6 (on b15 a1) (follow b15 b13))
		 (always-within 3.6 (on b15 a1) (follow b4 b15))
		 (always-within 1.1 (on b15 a1) (on b6 a1))
		 (always-within 4.6 (on b15 a1) (follow b15 b6))
		 (always-within 3.6 (on b15 a1) (first b15 s12))
		 (always-within 5.1 (on b15 a1) (last b15 s12))
		 (always-within 4.6 (on b6 a1) (follow b6 b1))
		 (always-within 3.6 (on b6 a1) (first b6 s12))
		 (always-within 5.1 (on b6 a1) (last b6 s12))
		 (always-within 0.6 (on b4 a1) (follow b0 b4))
		 (always-within 0.6 (on b4 a1) (first b4 s12))
		 (always-within 2.1 (on b11 a3) (on b16 a3))
		 (always-within 4.1 (on b11 a3) (on b5 a3))
		 (always-within 5.1 (on b17 a3) (first b17 s13))
		 (always-within 3.6 (on b17 a3) (follow b17 b3))
		 (always-within 4.6 (on b17 a3) (follow b5 b17))
		 (always-within 2.0 (on b17 a3) (on b16 a3))
		 (always-within 3.0 (on b17 a3) (on b5 a3))
		 (always-within 2.6 (on b15 a2) (follow b15 b13))
		 (always-within 2.6 (on b15 a2) (last b15 s12))
		 ))

  )