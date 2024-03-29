(define (domain PUZZLE)
  (:requirements :strips :typing)
  (:types position case)
  (:predicates (on ?x - position ?y - case)
	       (clear ?x - position)
	       (close ?x - position ?y - position)
	       )

  (:action move
	     :parameters (?from - position ?y - case ?to - position)
	     :precondition (and (clear ?to) (close ?from ?to) (on ?from ?y))
	     :effect
	     (and (not (on ?to ?y))
                 (on ?to ?y)
              (not(on ?from ?y))
                 (clear ?from)
         ))
)
