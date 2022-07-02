`include "../include/define.svh"

module Controller (
    input clk, 
    input rst,
    input enable,

    output logic r_enable,
    output logic w_enable,
    output logic ntt_enable,

    output logic In_sel, //enable new input poly to be written into the DM
    

);
    
    enum {RESET, IDLE, Read_DATA, NTT, } cs, ns;



    always_ff @( posedge clk or posedge rst ) begin
        if (rst) begin
            cs <= IDLE;
        end else begin
            cs <=  ns;
        end
    end

    always_ff @( posedge clk or posedge rst ) begin
        if (rst) begin
            
        end else begin
            if (cs == ) begin
                
            end else begin
                
            end
        end
    end


    always_comb begin
        case(cs)
            RESET: begin
                ns <= IDLE;
                r_enable <= 'd0;
                w_enable <= 'd0;
            end
            IDLE: begin
                if (enable) begin
                    ns <= NTT_It1;
                end else begin
                    ns <= cs;
                end
                r_enable <= 'd0;
                w_enable <= 'd0;
            end   
            NTT_It1: begin

            end      
            data_commute: begin
                
            end
            default: begin
                
            end
        endcase
    end


endmodule