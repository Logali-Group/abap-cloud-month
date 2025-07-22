class zcl_test_lock_object_lgl definition
  public
  final
  create public .

  public section.

    interfaces if_oo_adt_classrun .
  protected section.
  private section.
endclass.



class zcl_test_lock_object_lgl implementation.


  method if_oo_adt_classrun~main.


    try.

        data(lock) = cl_abap_lock_object_factory=>get_instance( iv_name = 'EZLGL_TRAVEL' ).

        lock->enqueue( it_parameter = value #( ( name = 'TRAVEL_UUID' value = ref #( '33672DE1EBD6EC7619004C661946323A' ) ) ) ).

        out->write( |Lock Time: { cl_abap_context_info=>get_system_time(  ) }| ).

        update zlgl_travel
           set booking_fee = '40.00'
           where travel_uuid = '33672DE1EBD6EC7619004C661946323A'.

        wait up to 30 seconds.

        if sy-subrc eq 0.
          commit work.
          out->write( |Updated OK| ).
        endif.

        lock->dequeue(  ).

        out->write( |Unlock Time: { cl_abap_context_info=>get_system_time( ) }| ).

      catch cx_abap_lock_failure into data(lx_lock_failer).

        out->write( |Lock Failure { lx_lock_failer->get_text( ) }| ).

      catch cx_abap_foreign_lock into data(lx_foreign_lock).

        data(locking_user) = lx_foreign_lock->user_name.
        out->write( |Lock by user { locking_user }| ).

    endtry.

  endmethod.
endclass.
