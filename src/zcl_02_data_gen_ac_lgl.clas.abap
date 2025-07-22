class zcl_02_data_gen_ac_lgl definition
  public
  final
  create public .

  public section.
    interfaces if_oo_adt_classrun.

    "-------------------------------------------------------------------
    " Method: IS_VALID_EMAIL
    " Purpose: Validates the format of an email address.
    " Importing:
    "   IV_EMAIL - The email address to validate (type STRING)
    " Returning:
    "   RV_IS_VALID - ABAP_BOOL, true if the email is valid, false otherwise
    "-------------------------------------------------------------------
    methods is_valid_email
      importing
        value(iv_email) type string
      returning
        value(rv_is_valid) type abap_bool.

  protected section.
  private section.
endclass.

class zcl_02_data_gen_ac_lgl implementation.

  method if_oo_adt_classrun~main.

    out->write( 'Adding Travel data....' ).

    delete from zlgl_travel.

    insert zlgl_travel from (

                select from /dmo/travel
                  fields
                    " client
                    uuid( ) as travel_uuid,
                    travel_id,
                    agency_id,
                    customer_id,
                    begin_date,
                    end_date,
                    booking_fee,
                    total_price,
                    currency_code,
                    description,
                    case status when 'B' then 'A'
                                when 'P' then 'O'
                                when 'N' then 'O'
                                else 'X' end as overall_status,
                    createdby as local_created_by,
                    createdat as local_created_at,
                    lastchangedby as local_last_changed_by,
                    lastchangedat as local_last_changed_at,
                    lastchangedat as last_changed_at ).

    out->write( |{ sy-dbcnt } rows added.| ).

  endmethod.

  method is_valid_email.
    rv_is_valid = abap_false.
    if iv_email cp '*@*.*' and iv_email ca '@' and iv_email ca '.'.
      rv_is_valid = abap_true.
    endif.
  endmethod.

endclass.
