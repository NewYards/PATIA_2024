(define (problem Sokoban-2)
(:domain Sokoban)(:objects C0 C1 C2 C3 C4 C5 C6 C7 C8 C9 C10 C11 C12 C13 C14 C15 C16 C17 C18 C19 C20 C21 - case
T0 T1 T2 T3 T4 - target
B0 B1 B2 B3 B4 B5 B6 B7 B8 B9 B10 B11 B12 B13 B14 B15 B16 B17 B18 B19 B20 B21 B22 B23 B24 - box)
(:INIT (Free C0) (Down C0 C2) (Right C0 C1) (Free C1) (Down C1 C3) (Left C1 C0) (Free C2) (Up C2 C0) (Right C2 C3) (Free C3) (Up C3 C1) (Left C3 C2) (Free C4) (Down C4 C6) (Right C4 C5) (Free C5) (Down C5 T0) (Left C5 C4) (Free C6) (Up C6 C4) (Down C6 T1) (Right C6 T0) (Free T0) (Up T0 C5) (Down T0 C11) (Left T0 C6) (Free C8) (Down C8 C12) (Right C8 C9) (Free C9) (Left C9 C8) (Right C9 T1) (BoxAt B10 T1) (Up T1 C6) (Down T1 C13) (Left T1 C9) (Right T1 C11) (Free C11) (Up C11 T0) (Down C11 C14) (Left C11 T1) (Free C12) (Up C12 C8) (Down C12 C15) (Free C13) (PusherAt C13) (Up C13 T1) (Down C13 T2) (Right C13 C14) (Free C14) (Up C14 C11) (Down C14 C18) (Left C14 C13) (Free C15) (Up C15 C12) (Right C15 C17) (BoxAt B16 C17) (Down C17 C19) (Left C17 C15) (Right C17 T2) (BoxAt B17 T2) (Up T2 C13) (Down T2 C20) (Left T2 C17) (Right T2 C18) (Free C18) (Up C18 C14) (Down C18 C21) (Left C18 T2) (Free C19) (Up C19 C17) (Right C19 C20) (Free C20) (Up C20 T2) (Left C20 C19) (Right C20 C21) (Free C21) (Up C21 C18) (Left C21 C20) )
(:goal (and (Boxed T0) (Boxed T1) (Boxed T2) ))
)
