class zcl_class_a definition
  public
  create public .

  public section.

    class-methods class_constructor.
    methods constructor.

    class-data log type string.

  protected section.
  private section.
endclass.



class zcl_class_a implementation.
  method class_constructor.
    log = |{ log }{ cl_abap_char_utilities=>newline }Static Constructor - Class A|.
  endmethod.

  method constructor.
    log = |{ log }{ cl_abap_char_utilities=>newline }Instance Constructor - Class A|.
  endmethod.

endclass.
