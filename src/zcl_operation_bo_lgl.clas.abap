class zcl_operation_bo_lgl definition
  public
  final
  create public .

  public section.

   interfaces if_bgmc_op_single.

   class-data log type string.

  protected section.
  private section.
endclass.

class zcl_operation_bo_lgl implementation.

  method if_bgmc_op_single~execute.

    log = |Background Execution started from second plan at: { cl_abap_context_info=>get_system_time(  ) }|.
    wait up to 15 seconds.

  endmethod.

endclass.
