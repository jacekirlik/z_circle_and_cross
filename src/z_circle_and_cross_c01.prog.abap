*&---------------------------------------------------------------------*
*&  Include           Z_CIRCLE_AND_CROSS_C01
*&---------------------------------------------------------------------*
CLASS lcl_event_receiver DEFINITION DEFERRED.
CLASS lcl_event_receiver DEFINITION.
  PUBLIC SECTION.
    METHODS:
      handle_toolbar FOR EVENT toolbar OF cl_gui_alv_grid IMPORTING e_object e_interactive,
      handle_user_command FOR EVENT user_command OF cl_gui_alv_grid IMPORTING e_ucomm,
      handle_double_click FOR EVENT double_click OF cl_gui_alv_grid.

ENDCLASS.

CLASS lcl_event_receiver IMPLEMENTATION.

  METHOD handle_toolbar.
    DATA: ls_toolbar TYPE stb_button.
    CLEAR ls_toolbar.
    ls_toolbar-function = 'CLEAR'.
    ls_toolbar-text = ' Clear board '.
    APPEND ls_toolbar TO e_object->mt_toolbar.
  ENDMETHOD.

  METHOD handle_user_command.
    IF e_ucomm = 'CLEAR'.

      CLEAR gt_board.
      CLEAR gv_win_x.
      CLEAR gv_win_o.
      CLEAR gv_result_x.
      CLEAR gv_result_o.
      CLEAR gv_message.

      gv_action = 'X'.

      DO 3 TIMES.
        APPEND INITIAL LINE TO gt_board.
      ENDDO.

      cl_grid->refresh_table_display( ).
    ENDIF.
  ENDMETHOD.

  METHOD handle_double_click.
    cl_grid->get_current_cell( IMPORTING
                                e_col = gt_cell_col
                                e_row = gt_cell_row ).

    IF gv_action = 'X'.
      PERFORM cross.
    ELSEIF gv_action = 'O'.
      PERFORM circle.
    ENDIF.

    cl_grid->refresh_table_display( ).

    PERFORM count_x.
    PERFORM count_o.

  ENDMETHOD.
ENDCLASS.

DATA: event_receiver TYPE REF TO lcl_event_receiver.
