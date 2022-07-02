`include "../include/define.svh"
`include "ModAdd.sv"

module Order_translate(
    input clk,
    input rst,
    input [`D_width-1:0] Order, 
    input r_enable,
    input AGU_done,

    output logic [`MA_width-1:0] MA_idx,
    output logic [`BANK_width-1:0] BN_idx,
    output logic AGU_done_out,
    output logic BN_MA_out_en
);

    logic [`D_width-1:0] Order_tmp0_pip0, Order_tmp1_pip0, Order_tmp2_pip0, Order_tmp3_pip0;
    logic [`D_width-1:0] Order_tmp2_pip1, Order_tmp3_pip1;
    logic [`D_width-1:0] Order_tmp3_pip2;
    logic [`D_width-1:0] Order_tmp_out_pip0, Order_tmp_out_pip1;
    
    logic [`D_width-1:0] Order_pip0, Order_pip1, Order_pip2, Order_pip3;
    logic r_enable_pip0, r_enable_pip1, r_enable_pip2;
    logic AGU_done_pip0, AGU_done_pip1, AGU_done_pip2;

    logic [`D_width-1:0] Order_tmp_out_stage0, Order_tmp_out_stage1, Order_tmp_out_stage2;

    parameter difference_width = `D_width - `degree_width;

    always_ff @( posedge clk or posedge rst ) begin
        if (rst) begin
            Order_tmp0_pip0 <= 'd0;
            Order_tmp1_pip0 <= 'd0;
            Order_tmp2_pip0 <= 'd0;
            Order_tmp3_pip0 <= 'd0;
            Order_pip0 <= 'd0;
            r_enable_pip0 <= 'd0;
            AGU_done_pip0 <= 'd0;
        end else begin
            Order_tmp0_pip0 <= Order[3:0];
            Order_tmp1_pip0 <= Order[7:4];
            Order_tmp2_pip0 <= Order[11:8];
            Order_tmp3_pip0 <= Order[`degree_width-1:12];
            Order_pip0 <= Order;
            r_enable_pip0 <= r_enable;
            AGU_done_pip0 <= AGU_done;
        end
    end
    ModAdd add0(
        .in_1({Order_tmp0_pip0 }),
        .in_2({Order_tmp1_pip0 }),
        .modulus(`D_width'd`Radix),
        .out(Order_tmp_out_stage0)
    );

    always_ff @( posedge clk or posedge rst ) begin
        if (rst) begin
            Order_tmp2_pip1 <= 'd0;
            Order_tmp3_pip1 <= 'd0;
            Order_pip1 <= 'd0;
            r_enable_pip1 <= 'd0;
            Order_tmp_out_pip0 <= 'd0;
            AGU_done_pip1 <= 'd0;
        end else begin
            Order_tmp2_pip1 <= Order_tmp2_pip0;
            Order_tmp3_pip1 <= Order_tmp3_pip0;
            Order_pip1 <= Order_pip0;
            r_enable_pip1 <= r_enable_pip0;
            Order_tmp_out_pip0 <= Order_tmp_out_stage0[15:0];
            AGU_done_pip1 <= AGU_done_pip0;
        end
    end
    ModAdd add1(
        .in_1({Order_tmp_out_pip0}),
        .in_2({Order_tmp2_pip1 }),
        .modulus(`D_width'd`Radix),
        .out(Order_tmp_out_stage1)
    );

    always_ff @( posedge clk or posedge rst ) begin
        if (rst) begin
            Order_tmp3_pip2 <= 'd0;
            Order_pip2 <= 'd0;
            r_enable_pip2 <= 'd0;
            Order_tmp_out_pip1 <= 'd0;
            AGU_done_pip2 <= 'd0;
        end else begin
            Order_tmp3_pip2 <= Order_tmp3_pip1;
            Order_pip2 <= Order_pip1 >> `delta;
            r_enable_pip2 <= r_enable_pip1;
            Order_tmp_out_pip1 <= Order_tmp_out_stage1[15:0];
            AGU_done_pip2 <= AGU_done_pip1;
        end
    end
    ModAdd add2(
        .in_1({ Order_tmp_out_pip1 }),
        .in_2({ Order_tmp3_pip2 }),
        .modulus(`D_width'd`Radix),
        .out(Order_tmp_out_stage2)
    );

    always_ff @( posedge clk or posedge rst ) begin
        if (rst) begin
            MA_idx <= 'd0;
            BN_idx <= 'd0;
            AGU_done_out <= 'd0;
            BN_MA_out_en <= 'd0;
        end else begin
            if (r_enable_pip2) begin
                MA_idx <= Order_pip2[`degree_width-1-`delta:0];
                BN_idx <= Order_tmp_out_stage2[15:0];
                AGU_done_out <= AGU_done_pip2;
                BN_MA_out_en <= 'd1;
            end else begin
                MA_idx = 'd0;
                BN_idx = 'd0;
                AGU_done_out <= AGU_done_pip2;
                BN_MA_out_en <= 'd0;
            end
        end
    end

endmodule