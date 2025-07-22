class zcl_job_exe_lgl definition
  public
  final
  create public .

  public section.

    interfaces if_apj_dt_exec_object.
    interfaces if_apj_rt_exec_object.

  protected section.
  private section.
endclass.



class zcl_job_exe_lgl implementation.

  method if_apj_dt_exec_object~get_parameters.

    data ls_parameter_def type line of  if_apj_dt_exec_object=>tt_templ_def.

    ls_parameter_def-selname           = 'BUKRS'.
    ls_parameter_def-kind              = 'P'.
    ls_parameter_def-datatype          = 'C'.
    ls_parameter_def-length            = 4.
    ls_parameter_def-decimals          = 0.
    ls_parameter_def-component_type    = ''.
    ls_parameter_def-section_text      = ''.
    ls_parameter_def-group_text        = ''.
    ls_parameter_def-param_text        = 'Company Code'.
    ls_parameter_def-lowercase_ind     = abap_true.
    ls_parameter_def-hidden_ind        = abap_false.
    ls_parameter_def-changeable_ind    = abap_true.
    ls_parameter_def-mandatory_ind     = abap_false.
    ls_parameter_def-checkbox_ind      = abap_false.
    ls_parameter_def-list_ind          = abap_false.
    ls_parameter_def-radio_group_ind   = abap_false.
    ls_parameter_def-radio_group_id    = ''.

    append ls_parameter_def to et_parameter_def.

  endmethod.

  method if_apj_rt_exec_object~execute.

  endmethod.


endclass.
