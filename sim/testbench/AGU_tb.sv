`include "../include/define.svh"
`include "AGU_top.sv"
`define CYCLE 10

module Testbench ();
    logic clk;
    logic rst;
    logic enable;
    logic AGU_done_out;

    logic [`MA_width-1:0] MA_idx;
    logic [`BANK_width-1:0] BN_idx;
    
    logic [`BANK_width-1:0] BN_golden [0:`degree*`k-1];
    logic [`MA_width-1:0] MA_golden [0:`degree*`k-1];
    logic [`D_width -1 :0] cnt;
    logic [`D_width -1 :0] it_cnt;

    initial begin
        $readmemh("../sim/data_file/AGU_idx/AGU_algo_bank.txt", BN_golden);  
        $readmemh("../sim/data_file/AGU_idx/AGU_algo_MA.txt", MA_golden);  
    end

    AGU_top AGU_top(
        .clk(clk),
        .rst(rst),
        .AGU_enable(enable),

        .MA_idx(MA_idx),
        .BN_idx(BN_idx),
        .AGU_done_out(AGU_done_out),
        .BN_MA_out_en(BN_MA_out_en)
    );

    always #(`CYCLE/2) clk = ~clk;

    initial begin
        #0
        clk = 0; 
        rst = 1;
        #`CYCLE rst = 0;
    end

    always_ff @( posedge clk or posedge rst ) begin : blockName
        if (rst) begin
            it_cnt <= 'd0;
        end else begin
            if (cnt == `degree-1 && it_cnt != `k) begin
                it_cnt <= it_cnt + 'd1;
            end else begin
                it_cnt <= it_cnt; 
            end
        end
    end


    always_ff @( posedge clk or posedge rst ) begin
        if (rst) begin
            cnt <= 'd0;
        end else begin
            if (AGU_done_out) begin
                cnt <= cnt;
            end else begin
                if (cnt == `degree-1 || it_cnt == `k) begin
                    cnt <= 'd0;
                end else begin
                    cnt <= cnt + 'd1;
                end
            end
        end
    end

    always_comb begin
        if (rst) begin
            enable = 'd0;
        end else begin
            if (it_cnt == `k) begin
                enable <= 'd0;
            end else begin
                enable <= 'd1;
            end
        end
    end

    integer num = 0;
    integer err = 0;
    initial begin
        #(`CYCLE*7);
        if (BN_MA_out_en) begin
            for (int i = 0; i<`degree*`k ; i++) begin
                if (BN_idx == BN_golden[i] && MA_idx == MA_golden[i]) begin
                    $display("%d data is correct, your (BN, MA) = (%d, %d), golden (BN, MA) = (%d, %d)",
                            num, BN_idx, MA_idx, BN_golden[i], MA_golden[i]);
                end else begin
                    $display("%d data is failed!!!!, your (BN, MA) = (%d, %d), golden (BN, MA) = (%d, %d)", 
                            num, BN_idx, MA_idx, BN_golden[i], MA_golden[i]);
                    err = err + 1;
                end
                num = num + 1;
                #`CYCLE;
            end
        end
        result(err, num);
        #(`CYCLE*`MAX) $finish;
    end
    
    initial begin
        $dumpfile("AGU_tb.vcd");
        $dumpvars;
        #(`CYCLE*`MAX)
        $finish;
    end

    task result;
    input integer err;
    input integer num;
    integer rf;
    begin
      if (err === 0)
      begin
        $display("\n");
        $display("\n");
        $display("        ****************************               ");
        $display("        **                        **       |\__||  ");
        $display("        **  Congratulations !!    **      / O.O  | ");
        $display("        **                        **    /_____   | ");
        $display("        **  Simulation PASS!!     **   /^ ^ ^ \\  |");
        $display("        **                        **  |^ ^ ^ ^ |w| ");
        $display("        ****************************   \\m___m__|_|");
        $display("\n");
      end
      else
      begin
        $display("\n");
        $display("\n");
        $display("        ****************************               ");
        $display("        **                        **       |\__||  ");
        $display("        **  OOPS!!                **      / X,X  | ");
        $display("        **                        **    /_____   | ");
        $display("        **  Simulation Failed!!   **   /^ ^ ^ \\  |");
        $display("        **                        **  |^ ^ ^ ^ |w| ");
        $display("        ****************************   \\m___m__|_|");
        $display("         Totally has %d errors                     ", err); 
        $display("\n");
      end
    end
  endtask
endmodule