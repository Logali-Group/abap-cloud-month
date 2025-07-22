class zcl_class_b definition
  public
  inheriting from zcl_class_a
  final
  create public .

  public section.
    class-methods class_constructor.
    methods constructor.

  protected section.
  private section.
endclass.

class zcl_class_b implementation.
  method class_constructor.
    log = |{ log }{ cl_abap_char_utilities=>newline }Static Constructor - Class B|.
  endmethod.

  method constructor.
    super->constructor( ).
    log = |{ log }{ cl_abap_char_utilities=>newline }Instance Constructor - Class B|.
  endmethod.

endclass.
