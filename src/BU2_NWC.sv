`include "../include/define.svh"
`include "ModAdd.sv"
`include "ModSub.sv"
`include "barrett_reduction.sv"

module BU2_NWC (
    input [`D_width-1:0] in1,
    input [`D_width-1:0] in2,
    input [`D_width-1:0] twiddle,
    input [`D_width-1:0] modulus,
    input rst,
    input clk,

    output logic [`D_width-1:0] BU_a,
    output logic [`D_width-1:0] BU_b,
    output logic [`D_width-1:0] twiddle_BU_out,
    output logic [`D_width-1:0] modulus_BU_out
);
    
    logic [`D_width-1:0] pip0_in1;
    logic [`D_width-1:0] pip0_modulus;
    logic [`D_width-1:0] pip0_twiddle;
    logic [`D_width-1:0] add_out;
    logic [`D_width-1:0] sub_out;


    logic [`D_width-1:0] barrett_result_in2;

    barrett_reduction #(.pre_computing_width(`pre_computing_width) , 
                        .precompute(`precompute))
    barrett_reduction(
        .a(in2),
        .b(twiddle),
        .modulus(modulus),
        .clk(clk),
        .rst(rst),

        .result(barrett_result_in2)
    );

    always_ff @( posedge clk or posedge rst ) begin 
        if (rst) begin
            pip0_in1 <= 'd0;
            pip0_modulus <= 'd0;
            pip0_twiddle <= 'd0;
        end else begin
            pip0_in1 <= in1;
            pip0_modulus <= modulus;
            pip0_twiddle <= twiddle;
        end
    end

    ModAdd add1(
        .in_1(pip0_in1),
        .in_2(barrett_result_in2),
        .modulus(pip0_modulus),
        .out(add_out)
    );

    ModSub sub1(
        .in_1(pip0_in1),
        .in_2(barrett_result_in2),
        .modulus(pip0_modulus),
        .out(sub_out)
    );

    always_ff @( posedge clk or posedge rst ) begin 
        if (rst) begin
            BU_a <= 'd0;
            BU_b <= 'd0;
            twiddle_BU_out <= 'd0;
            modulus_BU_out <= 'd0;
        end else begin
            BU_a <= add_out;
            BU_b <= sub_out;
            twiddle_BU_out <= pip0_twiddle;
            modulus_BU_out <= pip0_modulus;
        end
    end



endmodule