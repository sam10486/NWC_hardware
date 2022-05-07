`include "../include/define.svh"
`include "BU2_NWC.sv"

module R16_BU (
    input [`D_width-1:0]    x0, x1, x2, x3, x4, x5, x6, x7,
                            x8, x9, x10, x11, x12, x13, x14, x15,

    input [`D_width-1:0]    twiddle_0, twiddle_1, twiddle_2, twiddle_3, twiddle_4, twiddle_5, twiddle_6,
                            twiddle_7, twiddle_8, twiddle_9, twiddle_10, twiddle_11, twiddle_12, twiddle_13,
                            twiddle_14, twiddle_15,
    input [`D_width-1:0] modulus,
    input clk,
    input rst,
    output logic [`D_width-1:0] y0, y1, y2, y3, y4, y5, y6, y7,
                                y8, y9, y10, y11, y12, y13, y14, y15
);

    //stage 0 output
    logic [`D_width-1:0] stage0_fft_a0, stage0_fft_b0;
    logic [`D_width-1:0] stage0_fft_a1, stage0_fft_b1;
    logic [`D_width-1:0] stage0_fft_a2, stage0_fft_b2;
    logic [`D_width-1:0] stage0_fft_a3, stage0_fft_b3;
    logic [`D_width-1:0] stage0_fft_a4, stage0_fft_b4;
    logic [`D_width-1:0] stage0_fft_a5, stage0_fft_b5;
    logic [`D_width-1:0] stage0_fft_a6, stage0_fft_b6;
    logic [`D_width-1:0] stage0_fft_a7, stage0_fft_b7;

    logic [`D_width-1:0] BU0_stage0_twiddle_out;
    logic [`D_width-1:0] BU1_stage0_twiddle_out;
    logic [`D_width-1:0] BU2_stage0_twiddle_out;
    logic [`D_width-1:0] BU3_stage0_twiddle_out;
    logic [`D_width-1:0] BU4_stage0_twiddle_out;
    logic [`D_width-1:0] BU5_stage0_twiddle_out;
    logic [`D_width-1:0] BU6_stage0_twiddle_out;
    logic [`D_width-1:0] BU7_stage0_twiddle_out;

    logic [`D_width-1:0] BU0_stage0_modulus_out;
    logic [`D_width-1:0] BU1_stage0_modulus_out;
    logic [`D_width-1:0] BU2_stage0_modulus_out;
    logic [`D_width-1:0] BU3_stage0_modulus_out;
    logic [`D_width-1:0] BU4_stage0_modulus_out;
    logic [`D_width-1:0] BU5_stage0_modulus_out;
    logic [`D_width-1:0] BU6_stage0_modulus_out;
    logic [`D_width-1:0] BU7_stage0_modulus_out;

    // stage 1 input
    logic [`D_width-1:0] pip0_twiddle_0;
    logic [`D_width-1:0] pip0_twiddle_1;
    logic [`D_width-1:0] pip0_twiddle_2;
    logic [`D_width-1:0] pip0_twiddle_3;
    logic [`D_width-1:0] pip0_twiddle_4;
    logic [`D_width-1:0] pip0_twiddle_5;
    logic [`D_width-1:0] pip0_twiddle_6;
    logic [`D_width-1:0] pip0_twiddle_7;
    logic [`D_width-1:0] pip0_twiddle_8;
    logic [`D_width-1:0] pip0_twiddle_9;
    logic [`D_width-1:0] pip0_twiddle_10;
    logic [`D_width-1:0] pip0_twiddle_11;
    logic [`D_width-1:0] pip0_twiddle_12;
    logic [`D_width-1:0] pip0_twiddle_13;
    logic [`D_width-1:0] pip0_twiddle_14;
    logic [`D_width-1:0] pip0_twiddle_15;

    logic [`D_width-1:0] pip0_fft_a0, pip0_fft_b0;
    logic [`D_width-1:0] pip0_fft_a1, pip0_fft_b1;
    logic [`D_width-1:0] pip0_fft_a2, pip0_fft_b2;
    logic [`D_width-1:0] pip0_fft_a3, pip0_fft_b3;
    logic [`D_width-1:0] pip0_fft_a4, pip0_fft_b4;
    logic [`D_width-1:0] pip0_fft_a5, pip0_fft_b5;
    logic [`D_width-1:0] pip0_fft_a6, pip0_fft_b6;
    logic [`D_width-1:0] pip0_fft_a7, pip0_fft_b7;

    logic [`D_width-1:0] pip0_modulus;
    //stage 1 output
    logic [`D_width-1:0] stage1_fft_a0, stage1_fft_b0;
    logic [`D_width-1:0] stage1_fft_a1, stage1_fft_b1;
    logic [`D_width-1:0] stage1_fft_a2, stage1_fft_b2;
    logic [`D_width-1:0] stage1_fft_a3, stage1_fft_b3;
    logic [`D_width-1:0] stage1_fft_a4, stage1_fft_b4;
    logic [`D_width-1:0] stage1_fft_a5, stage1_fft_b5;
    logic [`D_width-1:0] stage1_fft_a6, stage1_fft_b6;
    logic [`D_width-1:0] stage1_fft_a7, stage1_fft_b7;

    logic [`D_width-1:0] BU0_stage1_twiddle_out;
    logic [`D_width-1:0] BU1_stage1_twiddle_out;
    logic [`D_width-1:0] BU2_stage1_twiddle_out;
    logic [`D_width-1:0] BU3_stage1_twiddle_out;
    logic [`D_width-1:0] BU4_stage1_twiddle_out;
    logic [`D_width-1:0] BU5_stage1_twiddle_out;
    logic [`D_width-1:0] BU6_stage1_twiddle_out;
    logic [`D_width-1:0] BU7_stage1_twiddle_out;

    logic [`D_width-1:0] BU0_stage1_modulus_out;
    logic [`D_width-1:0] BU1_stage1_modulus_out;
    logic [`D_width-1:0] BU2_stage1_modulus_out;
    logic [`D_width-1:0] BU3_stage1_modulus_out;
    logic [`D_width-1:0] BU4_stage1_modulus_out;
    logic [`D_width-1:0] BU5_stage1_modulus_out;
    logic [`D_width-1:0] BU6_stage1_modulus_out;
    logic [`D_width-1:0] BU7_stage1_modulus_out;

    // stage 2 input
    logic [`D_width-1:0] pip1_twiddle_0;
    logic [`D_width-1:0] pip1_twiddle_1;
    logic [`D_width-1:0] pip1_twiddle_2;
    logic [`D_width-1:0] pip1_twiddle_3;
    logic [`D_width-1:0] pip1_twiddle_4;
    logic [`D_width-1:0] pip1_twiddle_5;
    logic [`D_width-1:0] pip1_twiddle_6;
    logic [`D_width-1:0] pip1_twiddle_7;
    logic [`D_width-1:0] pip1_twiddle_8;
    logic [`D_width-1:0] pip1_twiddle_9;
    logic [`D_width-1:0] pip1_twiddle_10;
    logic [`D_width-1:0] pip1_twiddle_11;
    logic [`D_width-1:0] pip1_twiddle_12;
    logic [`D_width-1:0] pip1_twiddle_13;
    logic [`D_width-1:0] pip1_twiddle_14;
    logic [`D_width-1:0] pip1_twiddle_15;

    logic [`D_width-1:0] pip1_fft_a0, pip1_fft_b0;
    logic [`D_width-1:0] pip1_fft_a1, pip1_fft_b1;
    logic [`D_width-1:0] pip1_fft_a2, pip1_fft_b2;
    logic [`D_width-1:0] pip1_fft_a3, pip1_fft_b3;
    logic [`D_width-1:0] pip1_fft_a4, pip1_fft_b4;
    logic [`D_width-1:0] pip1_fft_a5, pip1_fft_b5;
    logic [`D_width-1:0] pip1_fft_a6, pip1_fft_b6;
    logic [`D_width-1:0] pip1_fft_a7, pip1_fft_b7;

    logic [`D_width-1:0] pip1_modulus;
    // stage 2 output
    logic [`D_width-1:0] BU0_stage2_twiddle_out;
    logic [`D_width-1:0] BU1_stage2_twiddle_out;
    logic [`D_width-1:0] BU2_stage2_twiddle_out;
    logic [`D_width-1:0] BU3_stage2_twiddle_out;
    logic [`D_width-1:0] BU4_stage2_twiddle_out;
    logic [`D_width-1:0] BU5_stage2_twiddle_out;
    logic [`D_width-1:0] BU6_stage2_twiddle_out;
    logic [`D_width-1:0] BU7_stage2_twiddle_out;

    logic [`D_width-1:0] BU0_stage2_modulus_out;
    logic [`D_width-1:0] BU1_stage2_modulus_out;
    logic [`D_width-1:0] BU2_stage2_modulus_out;
    logic [`D_width-1:0] BU3_stage2_modulus_out;
    logic [`D_width-1:0] BU4_stage2_modulus_out;
    logic [`D_width-1:0] BU5_stage2_modulus_out;
    logic [`D_width-1:0] BU6_stage2_modulus_out;
    logic [`D_width-1:0] BU7_stage2_modulus_out;

    logic [`D_width-1:0] stage2_fft_a0, stage2_fft_b0;
    logic [`D_width-1:0] stage2_fft_a1, stage2_fft_b1;
    logic [`D_width-1:0] stage2_fft_a2, stage2_fft_b2;
    logic [`D_width-1:0] stage2_fft_a3, stage2_fft_b3;
    logic [`D_width-1:0] stage2_fft_a4, stage2_fft_b4;
    logic [`D_width-1:0] stage2_fft_a5, stage2_fft_b5;
    logic [`D_width-1:0] stage2_fft_a6, stage2_fft_b6;
    logic [`D_width-1:0] stage2_fft_a7, stage2_fft_b7;
    // stage 3 input 
    logic [`D_width-1:0] pip2_twiddle_0;
    logic [`D_width-1:0] pip2_twiddle_1;
    logic [`D_width-1:0] pip2_twiddle_2;
    logic [`D_width-1:0] pip2_twiddle_3;
    logic [`D_width-1:0] pip2_twiddle_4;
    logic [`D_width-1:0] pip2_twiddle_5;
    logic [`D_width-1:0] pip2_twiddle_6;
    logic [`D_width-1:0] pip2_twiddle_7;
    logic [`D_width-1:0] pip2_twiddle_8;
    logic [`D_width-1:0] pip2_twiddle_9;
    logic [`D_width-1:0] pip2_twiddle_10;
    logic [`D_width-1:0] pip2_twiddle_11;
    logic [`D_width-1:0] pip2_twiddle_12;
    logic [`D_width-1:0] pip2_twiddle_13;
    logic [`D_width-1:0] pip2_twiddle_14;
    logic [`D_width-1:0] pip2_twiddle_15;

    logic [`D_width-1:0] pip2_fft_a0, pip2_fft_b0;
    logic [`D_width-1:0] pip2_fft_a1, pip2_fft_b1;
    logic [`D_width-1:0] pip2_fft_a2, pip2_fft_b2;
    logic [`D_width-1:0] pip2_fft_a3, pip2_fft_b3;
    logic [`D_width-1:0] pip2_fft_a4, pip2_fft_b4;
    logic [`D_width-1:0] pip2_fft_a5, pip2_fft_b5;
    logic [`D_width-1:0] pip2_fft_a6, pip2_fft_b6;
    logic [`D_width-1:0] pip2_fft_a7, pip2_fft_b7;

    logic [`D_width-1:0] pip2_modulus;

    // stage 3 output
    logic [`D_width-1:0] BU0_stage3_twiddle_out;
    logic [`D_width-1:0] BU1_stage3_twiddle_out;
    logic [`D_width-1:0] BU2_stage3_twiddle_out;
    logic [`D_width-1:0] BU3_stage3_twiddle_out;
    logic [`D_width-1:0] BU4_stage3_twiddle_out;
    logic [`D_width-1:0] BU5_stage3_twiddle_out;
    logic [`D_width-1:0] BU6_stage3_twiddle_out;
    logic [`D_width-1:0] BU7_stage3_twiddle_out;

    logic [`D_width-1:0] BU0_stage3_modulus_out;
    logic [`D_width-1:0] BU1_stage3_modulus_out;
    logic [`D_width-1:0] BU2_stage3_modulus_out;
    logic [`D_width-1:0] BU3_stage3_modulus_out;
    logic [`D_width-1:0] BU4_stage3_modulus_out;
    logic [`D_width-1:0] BU5_stage3_modulus_out;
    logic [`D_width-1:0] BU6_stage3_modulus_out;
    logic [`D_width-1:0] BU7_stage3_modulus_out;

    logic [`D_width-1:0] stage3_fft_a0, stage3_fft_b0;
    logic [`D_width-1:0] stage3_fft_a1, stage3_fft_b1;
    logic [`D_width-1:0] stage3_fft_a2, stage3_fft_b2;
    logic [`D_width-1:0] stage3_fft_a3, stage3_fft_b3;
    logic [`D_width-1:0] stage3_fft_a4, stage3_fft_b4;
    logic [`D_width-1:0] stage3_fft_a5, stage3_fft_b5;
    logic [`D_width-1:0] stage3_fft_a6, stage3_fft_b6;
    logic [`D_width-1:0] stage3_fft_a7, stage3_fft_b7;
    // ----------------stage 0------------------
    BU2_NWC stage0_BU0(
        .in1(x0),
        .in2(x8),
        .twiddle(twiddle_8),
        .modulus(modulus),
        .rst(rst),
        .clk(clk),

        .BU_a(stage0_fft_a0),
        .BU_b(stage0_fft_b0),
        .twiddle_BU_out(BU0_stage0_twiddle_out),
        .modulus_BU_out(BU0_stage0_modulus_out)
    );

    BU2_NWC BU1(
        .in1(x1),
        .in2(x9),
        .twiddle(twiddle_8),
        .modulus(modulus),
        .rst(rst),
        .clk(clk),

        .BU_a(stage0_fft_a1),
        .BU_b(stage0_fft_b1),
        .twiddle_BU_out(BU1_stage0_twiddle_out),
        .modulus_BU_out(BU1_stage0_modulus_out)
    );

    BU2_NWC BU2(
        .in1(x2),
        .in2(x10),
        .twiddle(twiddle_8),
        .modulus(modulus),
        .rst(rst),
        .clk(clk),

        .BU_a(stage0_fft_a2),
        .BU_b(stage0_fft_b2),
        .twiddle_BU_out(BU2_stage0_twiddle_out),
        .modulus_BU_out(BU2_stage0_modulus_out)
    );
    
    BU2_NWC BU3(
        .in1(x3),
        .in2(x11),
        .twiddle(twiddle_8),
        .modulus(modulus),
        .rst(rst),
        .clk(clk),

        .BU_a(stage0_fft_a3),
        .BU_b(stage0_fft_b3),
        .twiddle_BU_out(BU3_stage0_twiddle_out),
        .modulus_BU_out(BU3_stage0_modulus_out)
    );

    BU2_NWC BU4(
        .in1(x4),
        .in2(x12),
        .twiddle(twiddle_8),
        .modulus(modulus),
        .rst(rst),
        .clk(clk),

        .BU_a(stage0_fft_a4),
        .BU_b(stage0_fft_b4),
        .twiddle_BU_out(BU4_stage0_twiddle_out),
        .modulus_BU_out(BU4_stage0_modulus_out)
    );

    BU2_NWC BU5(
        .in1(x5),
        .in2(x13),
        .twiddle(twiddle_8),
        .modulus(modulus),
        .rst(rst),
        .clk(clk),

        .BU_a(stage0_fft_a5),
        .BU_b(stage0_fft_b5),
        .twiddle_BU_out(BU5_stage0_twiddle_out),
        .modulus_BU_out(BU5_stage0_modulus_out)
    );

    BU2_NWC BU6(
        .in1(x6),
        .in2(x14),
        .twiddle(twiddle_8),
        .modulus(modulus),
        .rst(rst),
        .clk(clk),

        .BU_a(stage0_fft_a6),
        .BU_b(stage0_fft_b6),
        .twiddle_BU_out(BU6_stage0_twiddle_out),
        .modulus_BU_out(BU6_stage0_modulus_out)
    );

    BU2_NWC BU7(
        .in1(x7),
        .in2(x15),
        .twiddle(twiddle_8),
        .modulus(modulus),
        .rst(rst),
        .clk(clk),

        .BU_a(stage0_fft_a7),
        .BU_b(stage0_fft_b7),
        .twiddle_BU_out(BU7_stage0_twiddle_out),
        .modulus_BU_out(BU7_stage0_modulus_out)
    );


    always_ff @( posedge clk or posedge rst ) begin : stage0
        if (rst) begin
            pip0_fft_a0 <= 'd0; pip0_fft_b0 <= 'd0;
            pip0_fft_a1 <= 'd0; pip0_fft_b1 <= 'd0;
            pip0_fft_a2 <= 'd0; pip0_fft_b2 <= 'd0;
            pip0_fft_a3 <= 'd0; pip0_fft_b3 <= 'd0;
            pip0_fft_a4 <= 'd0; pip0_fft_b4 <= 'd0;
            pip0_fft_a5 <= 'd0; pip0_fft_b5 <= 'd0;
            pip0_fft_a6 <= 'd0; pip0_fft_b6 <= 'd0;
            pip0_fft_a7 <= 'd0; pip0_fft_b7 <= 'd0;

            pip0_twiddle_0 <= 'd0; pip0_twiddle_8 <= 'd0;
            pip0_twiddle_1 <= 'd0; pip0_twiddle_9 <= 'd0;
            pip0_twiddle_2 <= 'd0; pip0_twiddle_10 <= 'd0;
            pip0_twiddle_3 <= 'd0; pip0_twiddle_11 <= 'd0;
            pip0_twiddle_4 <= 'd0; pip0_twiddle_12 <= 'd0;
            pip0_twiddle_5 <= 'd0; pip0_twiddle_13 <= 'd0;
            pip0_twiddle_6 <= 'd0; pip0_twiddle_14 <= 'd0;
            pip0_twiddle_7 <= 'd0; pip0_twiddle_15 <= 'd0;

            pip0_modulus <= 'd0;
     
        end else begin
            pip0_fft_a0 <= stage0_fft_a0;   pip0_fft_b0 <= stage0_fft_b0;
            pip0_fft_a1 <= stage0_fft_a1;   pip0_fft_b1 <= stage0_fft_b1;
            pip0_fft_a2 <= stage0_fft_a2;   pip0_fft_b2 <= stage0_fft_b2;
            pip0_fft_a3 <= stage0_fft_a3;   pip0_fft_b3 <= stage0_fft_b3;
            pip0_fft_a4 <= stage0_fft_a4;   pip0_fft_b4 <= stage0_fft_b4;
            pip0_fft_a5 <= stage0_fft_a5;   pip0_fft_b5 <= stage0_fft_b5;
            pip0_fft_a6 <= stage0_fft_a6;   pip0_fft_b6 <= stage0_fft_b6;
            pip0_fft_a7 <= stage0_fft_a7;   pip0_fft_b7 <= stage0_fft_b7;

            pip0_twiddle_0 <= twiddle_0;   pip0_twiddle_8 <= twiddle_8;
            pip0_twiddle_1 <= twiddle_1;   pip0_twiddle_9 <= twiddle_9;
            pip0_twiddle_2 <= twiddle_2;   pip0_twiddle_10 <= twiddle_10;
            pip0_twiddle_3 <= twiddle_3;   pip0_twiddle_11 <= twiddle_11;
            pip0_twiddle_4 <= twiddle_4;   pip0_twiddle_12 <= twiddle_12;
            pip0_twiddle_5 <= twiddle_5;   pip0_twiddle_13 <= twiddle_13;
            pip0_twiddle_6 <= twiddle_6;   pip0_twiddle_14 <= twiddle_14;
            pip0_twiddle_7 <= twiddle_7;   pip0_twiddle_15 <= twiddle_15;

            pip0_modulus <= modulus;

        end
    end

    //-----------stage 1------------------
    BU2_NWC BU_stage1_0(
        .in1(pip0_fft_a0),
        .in2(pip0_fft_a4),
        .twiddle(pip0_twiddle_4),
        .modulus(pip0_modulus),
        .rst(rst),
        .clk(clk),

        .BU_a(stage1_fft_a0),
        .BU_b(stage1_fft_b0),
        .twiddle_BU_out(BU0_stage1_twiddle_out),
        .modulus_BU_out(BU0_stage1_modulus_out)
    );

    BU2_NWC BU_stage1_1(
        .in1(pip0_fft_a1),
        .in2(pip0_fft_a5),
        .twiddle(pip0_twiddle_4),
        .modulus(pip0_modulus),
        .rst(rst),
        .clk(clk),

        .BU_a(stage1_fft_a1),
        .BU_b(stage1_fft_b1),
        .twiddle_BU_out(BU1_stage1_twiddle_out),
        .modulus_BU_out(BU1_stage1_modulus_out)
    );
    BU2_NWC BU_stage1_2(
        .in1(pip0_fft_a2),
        .in2(pip0_fft_a6),
        .twiddle(pip0_twiddle_4),
        .modulus(pip0_modulus),
        .rst(rst),
        .clk(clk),

        .BU_a(stage1_fft_a2),
        .BU_b(stage1_fft_b2),
        .twiddle_BU_out(BU2_stage1_twiddle_out),
        .modulus_BU_out(BU2_stage1_modulus_out)
    );
    BU2_NWC BU_stage1_3(
        .in1(pip0_fft_a3),
        .in2(pip0_fft_a7),
        .twiddle(pip0_twiddle_4),
        .modulus(pip0_modulus),
        .rst(rst),
        .clk(clk),

        .BU_a(stage1_fft_a3),
        .BU_b(stage1_fft_b3),
        .twiddle_BU_out(BU3_stage1_twiddle_out),
        .modulus_BU_out(BU3_stage1_modulus_out)
    );
    BU2_NWC BU_stage1_4(
        .in1(pip0_fft_b0),
        .in2(pip0_fft_b4),
        .twiddle(pip0_twiddle_12),
        .modulus(pip0_modulus),
        .rst(rst),
        .clk(clk),

        .BU_a(stage1_fft_a4),
        .BU_b(stage1_fft_b4),
        .twiddle_BU_out(BU4_stage1_twiddle_out),
        .modulus_BU_out(BU4_stage1_modulus_out)
    );
    BU2_NWC BU_stage1_5(
        .in1(pip0_fft_b1),
        .in2(pip0_fft_b5),
        .twiddle(pip0_twiddle_12),
        .modulus(pip0_modulus),
        .rst(rst),
        .clk(clk),

        .BU_a(stage1_fft_a5),
        .BU_b(stage1_fft_b5),
        .twiddle_BU_out(BU5_stage1_twiddle_out),
        .modulus_BU_out(BU5_stage1_modulus_out)
    );
    BU2_NWC BU_stage1_6(
        .in1(pip0_fft_b2),
        .in2(pip0_fft_b6),
        .twiddle(pip0_twiddle_12),
        .modulus(pip0_modulus),
        .rst(rst),
        .clk(clk),

        .BU_a(stage1_fft_a6),
        .BU_b(stage1_fft_b6),
        .twiddle_BU_out(BU6_stage1_twiddle_out),
        .modulus_BU_out(BU6_stage1_modulus_out)
    );
    BU2_NWC BU_stage1_7(
        .in1(pip0_fft_b3),
        .in2(pip0_fft_b7),
        .twiddle(pip0_twiddle_12),
        .modulus(pip0_modulus),
        .rst(rst),
        .clk(clk),

        .BU_a(stage1_fft_a7),
        .BU_b(stage1_fft_b7),
        .twiddle_BU_out(BU7_stage1_twiddle_out),
        .modulus_BU_out(BU7_stage1_modulus_out)
    );

    //-------------------------stage 2---------------------------------
    always_ff @( posedge clk or posedge rst ) begin : stage2
        if (rst) begin
            pip1_twiddle_0 <= 'd0; pip1_twiddle_8 <= 'd0;
            pip1_twiddle_1 <= 'd0; pip1_twiddle_9 <= 'd0;
            pip1_twiddle_2 <= 'd0; pip1_twiddle_10 <= 'd0;
            pip1_twiddle_3 <= 'd0; pip1_twiddle_11 <= 'd0;
            pip1_twiddle_4 <= 'd0; pip1_twiddle_12 <= 'd0;
            pip1_twiddle_5 <= 'd0; pip1_twiddle_13 <= 'd0;
            pip1_twiddle_6 <= 'd0; pip1_twiddle_14 <= 'd0;
            pip1_twiddle_7 <= 'd0; pip1_twiddle_15 <= 'd0;

            pip1_fft_a0 <= 'd0; pip1_fft_b0 <= 'd0;
            pip1_fft_a1 <= 'd0; pip1_fft_b1 <= 'd0;
            pip1_fft_a2 <= 'd0; pip1_fft_b2 <= 'd0;
            pip1_fft_a3 <= 'd0; pip1_fft_b3 <= 'd0;
            pip1_fft_a4 <= 'd0; pip1_fft_b4 <= 'd0;
            pip1_fft_a5 <= 'd0; pip1_fft_b5 <= 'd0;
            pip1_fft_a6 <= 'd0; pip1_fft_b6 <= 'd0;
            pip1_fft_a7 <= 'd0; pip1_fft_b7 <= 'd0;
          
            pip1_modulus <= 'd0;
        end else begin
            pip1_twiddle_0 <= pip0_twiddle_0; pip1_twiddle_8 <=  pip0_twiddle_8 ;
            pip1_twiddle_1 <= pip0_twiddle_1; pip1_twiddle_9 <=  pip0_twiddle_9 ;
            pip1_twiddle_2 <= pip0_twiddle_2; pip1_twiddle_10 <= pip0_twiddle_10;
            pip1_twiddle_3 <= pip0_twiddle_3; pip1_twiddle_11 <= pip0_twiddle_11;
            pip1_twiddle_4 <= pip0_twiddle_4; pip1_twiddle_12 <= pip0_twiddle_12;
            pip1_twiddle_5 <= pip0_twiddle_5; pip1_twiddle_13 <= pip0_twiddle_13;
            pip1_twiddle_6 <= pip0_twiddle_6; pip1_twiddle_14 <= pip0_twiddle_14;
            pip1_twiddle_7 <= pip0_twiddle_7; pip1_twiddle_15 <= pip0_twiddle_15;

            pip1_fft_a0 <= stage1_fft_a0; pip1_fft_b0 <= stage1_fft_b0;
            pip1_fft_a1 <= stage1_fft_a1; pip1_fft_b1 <= stage1_fft_b1;
            pip1_fft_a2 <= stage1_fft_a2; pip1_fft_b2 <= stage1_fft_b2;
            pip1_fft_a3 <= stage1_fft_a3; pip1_fft_b3 <= stage1_fft_b3;
            pip1_fft_a4 <= stage1_fft_a4; pip1_fft_b4 <= stage1_fft_b4;
            pip1_fft_a5 <= stage1_fft_a5; pip1_fft_b5 <= stage1_fft_b5;
            pip1_fft_a6 <= stage1_fft_a6; pip1_fft_b6 <= stage1_fft_b6;
            pip1_fft_a7 <= stage1_fft_a7; pip1_fft_b7 <= stage1_fft_b7;

            pip1_modulus <= pip0_modulus;
        end
    end

    BU2_NWC BU_stage2_0(
        .in1(pip1_fft_a0),
        .in2(pip1_fft_a2),
        .twiddle(pip1_twiddle_2),
        .modulus(pip1_modulus),
        .rst(rst),
        .clk(clk),

        .BU_a(stage2_fft_a0),
        .BU_b(stage2_fft_b0),
        .twiddle_BU_out(BU0_stage2_twiddle_out),
        .modulus_BU_out(BU0_stage2_modulus_out)
    );
    BU2_NWC BU_stage2_1(
        .in1(pip1_fft_a1),
        .in2(pip1_fft_a3),
        .twiddle(pip1_twiddle_2),
        .modulus(pip1_modulus),
        .rst(rst),
        .clk(clk),

        .BU_a(stage2_fft_a1),
        .BU_b(stage2_fft_b1),
        .twiddle_BU_out(BU1_stage2_twiddle_out),
        .modulus_BU_out(BU1_stage2_modulus_out)
    );
    BU2_NWC BU_stage2_2(
        .in1(pip1_fft_b0),
        .in2(pip1_fft_b2),
        .twiddle(pip1_twiddle_10),
        .modulus(pip1_modulus),
        .rst(rst),
        .clk(clk),

        .BU_a(stage2_fft_a2),
        .BU_b(stage2_fft_b2),
        .twiddle_BU_out(BU2_stage2_twiddle_out),
        .modulus_BU_out(BU2_stage2_modulus_out)
    );
    BU2_NWC BU_stage2_3(
        .in1(pip1_fft_b1),
        .in2(pip1_fft_b3),
        .twiddle(pip1_twiddle_10),
        .modulus(pip1_modulus),
        .rst(rst),
        .clk(clk),

        .BU_a(stage2_fft_a3),
        .BU_b(stage2_fft_b3),
        .twiddle_BU_out(BU3_stage2_twiddle_out),
        .modulus_BU_out(BU3_stage2_modulus_out)
    );
    BU2_NWC BU_stage2_4(
        .in1(pip1_fft_a4),
        .in2(pip1_fft_a6),
        .twiddle(pip1_twiddle_6),
        .modulus(pip1_modulus),
        .rst(rst),
        .clk(clk),

        .BU_a(stage2_fft_a4),
        .BU_b(stage2_fft_b4),
        .twiddle_BU_out(BU4_stage2_twiddle_out),
        .modulus_BU_out(BU4_stage2_modulus_out)
    );
    BU2_NWC BU_stage2_5(
        .in1(pip1_fft_a5),
        .in2(pip1_fft_a7),
        .twiddle(pip1_twiddle_6),
        .modulus(pip1_modulus),
        .rst(rst),
        .clk(clk),

        .BU_a(stage2_fft_a5),
        .BU_b(stage2_fft_b5),
        .twiddle_BU_out(BU5_stage2_twiddle_out),
        .modulus_BU_out(BU5_stage2_modulus_out)
    );
    BU2_NWC BU_stage2_6(
        .in1(pip1_fft_b4),
        .in2(pip1_fft_b6),
        .twiddle(pip1_twiddle_14),
        .modulus(pip1_modulus),
        .rst(rst),
        .clk(clk),

        .BU_a(stage2_fft_a6),
        .BU_b(stage2_fft_b6),
        .twiddle_BU_out(BU6_stage2_twiddle_out),
        .modulus_BU_out(BU6_stage2_modulus_out)
    );
    BU2_NWC BU_stage2_7(
        .in1(pip1_fft_b5),
        .in2(pip1_fft_b7),
        .twiddle(pip1_twiddle_14),
        .modulus(pip1_modulus),
        .rst(rst),
        .clk(clk),

        .BU_a(stage2_fft_a7),
        .BU_b(stage2_fft_b7),
        .twiddle_BU_out(BU7_stage2_twiddle_out),
        .modulus_BU_out(BU7_stage2_modulus_out)
    );
    //-------------------stage 3 ---------------------

    always_ff @( posedge clk or posedge rst ) begin : stage3
        if (rst) begin
            pip2_twiddle_0 <= 'd0; pip2_twiddle_8  <= 'd0;
            pip2_twiddle_1 <= 'd0; pip2_twiddle_9  <= 'd0;
            pip2_twiddle_2 <= 'd0; pip2_twiddle_10 <= 'd0;
            pip2_twiddle_3 <= 'd0; pip2_twiddle_11 <= 'd0;
            pip2_twiddle_4 <= 'd0; pip2_twiddle_12 <= 'd0;
            pip2_twiddle_5 <= 'd0; pip2_twiddle_13 <= 'd0;
            pip2_twiddle_6 <= 'd0; pip2_twiddle_14 <= 'd0;
            pip2_twiddle_7 <= 'd0; pip2_twiddle_15 <= 'd0;

            pip2_fft_a0 <= 'd0; pip2_fft_b0 <= 'd0;
            pip2_fft_a1 <= 'd0; pip2_fft_b1 <= 'd0;
            pip2_fft_a2 <= 'd0; pip2_fft_b2 <= 'd0;
            pip2_fft_a3 <= 'd0; pip2_fft_b3 <= 'd0;
            pip2_fft_a4 <= 'd0; pip2_fft_b4 <= 'd0;
            pip2_fft_a5 <= 'd0; pip2_fft_b5 <= 'd0;
            pip2_fft_a6 <= 'd0; pip2_fft_b6 <= 'd0;
            pip2_fft_a7 <= 'd0; pip2_fft_b7 <= 'd0;

            pip2_modulus <= 'd0;
        end else begin
            pip2_twiddle_0 <= pip1_twiddle_0; pip2_twiddle_8  <= pip1_twiddle_8 ;
            pip2_twiddle_1 <= pip1_twiddle_1; pip2_twiddle_9  <= pip1_twiddle_9 ;
            pip2_twiddle_2 <= pip1_twiddle_2; pip2_twiddle_10 <= pip1_twiddle_10;
            pip2_twiddle_3 <= pip1_twiddle_3; pip2_twiddle_11 <= pip1_twiddle_11;
            pip2_twiddle_4 <= pip1_twiddle_4; pip2_twiddle_12 <= pip1_twiddle_12;
            pip2_twiddle_5 <= pip1_twiddle_5; pip2_twiddle_13 <= pip1_twiddle_13;
            pip2_twiddle_6 <= pip1_twiddle_6; pip2_twiddle_14 <= pip1_twiddle_14;
            pip2_twiddle_7 <= pip1_twiddle_7; pip2_twiddle_15 <= pip1_twiddle_15;

            pip2_fft_a0 <= stage2_fft_a0; pip2_fft_b0 <= stage2_fft_b0;
            pip2_fft_a1 <= stage2_fft_a1; pip2_fft_b1 <= stage2_fft_b1;
            pip2_fft_a2 <= stage2_fft_a2; pip2_fft_b2 <= stage2_fft_b2;
            pip2_fft_a3 <= stage2_fft_a3; pip2_fft_b3 <= stage2_fft_b3;
            pip2_fft_a4 <= stage2_fft_a4; pip2_fft_b4 <= stage2_fft_b4;
            pip2_fft_a5 <= stage2_fft_a5; pip2_fft_b5 <= stage2_fft_b5;
            pip2_fft_a6 <= stage2_fft_a6; pip2_fft_b6 <= stage2_fft_b6;
            pip2_fft_a7 <= stage2_fft_a7; pip2_fft_b7 <= stage2_fft_b7;

            pip2_modulus <= pip1_modulus;
        end
    end
    BU2_NWC BU_stage3_0(
        .in1(pip2_fft_a0),
        .in2(pip2_fft_a1),
        .twiddle(pip2_twiddle_1),
        .modulus(pip2_modulus),
        .rst(rst),
        .clk(clk),

        .BU_a(stage3_fft_a0),
        .BU_b(stage3_fft_b0),
        .twiddle_BU_out(BU0_stage3_twiddle_out),
        .modulus_BU_out(BU0_stage3_modulus_out)
    );
    BU2_NWC BU_stage3_1(
        .in1(pip2_fft_b0),
        .in2(pip2_fft_b1),
        .twiddle(pip2_twiddle_9),
        .modulus(pip2_modulus),
        .rst(rst),
        .clk(clk),

        .BU_a(stage3_fft_a1),
        .BU_b(stage3_fft_b1),
        .twiddle_BU_out(BU1_stage3_twiddle_out),
        .modulus_BU_out(BU1_stage3_modulus_out)
    );
    BU2_NWC BU_stage3_2(
        .in1(pip2_fft_a2),
        .in2(pip2_fft_a3),
        .twiddle(pip2_twiddle_5),
        .modulus(pip2_modulus),
        .rst(rst),
        .clk(clk),

        .BU_a(stage3_fft_a2),
        .BU_b(stage3_fft_b2),
        .twiddle_BU_out(BU2_stage3_twiddle_out),
        .modulus_BU_out(BU2_stage3_modulus_out)
    );
    BU2_NWC BU_stage3_3(
        .in1(pip2_fft_b2),
        .in2(pip2_fft_b3),
        .twiddle(pip2_twiddle_13),
        .modulus(pip2_modulus),
        .rst(rst),
        .clk(clk),

        .BU_a(stage3_fft_a3),
        .BU_b(stage3_fft_b3),
        .twiddle_BU_out(BU3_stage3_twiddle_out),
        .modulus_BU_out(BU3_stage3_modulus_out)
    );
    BU2_NWC BU_stage3_4(
        .in1(pip2_fft_a4),
        .in2(pip2_fft_a5),
        .twiddle(pip2_twiddle_3),
        .modulus(pip2_modulus),
        .rst(rst),
        .clk(clk),

        .BU_a(stage3_fft_a4),
        .BU_b(stage3_fft_b4),
        .twiddle_BU_out(BU4_stage3_twiddle_out),
        .modulus_BU_out(BU4_stage3_modulus_out)
    );
    BU2_NWC BU_stage3_5(
        .in1(pip2_fft_b4),
        .in2(pip2_fft_b5),
        .twiddle(pip2_twiddle_11),
        .modulus(pip2_modulus),
        .rst(rst),
        .clk(clk),

        .BU_a(stage3_fft_a5),
        .BU_b(stage3_fft_b5),
        .twiddle_BU_out(BU5_stage3_twiddle_out),
        .modulus_BU_out(BU5_stage3_modulus_out)
    );
    BU2_NWC BU_stage3_6(
        .in1(pip2_fft_a6),
        .in2(pip2_fft_a7),
        .twiddle(pip2_twiddle_7),
        .modulus(pip2_modulus),
        .rst(rst),
        .clk(clk),

        .BU_a(stage3_fft_a6),
        .BU_b(stage3_fft_b6),
        .twiddle_BU_out(BU6_stage3_twiddle_out),
        .modulus_BU_out(BU6_stage3_modulus_out)
    );
    BU2_NWC BU_stage3_7(
        .in1(pip2_fft_b6),
        .in2(pip2_fft_b7),
        .twiddle(pip2_twiddle_15),
        .modulus(pip2_modulus),
        .rst(rst),
        .clk(clk),

        .BU_a(stage3_fft_a7),
        .BU_b(stage3_fft_b7),
        .twiddle_BU_out(BU7_stage3_twiddle_out),
        .modulus_BU_out(BU7_stage3_modulus_out)
    );

    always_ff @( posedge clk or posedge rst ) begin : output_pip
        if (rst) begin
            y0 <= 'd0;  y8 <=  'd0;  
            y1 <= 'd0;  y9 <=  'd0;   
            y2 <= 'd0;  y10 <= 'd0; 
            y3 <= 'd0;  y11 <= 'd0;  
            y4 <= 'd0;  y12 <= 'd0;  
            y5 <= 'd0;  y13 <= 'd0;
            y6 <= 'd0;  y14 <= 'd0;  
            y7 <= 'd0;  y15 <= 'd0;  
        end else begin
            y0 <= stage3_fft_a0; y8 <=  stage3_fft_a4;
            y1 <= stage3_fft_b0; y9 <=  stage3_fft_b4; 
            y2 <= stage3_fft_a1; y10 <= stage3_fft_a5;
            y3 <= stage3_fft_b1; y11 <= stage3_fft_b5;
            y4 <= stage3_fft_a2; y12 <= stage3_fft_a6;
            y5 <= stage3_fft_b2; y13 <= stage3_fft_b6;
            y6 <= stage3_fft_a3; y14 <= stage3_fft_a7;
            y7 <= stage3_fft_b3; y15 <= stage3_fft_b7;
        end
    end

endmodule