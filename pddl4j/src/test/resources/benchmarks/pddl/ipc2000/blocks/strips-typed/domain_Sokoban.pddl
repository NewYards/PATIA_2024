(define (domain Sokoban)
(:requirements :typing)
(:types case target - place 

        box - box
        )

(:predicates (PusherAt ?y - place) 
             (BoxAt ?x - box ?y - place)
             (Free ?x - place)
             (PushLeft ?x - pusher ?z - place ?y - box ?a - place ?b - place)
             (PushRight ?x - pusher ?z - place ?y - box ?a - place ?b - place)
             (PushDown ?x - pusher ?z - place ?y - box ?a - place ?b - place)
             (PushUp ?x - pusher ?z - place ?y - box ?a - place ?b - place)
             (MoveLeft ?x - pusher ?y - place ?z -place)
             (MoveRight ?x - pusher ?y - place ?z -place)
             (MoveUp ?x - pusher ?y - place ?z -place)
             (MoveDown ?x - pusher ?y - place ?z -place)
             (Left ?x - place?y - place)
             (Right ?x - place ?y - place)
             (Up ?x - place ?y - place)
             (Down ?x - place ?y - place)
            )
	
(:action PushLeft
:parameters ( ?c1 - place ?b - box ?c2 - place ?c3 - place) 
:precondition (and (PusherAt ?c1) (BoxAt ?b ?c2) (Left ?c1 ?c2) (Left ?c2 ?c3) (Free ?c3))
:effect (and (not (PusherAt ?c1) (BoxAt ?b ?c2) (Free ?c3)) (PusherAt ?c2) (BoxAt ?b ?c3) (Free ?c1)))

(:action PushRight
:parameters ( ?c1 - place ?b - box ?c2 - place ?c3 - place) 
:precondition (and (PusherAt ?c1) (BoxAt ?b ?c2) (Right ?c1 ?c2) (Right ?c2 ?c3) (Free ?c3))
:effect (and (not (PusherAt ?c1) (BoxAt ?b ?c2) (Free ?c3)) (PusherAt ?c2) (BoxAt ?b ?c3) (Free ?c1)))

(:action PushUp
:parameters ( ?c1 - place ?b - box ?c2 - place ?c3 - place) 
:precondition (and (PusherAt ?c1) (BoxAt ?b ?c2) (Up ?c1 ?c2) (Up ?c2 ?c3) (Free ?c3))
:effect (and (not (PusherAt ?c1) (BoxAt ?b ?c2) (Free ?c3)) (PusherAt ?c2) (BoxAt ?b ?c3) (Free ?c1)))

(:action PushDown
:parameters ( ?c1 - place ?b - box ?c2 - place ?c3 - place) 
:precondition (and (PusherAt ?c1) (BoxAt ?b ?c2) (Down ?c1 ?c2) (Down ?c2 ?c3) (Free ?c3))
:effect (and (not (PusherAt ?c1) (BoxAt ?b ?c2) (Free ?c3)) (PusherAt ?c2) (BoxAt ?b ?c3) (Free ?c1)))

(:action MoveLeft
:parameters ( ?c1 - place ?c2 -place) 
:precondition (and (PusherAt ?c1) (Left ?c1 ?c2) (Free ?c2))
:effect (and (not (PusherAt ?c1) (Free ?c2)) (Free ?c1) (PusherAt ?c2)))

(:action MoveRight
:parameters ( ?c1 - place ?c2 -place) 
:precondition (and (PusherAt ?c1) (Right ?c1 ?c2) (Free ?c2))
:effect (and (not (PusherAt ?c1) (Free ?c2)) (Free ?c1) (PusherAt ?c2)))

(:action MoveUp
:parameters ( ?c1 - place ?c2 -place) 
:precondition (and (PusherAt ?c1) (Up ?c1 ?c2) (Free ?c2))
:effect (and (not (PusherAt ?c1) (Free ?c2)) (Free ?c1) (PusherAt ?c2)))

(:action MoveDown
:parameters ( ?c1 - place ?c2 -place) 
:precondition (and (PusherAt ?c1) (Down ?c1 ?c2) (Free ?c2))
:effect (and (not (PusherAt ?c1) (Free ?c2)) (Free ?c1) (PusherAt ?c2)))

)
