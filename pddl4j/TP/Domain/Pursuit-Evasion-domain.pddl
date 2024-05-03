(define (domain Pursuit-Evasion)
    (:requirements :strips :typing)
    (:types node pursuer)
    (:predicates (pursuer-at ?p - pursuer ?a - node)
        (no-pursuer-at ?a - node)
        (arc ?a - node ?b - node)
        (is-white ?a - node)
        (is-gray ?a - node)
    )

    (:action MOVE-FROM-TO-WHITE
        :parameters (?p - pursuer ?a - node ?b - node)
        :precondition (and (arc ?a ?b) (pursuer-at ?p ?a) (is-gray ?a) (is-white ?b))
        :effect (and (forall (?n -node) (when (arc ?a ?n) (TURN-TO-WHITE ?a ?n))) (not (pursuer-at ?p ?a)) (no-pursuer-at ?a) (pursuer-at ?p ?b) (is-gray ?b))
    )

    (:action MOVE-FROM-TO-GRAY
        :parameters (?p - pursuer ?a - node ?b - node)
        :precondition (and (arc ?a ?b) (pursuer-at ?p ?a) (is-gray ?a) (is-gray ?b) (no-pursuer-at ?b))
        :effect (and 
                 (forall (?n -node)
                    (when (arc ?a ?n)
                        (TURN-TO-WHITE ?a ?n)
                    )
                 )
                 (not (pursuer-at ?p ?a)) (no-pursuer-at ?a) (pursuer-at ?p ?b) (is-gray ?b))
    )

    (:action MOVE-FROM-PURSUER-TO-WHITE
        :parameters (?p1 - pursuer ?p2 - pursuer ?a - node ?b - node)
        :precondition (and (arc ?a ?b) (pursuer-at ?p1 ?a) (pursuer-at ?p2 ?a) (is-gray ?a) (is-white ?b))
        :effect (and (not (pursuer-at ?p1 ?a)) (pursuer-at ?p1 ?b) (is-gray ?b))
    )

    (:action MOVE-FROM-PURSUER-TO-GRAY
        :parameters (?p1 - pursuer ?p2 - pursuer ?a - node ?b - node)
        :precondition (and (arc ?a ?b) (pursuer-at ?p1 ?a) (pursuer-at ?p2 ?a) (is-gray ?a) (is-gray ?b) (no-pursuer-at ?b))
        :effect (and (not (pursuer-at ?p1 ?a)) (pursuer-at ?p1 ?b))
    )

    (:action MOVE-FROM-TO-PURSUER
        :parameters (?p1 - pursuer ?p2 - pursuer ?a - node ?b - node)
        :precondition (and (arc ?a ?b) (pursuer-at ?p1 ?a) (pursuer-at ?p2 ?b) (is-gray ?a) (is-gray ?b))
        :effect (and 
                 (forall (?n -node)
                    (when (arc ?a ?n)
                        (TURN-TO-WHITE ?a ?n)
                    )
                 )
                 (not (pursuer-at ?p1 ?a)) (pursuer-at ?p1 ?b))
    )

    (:action TURN-TO-WHITE
        :parameters (?a - node ?b - node)
        :precondition (and (arc ?a ?b) (is-gray ?a) (is-white ?b) (no-pursuer-at ?a))
        :effect (and (is-white ?a) (is-white ?b))
    )
)