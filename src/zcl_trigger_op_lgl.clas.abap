class zcl_trigger_op_lgl definition
  public
  final
  create public .

  public section.

    interfaces if_oo_adt_classrun.

  protected section.
  private section.
endclass.

class zcl_trigger_op_lgl implementation.

  method if_oo_adt_classrun~main.

    data: lo_operation_bo type ref to zcl_operation_bo_lgl,
          lo_process      type ref to if_bgmc_process_single_op,
          lx_bgmc         type ref to cx_bgmc.


     lo_operation_bo = new #(  ).

     try.
         lo_process = cl_bgmc_process_factory=>get_default(  )->create(  ).

         lo_process->set_name( 'Background Process 1' )->set_operation( lo_operation_bo ).

         lo_process->save_for_execution(  ).

         "Asynchronous execution of the background process
         commit work.

         out->write( |Background Process triggered at: { cl_abap_context_info=>get_system_time(  ) }| ).

         wait up to 5 seconds.

         out->write( |Starter class finished at: { cl_abap_context_info=>get_system_time(  ) }| ).

         out->write( |Trying to capture log attribute: { lo_operation_bo->log }| ).

       catch cx_bgmc into lx_bgmc.
        out->write( lx_bgmc->get_text(  ) ).
        rollback work.

     endtry.


  endmethod.

endclass.
