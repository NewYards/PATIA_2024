(define (problem Sokoban-1-0)
(:domain Sokoban)
(:objects C1 C2 C3 - case
            C4 - target
            B - box)
(:INIT (Free C1) (Free C3) (Free C4) (Right C1 C2) (Right C2 C3) (Right C3 C4) (Left C4 C3) (Left C3 C2) (Left C2 C1) (BoxAt B C2) (PusherAt C1) )

(:goal (and (Boxed C4)))
)
