*&---------------------------------------------------------------------*
*& Report  Z_OOP_003
*&
*&---------------------------------------------------------------------*


REPORT  z_oop_003.

*----------------------------------------------------------------------*
*       CLASS lcl_vehicle DEFINITION
*----------------------------------------------------------------------*
CLASS lcl_vehicle DEFINITION.
  PUBLIC SECTION.
    METHODS: accelerate IMPORTING delta TYPE i,
             show_speed.

  PRIVATE SECTION.
    DATA speed TYPE i.
ENDCLASS.                    "lcl_vehicle DEFINITION


*----------------------------------------------------------------------*
*       CLASS lcl_vehicle IMPLEMENTATION
*----------------------------------------------------------------------*
CLASS lcl_vehicle IMPLEMENTATION.

  METHOD accelerate.
    me->speed = me->speed + delta.
  ENDMETHOD.                    "accelerate

  METHOD show_speed.    
    WRITE: / me->speed.
  ENDMETHOD.                    "show_speed
ENDCLASS.                    "lcl_vehicle IMPLEMENTATION


START-OF-SELECTION.
  DATA: vehicle     TYPE REF TO lcl_vehicle,
        vehicle_tab TYPE TABLE OF REF TO lcl_vehicle,
        lv_speed    TYPE i.

  lv_speed = 10.
  DO 5 TIMES.
    CREATE OBJECT vehicle.
    vehicle->accelerate( lv_speed ).
    APPEND vehicle TO vehicle_tab.

    lv_speed = lv_speed + 10.
  ENDDO.

  LOOP AT vehicle_tab INTO vehicle.
    vehicle->show_speed( ).
  ENDLOOP.