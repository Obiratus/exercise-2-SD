(define (domain t1_2-scheduling)
    (:requirements
        :strips
        :typing
        :negative-preconditions
    )

    (:types
        time inhabitant room worker
    )

    (:constants
        worker1 - worker ; The only maintenance worker in this scenario
    )

    (:predicates
        (available ?t - time)                      ; Time slot availability
        (at ?i - inhabitant ?t - time)             ; Inhabitant arrival time
        (needs-setup ?i - inhabitant ?r - room)    ; Inhabitant must be set up in room
        (set-up ?i - inhabitant ?r - room)         ; Inhabitant has been set up
        (in-room ?w - worker ?r - room)            ; Indicates that a worker is present in a specific room
        (unlocked ?r - room)                       ; Indicates that a room has been unlocked
    )

    (:functions
        ; No numeric functions are required
    )

    ; Unlock Action
    (:action unlock
        :parameters (?t - time ?w - worker ?r - room)
        :precondition (and
            (available ?t)         ; Time slot must be available
        )
        :effect (and
            (unlocked ?r)          ; Mark the room as unlocked
        )
    )

    ; Join Room Action (worker enters the room)
    (:action join
        :parameters (?t - time ?w - worker ?r - room)
        :precondition (and
            (unlocked ?r)          ; Room must be unlocked
            (available ?t)         ; Time slot must still be available
        )
        :effect (and
            (in-room ?w ?r)        ; Worker is now in the room
        )
    )

    ; Show Room Action (Setting up the inhabitant)
    (:action showRoom
        :parameters (?t - time ?w - worker ?i - inhabitant ?r - room)
        :precondition (and
            (at ?i ?t)             ; Inhabitant arrives at this time
            (needs-setup ?i ?r)    ; Inhabitant needs the setup
            (in-room ?w ?r)        ; Worker must be present in the room
            (available ?t)         ; Time slot must still be available
        )
        :effect (and
            (set-up ?i ?r)         ; Inhabitant is set up in the room
            (not (available ?t))   ; Time slot is no longer available
        )
    )
)