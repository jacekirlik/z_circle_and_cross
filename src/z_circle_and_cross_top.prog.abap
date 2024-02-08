*&---------------------------------------------------------------------*
*&  Include           Z_CIRCLE_AND_CROSS_TOP
*&---------------------------------------------------------------------*
TYPES:
  BEGIN OF ts_board,
    col1 TYPE c,
    col2 TYPE c,
    col3 TYPE c,
  END OF ts_board.

DATA: gt_board    TYPE TABLE OF ts_board,
      gs_board    LIKE LINE OF gt_board,

      cl_grid     TYPE REF TO cl_gui_alv_grid,

      gt_cell_col TYPE i,
      gt_cell_row TYPE i,
      gt_cell(2)  TYPE c.

DATA: gv_action  TYPE c VALUE 'X',
      gv_message TYPE string VALUE 'Alrady maintain.',

      gv_result_x TYPE i,
      gv_win_x    TYPE c,
      gv_result_o TYPE i,
      gv_win_o    TYPE c.
