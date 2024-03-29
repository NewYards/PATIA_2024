(define (domain graph_coloring-domain)
    (:requirements :strips :typing)
    (:types region color)
    (:predicates
        (is-not-colored ?r - region)
        (is-colored ?r - region ?c - color)
        (arc ?r1 - region ?r2 - region)
        (not-arc ?r1 - region ?r2 - region)
        (is-diff ?c1 - color ?c2 - color)
    )
    
    (:action first-paint
        :parameters (?r1 - region ?r2 - region ?c1 - color ?c2 - color)
        :precondition (and (arc ?r1 ?r2) (is-diff ?c1 ?c2) (is-not-colored ?r1) (is-not-colored ?r2))
        :effect
        (and (is-colored ?r1 ?c1)
            (is-colored ?r2 ?c2)
            (not (is-not-colored ?r1))
            (not (is-not-colored ?r2))
            (not-arc ?r1 ?r2)
        )
    )

    (:action paint
        :parameters (?r1 - region ?r2 - region ?r3 - region ?c1 - color ?c2 - color ?c3 - color)
        :precondition (and (arc ?r1 ?r2) (arc ?r1 ?r3) (is-diff ?c1 ?c2) 
        (is-diff ?c1 ?c3) (is-diff ?c2 ?c3) (is-not-colored ?r1) (is-colored ?r2 ?c2) (is-colored ?r3 ?c3))
        :effect
        (and (is-colored ?r1 ?c1)
            (not-arc ?r1 ?r2)
            (not-arc ?r1 ?r3)
        )
    )
)