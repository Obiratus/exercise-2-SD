(define (domain t1_1-scheduling)

    (:requirements
        :strips
        :typing
        :negative-preconditions
    )

    (:types
        time inhabitant room
    )

    (:constants
        ; Define any constants here if needed (currently not used)
    )

    (:predicates
        (available ?t - time)                       ; Time slot availability
        (at ?i - inhabitant ?t - time)             ; Inhabitant arrival time
        (needs-setup ?i - inhabitant ?r - room)    ; Inhabitant must be set up in room
        (set-up ?i - inhabitant ?r - room)         ; Inhabitant has been set up
    )

    (:functions
        ; No numeric functions are needed for this domain
    )

    (:action showRoom
        :parameters (?t - time ?i - inhabitant ?r - room)
        :precondition (and
            (at ?i ?t)
            (needs-setup ?i ?r)
            (available ?t)
        )
        :effect (and
            (set-up ?i ?r)
            (not (available ?t))
        )
    )
)