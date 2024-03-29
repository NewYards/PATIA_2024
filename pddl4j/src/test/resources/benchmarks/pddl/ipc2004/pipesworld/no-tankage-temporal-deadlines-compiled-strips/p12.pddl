
(define (problem p12-net2-b10-g4_dt0_instance)
  (:domain pipesworld_strips)
  (:objects

    	B0 B1 B4 B6 B7 B9 B3 B8 B2 B5 - batch-atom
	A1 A2 A3 - area
	S12 S13 - pipe
	

  )
  (:init
      (NN)

    ;; deliverable conds for all batches
      (deliverable B0)
      (deliverable B1)
      (deliverable B4)
      (deliverable B6)
      (deliverable B7)
      (deliverable B9)
      (deliverable B3)
      (deliverable B8)
      (deliverable B2)
      (deliverable B5)


    ;; deadlines for goal batches
      ;; Plan delivery time is 8.03
      ;; Plan delivery time is 4.01
      ;; Plan delivery time is 7.03
      ;; Plan delivery time is 5.01

    ;; speed of pipe segments
    	(= (speed S12) 2)
	(= (speed S13) 2)

    ;; All pipelines segments are in normal state
    		(normal S12)
		(normal S13)

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
	

    ;; Batch-atoms products
    	(is-product B0 gasoleo)
	(is-product B1 rat-a)
	(is-product B4 gasoleo)
	(is-product B6 gasoleo)
	(is-product B7 gasoleo)
	(is-product B9 lco)
	(is-product B3 lco)
	(is-product B8 gasoleo)
	(is-product B2 rat-a)
	(is-product B5 gasoleo)
	

    ;; Batch-atoms initially located in areas
    	(on B0 A1)
	(on B4 A2)
	(on B3 A3)
	(on B8 A3)
	(on B2 A3)
	(on B5 A1)
	

    ;; Batch-atoms initially located in pipes
    	(first B9 S12)
	(follow B1 B9)
	(last B1 S12)
	(first B7 S13)
	(follow B6 B7)
	(last B6 S13)
	
    ;; Unitary pipeline segments
    		(not-unitary S12)
		(not-unitary S13)

  )
  (:goal (and
        (P3)
    	(on B0 A2)
	(on B1 A2)
	(on B6 A2)
	(on B9 A3)
	
  ))

 


(:metric minimize (total-time))

)
