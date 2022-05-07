`include "../include/define.svh"
`include "ModAdd.sv"
`include "ModSub.sv"
`include "barrett_reduction.sv"

module BU2_FFT (
    input [`D_width-1:0] in1,
    input [`D_width-1:0] in2,
    input [`D_width-1:0] twiddle,
    input [`D_width-1:0] modulus,
    input rst,
    input clk,

    output logic BU_valid,
    output logic [`D_width-1:0] fft_a,
    output logic [`D_width-1:0] fft_b,
    output logic [`D_width-1:0] twiddle_BU_out,
    output logic [`D_width-1:0] modulus_BU_out
);
    
    logic [`D_width-1:0] add1_out;
    logic [`D_width-1:0] sub1_out;
    logic [`D_width-1:0] fft_a_pip1;
    logic [`D_width-1:0] fft_b_pip1;
    logic [`D_width-1:0] fft_a_pip2;
    logic [`D_width-1:0] fft_b_pip2;
    logic [`D_width-1:0] fft_a_pip3;

    logic [`D_width-1:0] modulus_pip1;
    logic [`D_width-1:0] modulus_pip2;

    logic [`D_width-1:0] twiddle_pip1;
    logic [`D_width-1:0] twiddle_pip2;

    logic [`D_width-1:0] barrett_result;
    logic [`D_width-1:0] barrett_modulus;
    logic [2:0] cnt;

    ModAdd add1(
        .in_1(in1),
        .in_2(in2),
        .modulus(modulus),
        .out(add1_out)
    );

    ModSub sub1(
        .in_1(in1),
        .in_2(in2),
        .modulus(modulus),
        .out(sub1_out)
    );

    barrett_reduction #(.pre_computing_width(10) , 
                        .precompute(10'd679))
    barrett_reduction(
        .a(fft_b_pip1),
        .b(twiddle_pip1),
        .modulus(modulus_pip1),
        .clk(clk),
        .rst(rst),

        .result(barrett_result)
    );

    always_ff @( posedge clk or posedge rst ) begin
        if(rst) begin
            cnt <= 'd0;
        end else begin
            if (cnt == 'd4) begin
                cnt <= cnt;
            end else begin
                cnt <= cnt + 'd1;
            end
        end
    end
    assign BU_valid = (cnt == 'd4) ? 'd1 : 'd0;

    always_ff @( posedge clk or posedge rst ) begin
        if (rst) begin
            fft_a_pip1 <= 'd0;
            fft_b_pip1 <= 'd0;
            modulus_pip1 <= 'd0;
            twiddle_pip1 <= 'd0;
        end else begin
            fft_a_pip1 <= add1_out;
            fft_b_pip1 <= sub1_out;
            modulus_pip1 <= modulus;
            twiddle_pip1 <= twiddle;

        end
    end
    always_ff@(posedge clk or posedge rst) begin
        if(rst) begin
            fft_a_pip2 <= 'd0;
        end else begin
            fft_a_pip2 <= fft_a_pip1;
        end
    end
    always_ff @( posedge clk or posedge rst ) begin
       if (rst) begin
           fft_a_pip3 <= 'd0;
           fft_b_pip2 <= 'd0;
           modulus_pip2 <= 'd0;
           twiddle_pip2 <= 'd0;
       end else begin
           fft_a_pip3 <= fft_a_pip2;
           fft_b_pip2 <= barrett_result;
           modulus_pip2 <= modulus_pip1;
           twiddle_pip2 <= twiddle_pip1;
       end
    end

    always_ff @( posedge clk or posedge rst ) begin
        if (rst) begin
            fft_a <= 'd0;
            fft_b <= 'd0;
            modulus_BU_out <= 'd0;
            twiddle_BU_out <= 'd0;
        end else begin
            fft_a <= fft_a_pip3;
            fft_b <= fft_b_pip2;
            modulus_BU_out <= modulus_pip2;
            twiddle_BU_out <= twiddle_pip2;
        end
    end
   
endmodule