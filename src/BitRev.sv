`include "../include/define.svh"

module BitRev(
    input [`D_width-1:0] input_idx,
    input BitRev_enable,
    input [`D_width-1:0] l,
    input clk,
    input rst,

    output logic [`D_width-1:0] BitRev_out
);

    logic [`D_width-1:0] BitRev_width;



    assign BitRev_width = `radix_k1 * l;

    always_ff @(posedge clk or posedge rst) begin
        integer i;
        if (rst) begin
            for (i = 0; i<`D_width; i=i+1) begin
                BitRev_out[i] = 'd0;
            end
        end else begin
            if (BitRev_enable) begin
                for (i = 0; i<BitRev_width; i=i+1) begin
                    BitRev_out[BitRev_width-1 - i] = input_idx[i];
                end
            end else begin
                BitRev_out[BitRev_width-1 - i] = 'd0;
            end
        end
    end


endmodule