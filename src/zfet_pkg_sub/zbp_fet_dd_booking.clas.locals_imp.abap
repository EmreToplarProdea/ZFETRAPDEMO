CLASS lhc_Booking DEFINITION INHERITING FROM cl_abap_behavior_handler.
  PRIVATE SECTION.

    METHODS calculateBookingID FOR DETERMINE ON MODIFY
      IMPORTING keys FOR Booking~calculateBookingID.

    METHODS calculateTotalPrice FOR DETERMINE ON MODIFY
      IMPORTING keys FOR Booking~calculateTotalPrice.

ENDCLASS.

CLASS lhc_Booking IMPLEMENTATION.

  METHOD calculateBookingID.
    DATA max_bookingid TYPE /dmo/booking_id.
    DATA update TYPE TABLE FOR UPDATE ZFET_DD_FLIGHT\\Booking.

    " Read all travels for the requested bookings.
    " If multiple bookings of the same travel are requested, the travel is returned only once.
    READ ENTITIES OF ZFET_DD_FLIGHT IN LOCAL MODE
    ENTITY Booking BY \_Travel
      FIELDS ( TravelUUID )
      WITH CORRESPONDING #( keys )
      RESULT DATA(travels).

    " Process all affected Travels. Read respective bookings, determine the max-id and update the bookings without ID.
    LOOP AT travels INTO DATA(travel).
      READ ENTITIES OF ZFET_DD_FLIGHT IN LOCAL MODE
        ENTITY Flight BY \_Booking
          FIELDS ( BookingID )
        WITH VALUE #( ( %tky = travel-%tky ) )
        RESULT DATA(bookings).

      " Find max used BookingID in all bookings of this travel
      max_bookingid ='0000'.
      LOOP AT bookings INTO DATA(booking).
        IF booking-BookingID > max_bookingid.
          max_bookingid = booking-BookingID.
        ENDIF.
      ENDLOOP.

      " Provide a booking ID for all bookings that have none.
      LOOP AT bookings INTO booking WHERE BookingID IS INITIAL.
        max_bookingid += 10.
        APPEND VALUE #( %tky      = booking-%tky
                        BookingID = max_bookingid
                      ) TO update.
      ENDLOOP.
    ENDLOOP.

    " Update the Booking ID of all relevant bookings
    MODIFY ENTITIES OF ZFET_DD_FLIGHT IN LOCAL MODE
    ENTITY Booking
      UPDATE FIELDS ( BookingID ) WITH update
    REPORTED DATA(update_reported).

    reported = CORRESPONDING #( DEEP update_reported ).
  ENDMETHOD.

  METHOD calculateTotalPrice.

    " Read all travels for the requested bookings.
    " If multiple bookings of the same travel are requested, the travel is returned only once.
    READ ENTITIES OF ZFET_DD_FLIGHT IN LOCAL MODE
    ENTITY Booking BY \_Travel
      FIELDS ( TravelUUID )
      WITH CORRESPONDING #( keys )
      RESULT DATA(travels)
      FAILED DATA(read_failed).

    " Trigger calculation of the total price
    MODIFY ENTITIES OF ZFET_DD_FLIGHT IN LOCAL MODE
    ENTITY Flight
      EXECUTE recalcTotalPrice
      FROM CORRESPONDING #( travels )
    REPORTED DATA(execute_reported).

    reported = CORRESPONDING #( DEEP execute_reported ).

  ENDMETHOD.

ENDCLASS.
