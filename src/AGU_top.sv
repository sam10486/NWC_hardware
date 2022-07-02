`include "../include/define.svh"
`include "AGU.sv"
`include "Order_translate.sv"

module AGU_top(
    input clk,
    input rst,
    input AGU_enable,

    output logic [`MA_width-1:0] MA_idx,
    output logic [`BANK_width-1:0] BN_idx,
    output logic AGU_done_out,
    output logic BN_MA_out_en
);

    logic [`D_width-1:0] AGU_order_out;
    logic AGU_out_en;
    logic AGU_done;

    logic [`D_width-1:0] AGU_order_out_pip;
    logic AGU_out_en_pip;
    logic AGU_done_pip;

    always_ff @( posedge clk or posedge rst ) begin
        if (rst) begin
            AGU_order_out_pip <= 'd0;
            AGU_out_en_pip <= 'd0;
            AGU_done_pip <= 'd0;
        end else begin
            AGU_order_out_pip <= AGU_order_out;
            AGU_out_en_pip <= AGU_out_en;
            AGU_done_pip <= AGU_done;
        end
    end

    AGU AGU1(
        .clk(clk),
        .rst(rst),
        .AGU_enable(AGU_enable),

        .Order(AGU_order_out),
        .AGU_out_en(AGU_out_en),
        .AGU_done(AGU_done)
    );

    Order_translate Order_translate(
        .clk(clk),
        .rst(rst),
        .Order(AGU_order_out_pip),
        .r_enable(AGU_out_en_pip),
        .AGU_done(AGU_done_pip),

        .MA_idx(MA_idx),
        .BN_idx(BN_idx),
        .AGU_done_out(AGU_done_out),
        .BN_MA_out_en(BN_MA_out_en)
    );



endmodule