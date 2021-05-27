*&---------------------------------------------------------------------*
*& Report  Z_OOP_003
*&
*&---------------------------------------------------------------------*


REPORT  z_oop_003.

*----------------------------------------------------------------------*
*       CLASS lcl_vehicle DEFINITION
*----------------------------------------------------------------------*
CLASS lcl_vehicle DEFINITION CREATE PRIVATE.
  PUBLIC SECTION.
    CLASS-METHODS get_instance RETURNING value(ref_vehicle) 
      TYPE REF TO lcl_vehicle.

    METHODS: accelerate IMPORTING delta TYPE i,
             show_speed.

  PRIVATE SECTION.
    CLASS-DATA: vehicle_obj TYPE REF TO lcl_vehicle.
    DATA speed TYPE i.
ENDCLASS.                    "lcl_vehicle DEFINITION


*----------------------------------------------------------------------*
*       CLASS lcl_vehicle IMPLEMENTATION
*----------------------------------------------------------------------*
CLASS lcl_vehicle IMPLEMENTATION.
  METHOD get_instance.
    IF vehicle_obj IS NOT BOUND.
      CREATE OBJECT vehicle_obj.
    ENDIF.
    ref_vehicle = vehicle_obj.
  ENDMETHOD.                    "get_instance

  METHOD accelerate.
    me->speed = me->speed + delta.
  ENDMETHOD.                    "accelerate

  METHOD show_speed.
    WRITE: / me->speed.
  ENDMETHOD.                    "show_speed
ENDCLASS.                    "lcl_vehicle IMPLEMENTATION


START-OF-SELECTION.
  DATA: vehicle1 TYPE REF TO lcl_vehicle,
        vehicle2 TYPE REF TO lcl_vehicle.

  vehicle1 = lcl_vehicle=>get_instance( ).
  vehicle1->accelerate( 35 ).
  vehicle1->show_speed( ).

  vehicle2 = lcl_vehicle=>get_instance( ).
  vehicle2->accelerate( 20 ).
  vehicle2->show_speed( ).

  vehicle1->show_speed( ).