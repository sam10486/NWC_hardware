`include "../include/define.svh"
`include "R16_data_flow_sel.sv"
`include "Controller.sv"

module top (
    input clk,
    input rst,
    input [`D_width-1:0]    x0, x1, x2, x3, x4, x5, x6, x7,
                            x8, x9, x10, x11, x12, x13, x14, x15;
    input [`D_width-1:0]    twiddle_0, twiddle_1, twiddle_2, twiddle_3, twiddle_4, twiddle_5, twiddle_6,
                            twiddle_7, twiddle_8, twiddle_9, twiddle_10, twiddle_11, twiddle_12, twiddle_13,
                            twiddle_14, twiddle_15;
    input [`D_width-1:0] modulus;
    input [`point_length-1:0] 32_stage0_num, 32_stage1_num, 32_stage2_num,
);
    Controller Controller(
        .32_stage0_num(32_stage0_num),
        .32_stage1_num(32_stage1_num),
        .32_fft_ready(32_fft_ready),

        .radix_2_flow(radix_2_flow),
    );

    R16_BU R16_BU(
        .x0(R16_input_0), .x1(R16_input_1), .x2(R16_input_2), .x3(R16_input_3),  
        .x4(R16_input_4), .x5(R16_input_5), .x6(R16_input_6), .x7(R16_input_7),
        .x8(R16_input_8), .x9(R16_input_9), .x10(R16_input_10), .x11(R16_input_11), 
        .x12(R16_input_12), .x13(R16_input_13), .x14(R16_input_14), .x15(R16_input_15),

        .twiddle_0(twiddle_0), .twiddle_1(twiddle_1), .twiddle_2(twiddle_2), .twiddle_3(twiddle_3), 
        .twiddle_4(twiddle_4), .twiddle_5(twiddle_5), .twiddle_6(twiddle_6), .twiddle_7(twiddle_7), 
        .twiddle_8(twiddle_8), .twiddle_9(twiddle_9), .twiddle_10(twiddle_10), .twiddle_11(twiddle_11), 
        .twiddle_12(twiddle_12), .twiddle_13(twiddle_13), .twiddle_14(twiddle_14), .twiddle_15(twiddle_15),

        .modulus(modulus), .clk(clk), .rst(rst), 


        .output_modulus(R16_output_modulus),
        .y0(R16_output_0), .y1(R16_output_1), .y2(R16_output_2), .y3(R16_output_3), 
        .y4(R16_output_4), .y5(R16_output_5), .y6(R16_output_6), .y7(R16_output_7),
        .y8(R16_output_8), .y9(R16_output_9), .y10(R16_output_10), .y11(R16_output_11), 
        .y12(R16_output_12), .y13(R16_output_13), .y14(R16_output_14), .y15(R16_output_15)
    );


    R16_BU R2_BU(
        .x0(R2_input_0), .x1(R2_input_1), .x2(R2_input_2), .x3(R2_input_3),  
        .x4(R2_input_4), .x5(R2_input_5), .x6(R2_input_6), .x7(R2_input_7),
        .x8(R2_input_8), .x9(R2_input_9), .x10(R2_input_10), .x11(R2_input_11), 
        .x12(R2_input_12), .x13(R2_input_13), .x14(R2_input_14), .x15(R2_input_15),

        .twiddle_0(), .twiddle_1(), .twiddle_2(), .twiddle_3(), 
        .twiddle_4(), .twiddle_5(), .twiddle_6(), .twiddle_7(), 
        .twiddle_8(), .twiddle_9(), .twiddle_10(), .twiddle_11(), 
        .twiddle_12(), .twiddle_13(), .twiddle_14(), .twiddle_15(),

        .modulus(modulus), .clk(clk), .rst(rst), 

        .y0(R16_output_0), .y1(R16_output_1), .y2(R16_output_2), .y3(R16_output_3), 
        .y4(R16_output_4), .y5(R16_output_5), .y6(R16_output_6), .y7(R16_output_7),
        .y8(R16_output_8), .y9(R16_output_9), .y10(R16_output_10), .y11(R16_output_11), 
        .y12(R16_output_12), .y13(R16_output_13), .y14(R16_output_14), .y15(R16_output_15)
    );


    always_ff @( posedge clk or posedge rst ) begin
        if (rst) begin
            R16_input_0 <= 'd0;  R16_input_8 <= 'd0;
            R16_input_1 <= 'd0;  R16_input_9 <= 'd0;
            R16_input_2 <= 'd0;  R16_input_10 <= 'd0;
            R16_input_3 <= 'd0;  R16_input_11 <= 'd0;
            R16_input_4 <= 'd0;  R16_input_12 <= 'd0;
            R16_input_5 <= 'd0;  R16_input_13 <= 'd0;
            R16_input_6 <= 'd0;  R16_input_14 <= 'd0;
            R16_input_7 <= 'd0;  R16_input_15 <= 'd0;
        end else begin          
            R16_input_0 <= x0;  R16_input_8 <= x8;
            R16_input_1 <= x1;  R16_input_9 <= x9;
            R16_input_2 <= x2;  R16_input_10 <= x10;
            R16_input_3 <= x3;  R16_input_11 <= x11;
            R16_input_4 <= x4;  R16_input_12 <= x12;
            R16_input_5 <= x5;  R16_input_13 <= x13;
            R16_input_6 <= x6;  R16_input_14 <= x14;
            R16_input_7 <= x7;  R16_input_15 <= x15;
        end
    end

    always_ff @( posedge clk or posedge rst ) begin
       if (rst) begin
            R2_input_0 <= 'd0;  R2_input_8  <= 'd0;
            R2_input_1 <= 'd0;  R2_input_9  <= 'd0;
            R2_input_2 <= 'd0;  R2_input_10 <= 'd0;
            R2_input_3 <= 'd0;  R2_input_11 <= 'd0;
            R2_input_4 <= 'd0;  R2_input_12 <= 'd0;
            R2_input_5 <= 'd0;  R2_input_13 <= 'd0;
            R2_input_6 <= 'd0;  R2_input_14 <= 'd0;
            R2_input_7 <= 'd0;  R2_input_15 <= 'd0;
       end else begin
           if (radix_2_flow) begin
                R2_input_0 <= R16_output_0;  R2_input_8  <= R16_output_8;
                R2_input_1 <= R16_output_1;  R2_input_9  <= R16_output_9;
                R2_input_2 <= R16_output_2;  R2_input_10 <= R16_output_10;
                R2_input_3 <= R16_output_3;  R2_input_11 <= R16_output_11;
                R2_input_4 <= R16_output_4;  R2_input_12 <= R16_output_12;
                R2_input_5 <= R16_output_5;  R2_input_13 <= R16_output_13;
                R2_input_6 <= R16_output_6;  R2_input_14 <= R16_output_14;
                R2_input_7 <= R16_output_7;  R2_input_15 <= R16_output_15;
           end else begin
                R2_input_0 <= 'd0;  R2_input_8  <= 'd0;
                R2_input_1 <= 'd0;  R2_input_9  <= 'd0;
                R2_input_2 <= 'd0;  R2_input_10 <= 'd0;
                R2_input_3 <= 'd0;  R2_input_11 <= 'd0;
                R2_input_4 <= 'd0;  R2_input_12 <= 'd0;
                R2_input_5 <= 'd0;  R2_input_13 <= 'd0;
                R2_input_6 <= 'd0;  R2_input_14 <= 'd0;
                R2_input_7 <= 'd0;  R2_input_15 <= 'd0;
           end
            
       end
    end
endmodule