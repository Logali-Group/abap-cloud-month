class zcl_test_oo_test_ertif definition
  public
  final
  create public .

  public section.

    interfaces if_oo_adt_classrun .
  protected section.
  private section.
endclass.



class zcl_test_oo_test_ertif implementation.


  method if_oo_adt_classrun~main.

    data(lo_class_b) = new zcl_class_b(  ).

    out->write( zcl_class_b=>log ).

  endmethod.
endclass.
