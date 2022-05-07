`include "../include/define.svh"

module barrett_reduction 
#(
    parameter DATA_WIDTH = `D_width, //8
    parameter DOUBLE_DATA_WIDTH = 2 * DATA_WIDTH,//16
    parameter alpha = DATA_WIDTH + 1,//9
    parameter beta = -2,
    parameter RS_FRI = DATA_WIDTH + beta,//6
    parameter RS_SEC = alpha - beta,//11
    parameter pre_computing_width = DATA_WIDTH + 3,//13
    parameter DATA_FRI_RS_WIDTH = DOUBLE_DATA_WIDTH - RS_FRI,//10
    parameter DATA_MULT_PRE_WIDTH = DATA_FRI_RS_WIDTH + pre_computing_width,//23
    parameter precompute  = 11'd514
)
(
    input [DATA_WIDTH-1:0] a,
    input [DATA_WIDTH-1:0] b,
    input [DATA_WIDTH-1:0] modulus,
    input clk,
    input rst,
    
    output logic [DATA_WIDTH-1:0] result

);

    logic [DOUBLE_DATA_WIDTH-1:0] a_mul_b;//16
    logic [DATA_FRI_RS_WIDTH-1:0] a_mul_b_RS;//10
    logic [DATA_MULT_PRE_WIDTH-1:0] a_mul_b_RS_mul_precompute;//23
    logic [DATA_WIDTH:0] Q;
    logic [DOUBLE_DATA_WIDTH-1:0] QM;
    logic [DATA_WIDTH:0] C_Minus_QM;
    logic [DATA_WIDTH:0] C_Minus_QM_1;
    logic [DATA_WIDTH-1:0]C_Minus_QM_MUX;

    /*always_ff @( posedge clk or posedge rst ) begin
        if (rst) begin
            a_mul_b <= 'd0;
        end else begin
            a_mul_b <= a * b;
        end
    end*/

    always_comb begin
        a_mul_b = a*b;
        a_mul_b_RS = a_mul_b >> RS_FRI;
        a_mul_b_RS_mul_precompute = a_mul_b_RS * precompute;
        Q = a_mul_b_RS_mul_precompute >> RS_SEC;
        QM = Q * modulus;
        //adder part
        C_Minus_QM = a_mul_b - QM;
        C_Minus_QM_1 = C_Minus_QM - modulus;
        C_Minus_QM_MUX   = ((C_Minus_QM_1[DATA_WIDTH] == 1'b1)) ? C_Minus_QM : C_Minus_QM_1; 
    end
    
    always_ff @( posedge clk or posedge rst ) begin
        if (rst) begin
            result <= 'd0;
        end else begin
            result <= C_Minus_QM_MUX;
        end
    end
endmodule