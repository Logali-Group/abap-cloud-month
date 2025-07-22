class zcl_auth_ckeck_lgl definition
  public
  final
  create public .

  public section.

    interfaces if_oo_adt_classrun .

    constants: c_auth_object type c length 10 value 'ZAO_A_LGL',
               c_field_name  type c length 10 value 'ZAF_A_LGL'.

    types ty_operation type c length 2.

    methods check_auth importing iv_agency_id          type /dmo/agency_id
                                 iv_operation          type ty_operation
                       returning value(rv_auth_result) type abap_boolean.

  protected section.
  private section.
endclass.



class zcl_auth_ckeck_lgl implementation.


  method if_oo_adt_classrun~main.

    if me->check_auth( iv_agency_id = '070005' iv_operation = '03' ).
      out->write( |Authorization check passed for agency ID: 070005| ).
    else.
      out->write( |Authorization check failed for agency ID: 070005| ).
    endif.

  endmethod.

  method check_auth.

    if iv_agency_id is initial.
      rv_auth_result = abap_false.
      return.
    endif.

    authority-check object c_auth_object
      id c_field_name field iv_agency_id
      id 'ACTVT' field iv_operation.

*    authority-check object '/DMO/TRVL'
*      id '/DMO/CNTRY' field 'ES'
*      id 'ACTVT' field '01'.

    rv_auth_result = cond #( when sy-subrc = 0 then abap_true else abap_false ).

  endmethod.

endclass.








