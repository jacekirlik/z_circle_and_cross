*----------------------------------------------------------------------*
***INCLUDE Z_CIRCLE_AND_CROSS_F01.
*----------------------------------------------------------------------*
*&---------------------------------------------------------------------*
*&      Form  CROSS
*&---------------------------------------------------------------------*
*       text
*----------------------------------------------------------------------*
*  -->  p1        text
*  <--  p2        text
*----------------------------------------------------------------------*
FORM cross .
  CASE gt_cell_col.
    WHEN 1.
      LOOP AT gt_board ASSIGNING FIELD-SYMBOL(<fs>).
        IF sy-tabix = gt_cell_row.
          IF <fs>-col1 IS INITIAL.
            <fs>-col1 = gv_action.
            gv_action = 'O'.
          ELSE.
            MESSAGE gv_message TYPE 'S'.
          ENDIF.
        ENDIF.
      ENDLOOP.

    WHEN 2.
      LOOP AT gt_board ASSIGNING <fs>.
        IF sy-tabix = gt_cell_row.
          IF <fs>-col2 IS INITIAL.
            <fs>-col2 = gv_action.
            gv_action = 'O'.
          ELSE.
            MESSAGE gv_message TYPE 'S'.
          ENDIF.
        ENDIF.
      ENDLOOP.

    WHEN 3.
      LOOP AT gt_board ASSIGNING <fs>.
        IF sy-tabix = gt_cell_row.
          IF <fs>-col3 IS INITIAL.
            <fs>-col3 = gv_action.
            gv_action = 'O'.
          ELSE.
            MESSAGE gv_message TYPE 'S'.
          ENDIF.
        ENDIF.
      ENDLOOP.
  ENDCASE.


ENDFORM.
*&---------------------------------------------------------------------*
*&      Form  CIRCLE
*&---------------------------------------------------------------------*
*       text
*----------------------------------------------------------------------*
*  -->  p1        text
*  <--  p2        text
*----------------------------------------------------------------------*
FORM circle .
  CASE gt_cell_col.
    WHEN 1.
      LOOP AT gt_board ASSIGNING FIELD-SYMBOL(<fs>).
        IF sy-tabix = gt_cell_row.
          IF <fs>-col1 IS INITIAL.
            <fs>-col1 = gv_action.
            gv_action = 'X'.
          ELSE.
            MESSAGE gv_message TYPE 'S'.
          ENDIF.
        ENDIF.
      ENDLOOP.

    WHEN 2.
      LOOP AT gt_board ASSIGNING <fs>.
        IF sy-tabix = gt_cell_row.
          IF <fs>-col2 IS INITIAL.
            <fs>-col2 = gv_action.
            gv_action = 'X'.
          ELSE.
            MESSAGE gv_message TYPE 'S'.
          ENDIF.
        ENDIF.
      ENDLOOP.

    WHEN 3.
      LOOP AT gt_board ASSIGNING <fs>.
        IF sy-tabix = gt_cell_row.
          IF <fs>-col3 IS INITIAL.
            <fs>-col3 = gv_action.
            gv_action = 'X'.
          ELSE.
            MESSAGE gv_message TYPE 'S'.
          ENDIF.
        ENDIF.
      ENDLOOP.
  ENDCASE.

ENDFORM.
*&---------------------------------------------------------------------*
*&      Form  COUNT_X
*&---------------------------------------------------------------------*
*       text
*----------------------------------------------------------------------*
*  -->  p1        text
*  <--  p2        text
*----------------------------------------------------------------------*
FORM count_x .
  CLEAR gv_result_x.
  DO 3 TIMES.
    READ TABLE gt_board INDEX sy-index INTO gs_board.
    IF gs_board-col1 = 'X' AND gs_board-col2 = 'X' AND gs_board-col3 = 'X'.
      gv_result_x = 3.
    ENDIF.
    IF gv_result_x = 3.
      gv_win_x = abap_true.
    ENDIF.
  ENDDO.

  CLEAR gv_result_x.
  DO 3 TIMES.
    READ TABLE gt_board INDEX sy-index INTO gs_board.
    IF gs_board-col1 = 'X'.
      gv_result_x = gv_result_x + 1.
    ENDIF.
    IF gv_result_x = 3.
      gv_win_x = abap_true.
    ENDIF.
  ENDDO.

  CLEAR gv_result_x.
  DO 3 TIMES.
    READ TABLE gt_board INDEX sy-index INTO gs_board.
    IF gs_board-col2 = 'X'.
      gv_result_x = gv_result_x + 1.
    ENDIF.
    IF gv_result_x = 3.
      gv_win_x = abap_true.
    ENDIF.
  ENDDO.

  CLEAR gv_result_x.
  DO 3 TIMES.
    READ TABLE gt_board INDEX sy-index INTO gs_board.
    IF gs_board-col3 = 'X'.
      gv_result_x = gv_result_x + 1.
    ENDIF.
    IF gv_result_x = 3.
      gv_win_x = abap_true.
    ENDIF.
  ENDDO.

  CLEAR gv_result_x.
  DO 3 TIMES.
    READ TABLE gt_board INDEX 1 INTO gs_board.
    IF gs_board-col1 = 'X'.
      gv_result_x = gv_result_x + 1.
    ENDIF.
    READ TABLE gt_board INDEX 2 INTO gs_board.
    IF gs_board-col2 = 'X'.
      gv_result_x = gv_result_x + 1.
    ENDIF.
    READ TABLE gt_board INDEX 3 INTO gs_board.
    IF gs_board-col3 = 'X'.
      gv_result_x = gv_result_x + 1.
    ENDIF.
    IF gv_result_x = 3.
      gv_win_x = abap_true.
    ENDIF.
    CLEAR gv_result_x.
  ENDDO.

  CLEAR gv_result_x.
  DO 3 TIMES.
    READ TABLE gt_board INDEX 1 INTO gs_board.
    IF gs_board-col3 = 'X'.
      gv_result_x = gv_result_x + 1.
    ENDIF.
    READ TABLE gt_board INDEX 2 INTO gs_board.
    IF gs_board-col2 = 'X'.
      gv_result_x = gv_result_x + 1.
    ENDIF.
    READ TABLE gt_board INDEX 3 INTO gs_board.
    IF gs_board-col1 = 'X'.
      gv_result_x = gv_result_x + 1.
    ENDIF.
    IF gv_result_x = 3.
      gv_win_x = abap_true.
    ENDIF.
    CLEAR gv_result_x.
  ENDDO.


  IF gv_win_x = abap_true.
    MESSAGE 'X Win!' TYPE 'I'.
  ENDIF.
ENDFORM.
*&---------------------------------------------------------------------*
*&      Form  COUNT_O
*&---------------------------------------------------------------------*
*       text
*----------------------------------------------------------------------*
*  -->  p1        text
*  <--  p2        text
*----------------------------------------------------------------------*
FORM count_o .
  CLEAR gv_result_o.
  DO 3 TIMES.
    READ TABLE gt_board INDEX sy-index INTO gs_board.
    IF gs_board-col1 = 'O' AND gs_board-col2 = 'O' AND gs_board-col3 = 'O'.
      gv_result_o = 3.
    ENDIF.
    IF gv_result_o = 3.
      gv_win_o = abap_true.
    ENDIF.
  ENDDO.

  CLEAR gv_result_o.
  DO 3 TIMES.
    READ TABLE gt_board INDEX sy-index INTO gs_board.
    IF gs_board-col1 = 'O'.
      gv_result_o = gv_result_o + 1.
    ENDIF.
    IF gv_result_o = 3.
      gv_win_o = abap_true.
    ENDIF.
  ENDDO.

  CLEAR gv_result_o.
  DO 3 TIMES.
    READ TABLE gt_board INDEX sy-index INTO gs_board.
    IF gs_board-col2 = 'O'.
      gv_result_o = gv_result_o + 1.
    ENDIF.
    IF gv_result_o = 3.
      gv_win_o = abap_true.
    ENDIF.
  ENDDO.

  CLEAR gv_result_o.
  DO 3 TIMES.
    READ TABLE gt_board INDEX sy-index INTO gs_board.
    IF gs_board-col3 = 'O'.
      gv_result_o = gv_result_o + 1.
    ENDIF.
    IF gv_result_o = 3.
      gv_win_o = abap_true.
    ENDIF.
  ENDDO.

  CLEAR gv_result_o.
  DO 3 TIMES.
    READ TABLE gt_board INDEX 1 INTO gs_board.
    IF gs_board-col1 = 'O'.
      gv_result_o = gv_result_o + 1.
    ENDIF.
    READ TABLE gt_board INDEX 2 INTO gs_board.
    IF gs_board-col2 = 'O'.
      gv_result_o = gv_result_o + 1.
    ENDIF.
    READ TABLE gt_board INDEX 3 INTO gs_board.
    IF gs_board-col3 = 'O'.
      gv_result_o = gv_result_o + 1.
    ENDIF.
    IF gv_result_o = 3.
      gv_win_o = abap_true.
    ENDIF.
    CLEAR gv_result_o.
  ENDDO.

  CLEAR gv_result_o.
  DO 3 TIMES.
    READ TABLE gt_board INDEX 1 INTO gs_board.
    IF gs_board-col3 = 'O'.
      gv_result_o = gv_result_o + 1.
    ENDIF.
    READ TABLE gt_board INDEX 2 INTO gs_board.
    IF gs_board-col2 = 'O'.
      gv_result_o = gv_result_o + 1.
    ENDIF.
    READ TABLE gt_board INDEX 3 INTO gs_board.
    IF gs_board-col1 = 'O'.
      gv_result_o = gv_result_o + 1.
    ENDIF.
    IF gv_result_o = 3.
      gv_win_o = abap_true.
    ENDIF.
    CLEAR gv_result_o.
  ENDDO.


  IF gv_win_o = abap_true.
    MESSAGE 'O Win!' TYPE 'I'.
  ENDIF.
ENDFORM.
