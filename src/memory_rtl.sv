`include "../include/define.svh"

module memory_rtl(
    input [`D_width-1:0] data_in,
    input [`D_width-1:0] BN_idx,
    input [`MA_width-1:0] MA_idx,

    input r_enable,
    input w_enable,
    input clk,
    input rst,

    output logic [`D_width-1:0] memory_ans

);


    logic [`D_width-1:0] memory_array [0:`BN-1][0:`MA-1];
 

    always_ff @( posedge clk or posedge rst ) begin
        integer i, j;
        if (rst) begin
            for (i = 0; i<`BN; i=i+1) begin
                for (j = 0; j<`MA ; j=j+1 ) begin
                    memory_array[i][j] <= 'd0;
                end
            end
        end 
    end
 

    always_ff@(posedge clk or posedge rst) begin
        case({r_enable, w_enable})
            'b10: begin
                memory_ans <= memory_array[BN_idx][MA_idx];
            end
            'b01: begin
                memory_array[BN_idx][MA_idx] <= data_in;
            end
            'b11: begin
                memory_ans <= memory_array[BN_idx][MA_idx];
                memory_array[BN_idx][MA_idx] <= data_in;
            end
            default: begin
                memory_ans <= memory_ans;
                memory_array[BN_idx][MA_idx] <= memory_array[BN_idx][MA_idx];
            end
        endcase
    end



endmodule