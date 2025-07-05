class zcl_01_hello_cloud definition
  public
  final
  create public .

  public section.

    interfaces if_oo_adt_classrun.

  protected section.
  private section.

endclass.

class zcl_01_hello_cloud implementation.

  method if_oo_adt_classrun~main.

    out->write( 'Hello Cloud' ).

    out->write( 'Super new Change' ).

  endmethod.

endclass.
