(define (problem graph_coloring_problem)
    (:domain graph_coloring-domain)
    (:objects wa nt sa q nsw v - region
              r g b - color)
              
(:init
(is-not-colored wa)
(is-not-colored nt)
(is-not-colored sa)
(is-not-colored q)
(is-not-colored nsw)
(is-not-colored v)

(arc wa nt)
(arc wa sa)
(arc nt sa)
(arc nt q)
(arc sa q)
(arc sa nsw)
(arc sa v)
(arc q nsw)
(arc nsw v)

(is-diff r g)
(is-diff r b)
(is-diff g b)
)

(:goal (and
    (not-arc wa nt)
    (not-arc wa sa)
    (not-arc nt sa)
    (not-arc nt q)
    (not-arc sa q)
    (not-arc sa nsw)
    (not-arc sa v)
    (not-arc q nsw)
    (not-arc nsw v))
)
)