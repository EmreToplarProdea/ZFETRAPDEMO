CLASS zfet_cl_crud DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
  INTERFACES if_oo_adt_classrun.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS ZFET_CL_CRUD IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.
*    " step 1 - READ
*    READ ENTITIES OF ZFET_DD_FLIGHT
*          ENTITY flight
*            FROM VALUE #( ( TravelUUID = 'DB440A705D96D1F8180098FA66DE7003' ) )
*          RESULT DATA(flights).
*
*    out->write( flights ).

*    " step 2 - READ with Fields
*    READ ENTITIES OF ZFET_DD_FLIGHT
*      ENTITY flight
*        FIELDS ( AgencyID CustomerID )
*      WITH VALUE #( ( TravelUUID = 'DB440A705D96D1F8180098FA66DE7003' ) )
*      RESULT DATA(travels).
*
*    out->write( travels ).

*   " step 3 - READ with All Fields
*    READ ENTITIES OF ZFET_DD_FLIGHT
*      ENTITY flight
*        ALL FIELDS
*      WITH VALUE #( ( TravelUUID = 'DB440A705D96D1F8180098FA66DE7003' ) )
*      RESULT DATA(travels).
*
*    out->write( travels ).
*
*    " step 4 - READ By Association
*    READ ENTITIES OF ZFET_DD_FLIGHT
*      ENTITY flight BY \_Booking
*        ALL FIELDS WITH VALUE #( ( TravelUUID = 'DB440A705D96D1F8180098FA66DE7003' ) )
*      RESULT DATA(bookings).
*
*    out->write( bookings ).

*    " step 5 - Unsuccessful READ
*    READ ENTITIES OF ZFET_DD_FLIGHT
*      ENTITY flight
*        ALL FIELDS WITH VALUE #( ( TravelUUID = '11111111111111111111111111111111' ) )
*      RESULT DATA(travels)
*      FAILED DATA(failed)
*      REPORTED DATA(reported).
*
*    out->write( travels ).
*    out->write( failed ).    " complex structures not supported by the console output
*    out->write( reported ).  " complex structures not supported by the console output
*
*    " step 6 - MODIFY Update
*    MODIFY ENTITIES OF ZFET_DD_FLIGHT
*      ENTITY flight
*        UPDATE
*          SET FIELDS WITH VALUE
*            #( ( TravelUUID  = 'DB440A705D96D1F8180098FA66DE7003'
*                 Description = 'I <3 MY KARIM' ) )
*
*     FAILED DATA(failed)
*     REPORTED DATA(reported).
*
*    " step 6b - Commit Entities
*    COMMIT ENTITIES
*      RESPONSE OF ZFET_DD_FLIGHT
*      FAILED     DATA(failed_commit)
*      REPORTED   DATA(reported_commit).
*
*    out->write( 'Update done' ).

*    " step 7 - MODIFY Create
*    MODIFY ENTITIES OF ZFET_DD_FLIGHT
*      ENTITY flight
*        CREATE
*          SET FIELDS WITH VALUE
*            #( ( %cid        = 'MyContentID_1'
*                 AgencyID    = '70012'
*                 CustomerID  = '14'
*                 BeginDate   = cl_abap_context_info=>get_system_date( )
*                 EndDate     = cl_abap_context_info=>get_system_date( ) + 10
*                 Description = 'I <3 MY KARIM' ) )
*
*     MAPPED DATA(mapped)
*     FAILED DATA(failed)
*     REPORTED DATA(reported).
*
*    out->write( mapped-flight ).
*
*    COMMIT ENTITIES
*      RESPONSE OF ZFET_DD_FLIGHT
*      FAILED     DATA(failed_commit)
*      REPORTED   DATA(reported_commit).
*
*    out->write( 'Create done' ).

*   " step 8 - MODIFY Delete
*    MODIFY ENTITIES OF ZFET_DD_FLIGHT
*      ENTITY flight
*        DELETE FROM
*          VALUE
*            #( ( TravelUUID  = '3A4DC3EF5E991EEF8981893E8F5DEC7F' ) )
*
*     FAILED DATA(failed)
*     REPORTED DATA(reported).
*
*    COMMIT ENTITIES
*      RESPONSE OF ZFET_DD_FLIGHT
*      FAILED     DATA(failed_commit)
*      REPORTED   DATA(reported_commit).
*
*    out->write( 'Delete done' ).

  ENDMETHOD.
ENDCLASS.
