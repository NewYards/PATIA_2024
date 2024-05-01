(define (domain graph-coloring)
  (:requirements :strips :typing)
  (:types color node)
  (:predicates
    (colored ?node - node)
    (adjacent ?node1 - node ?node2 - node)
    (color ?c - color)
  )

  (:action ColoredE
    :parameters (?node - node ?c - color)
    :precondition (and 
                    (not (colored ?node))
                    (forall (?adj - node)
                      (not (and (adjacent ?node ?adj) (colored ?adj ?c))))
                  )
    :effect (and 
              (colored ?node)
              (color ?c)
            )
  )
)
