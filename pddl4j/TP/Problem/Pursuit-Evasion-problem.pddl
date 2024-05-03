(define (problem Pursuit-Evasion)
(:domain Pursuit-Evasion)
(:objects 
n1 - node
n2 - node
n3 - node
n4 - node
n5 - node
p1 - pursuer
p2 - pursuer)

(init:
    (arc n1 n3)
    (arc n3 n1)
    (arc n2 n3)
    (arc n3 n2)
    (arc n3 n4)
    (arc n4 n3)
    (arc n3 n5)
    (arc n5 n3)
    (arc n4 n5)
    (arc n5 n4)
    (is-gray n1)
    (pursuer-at p1 n1)
    (pursuer-at p2 n1)
    (is-white n2)
    (is-white n3)
    (is-white n4)
    (is-white n5))

(goal: (and (is-gray n1)
            (is-gray n2)
            (is-gray n3)
            (is-gray n4)
            (is-gray n5)))
)