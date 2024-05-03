(define (domain coloriage-graphe)
  (:requirements :strips :typing :disjunctive-preconditions)
  (:types noeud couleur arete)
  (:predicates
    (colorie ?noeud - noeud ?couleur - couleur)
    (non-colorie ?noeud - noeud)
    (adjacent ?noeud1 - noeud ?noeud2 - noeud ?arete1 - arete)
    (couleur-differente ?couleur1 - couleur ?couleur2 - couleur)
    (isole ?noeud - noeud)
    (marquee ?arete - arete)
    (non-marquee ?arete - arete)
  )

  (:action colorier-noeud-isole
    :parameters (?noeud - noeud ?couleur - couleur)
    :precondition (and (non-colorie ?noeud) (isole ?noeud))
    :effect (and (colorie ?noeud ?couleur) (not (non-colorie ?noeud)))
  )

  (:action colorier-noeuds-adjacents
  :parameters (?noeud1 - noeud ?noeud2 - noeud ?couleur1 - couleur ?couleur2 - couleur ?arete1 - arete)
  :precondition (and
    (adjacent ?noeud1 ?noeud2 ?arete1)
    (non-marquee ?arete1)
    (couleur-differente ?couleur1 ?couleur2)
    (or
      (and (colorie ?noeud1 ?couleur1) (non-colorie ?noeud2))
      (and (non-colorie ?noeud1) (non-colorie ?noeud2))
    )
  )
  :effect (and
    (colorie ?noeud1 ?couleur1)
    (colorie ?noeud2 ?couleur2)
    (not (non-colorie ?noeud1))
    (not (non-colorie ?noeud2))
    (marquee ?arete1)
    (not (non-marquee ?arete1))
  )
)
)
