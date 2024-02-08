*&---------------------------------------------------------------------*
*& Report Z_CIRCLE_AND_CROSS
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*

*********************************************************************
* Program: Z_CIRCLE_AND_CROSS
* Title: Circle and Cross game!
* Date: 08.02.2024
* Developer: Jacek Irlik
* Version: 1.00
*-------------------------------------------------------------------
* Modification history:
* Date       Developer   Description
*=========== =========== ===========================================
* 08.02.2024 Jacek Irlik Program create
*
*********************************************************************

REPORT z_circle_and_cross.

INCLUDE Z_CIRCLE_AND_CROSS_TOP.
INCLUDE Z_CIRCLE_AND_CROSS_C01.
INCLUDE Z_CIRCLE_AND_CROSS_F01.


START-OF-SELECTION.
  DO 3 TIMES.
    APPEND INITIAL LINE TO gt_board.
  ENDDO.

  cl_grid = NEW cl_gui_alv_grid( i_parent = cl_gui_container=>default_screen
                                 i_appl_events = abap_true ).

  DATA(gt_fcat) = VALUE lvc_t_fcat( ( fieldname = 'col1' outputlen = 5 )
                                    ( fieldname = 'col2' outputlen = 5 )
                                    ( fieldname = 'col3' outputlen = 5 ) ).

  DATA(gt_exclude) = VALUE ui_functions( ( cl_gui_alv_grid=>mc_fc_excl_all ) ).

  cl_grid->set_table_for_first_display(
                                        EXPORTING
                                          it_toolbar_excluding = gt_exclude
                                        CHANGING
                                          it_fieldcatalog = gt_fcat
                                          it_outtab = gt_board ).

  CREATE OBJECT event_receiver.
  SET HANDLER event_receiver->handle_double_click FOR cl_grid.
  SET HANDLER event_receiver->handle_toolbar FOR cl_grid.
  SET HANDLER event_receiver->handle_user_command FOR cl_grid.

  CALL METHOD cl_grid->set_toolbar_interactive.

  WRITE: /.
