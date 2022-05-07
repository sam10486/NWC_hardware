`ifndef DEFINE_SVH
`define DEFINE_SVH

`timescale 10ns / 1ps
`define D_width 8
`define double_d_width 16

/*//------barrett parameter-------- alpha=n+1-9 beta = -2                                                   
`define DATA_WIDTH           8
`define DOUBLE_DATA_WIDTH    16  //2*DATA_WIDTH

`define DATA_FRI_RS_WIDTH    10  // DOUBLE_DATA_WIDTH - rf_FRI                            
`define DATA_MULT_PRE_WIDTH  23     

`define Prime                8'd229
`define rf_FRI               6         //DATA_WIDTH-2                                                   
`define rf_SEC               11         //DATA_WIDTH+3                                                  
`define pre_computing        13'd572   // equal to DATA_FRI_RS_WIDTH
*/
`endif 