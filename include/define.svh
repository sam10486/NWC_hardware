`ifndef DEFINE_SVH
`define DEFINE_SVH

// n = 64 , modular = 257, radix=16
`timescale 10ns / 1ps
`define D_width 32
`define double_d_width `D_width*2

`define degree 8192
`define Radix 16
`define Radix_width $clog2(`Radix)
`define degree_width $clog2(`degree)

`define BN `Radix
`define MA `degree/`BN
`define BANK_width $clog2(`BN)
`define MA_width $clog2(`MA)
`define delta $clog2(`Radix)                            //logr
`define bank_idx_upper_bound  $clog2(`degree) / `delta  //logr^N


`define radix_k1 4
`define radix_k2 1
`define k ( $clog2(`degree) - `radix_k2) / `radix_k1
`define logn $clog2(`degree)
//-------barrett precomputing value-----
`define pre_computing_width `D_width+3                  // D_width+3
`define precompute 35'd11453246119


`endif 