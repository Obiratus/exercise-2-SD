(define
    (problem t1_1-scheduling-instance)
  (:domain t1-scheduling)

  (:objects
    ; Time slots during the day
    am9 am915 am930 am10 am1015 am1030 am11 am1115 am1130 am12 - time

    ; Inhabitants
    inhabitant1 inhabitant2 inhabitant3 inhabitant4 inhabitant5
    inhabitant6 inhabitant7 inhabitant8 inhabitant9 inhabitant10 - inhabitant

    ; Rooms
    room1 room2 room3 room4 room5 room6 room7 room8 room9 room10 - room
  )

  (:init
    ; Time slot availability
    (available am9)
    (available am915)
    (available am930)
    (available am10)
    (available am1015)
    (available am1030)
    (available am11)
    (available am1115)
    (available am1130)
    (available am12)

    ; Inhabitants' arrival times (extended with multiple times)
    (at inhabitant1 am9)
    (at inhabitant1 am915)

    (at inhabitant2 am915)
    (at inhabitant2 am930)

    (at inhabitant3 am930)
    (at inhabitant3 am10)

    (at inhabitant4 am10)

    (at inhabitant5 am1015)
    (at inhabitant5 am1030)

    (at inhabitant6 am1030)
    (at inhabitant6 am11)

    (at inhabitant7 am11)

    (at inhabitant8 am1115)
    (at inhabitant8 am1130)

    (at inhabitant9 am1130)

    (at inhabitant10 am12)

    ; Inhabitants needing setup in specific rooms
    (needs-setup inhabitant1 room1)
    (needs-setup inhabitant2 room2)
    (needs-setup inhabitant3 room3)
    (needs-setup inhabitant4 room4)
    (needs-setup inhabitant5 room5)
    (needs-setup inhabitant6 room6)
    (needs-setup inhabitant7 room7)
    (needs-setup inhabitant8 room8)
    (needs-setup inhabitant9 room9)
    (needs-setup inhabitant10 room10)
  )

  (:goal
    ; Goal: All inhabitants must be set up in their respective rooms
    (and
      (set-up inhabitant1 room1)
      (set-up inhabitant2 room2)
      (set-up inhabitant3 room3)
      (set-up inhabitant4 room4)
      (set-up inhabitant5 room5)
      (set-up inhabitant6 room6)
      (set-up inhabitant7 room7)
      (set-up inhabitant8 room8)
      (set-up inhabitant9 room9)
      (set-up inhabitant10 room10)
    )
  )
)