`include "../include/define.svh"
`define CYCLE 10
`include "memory_rtl.sv"

module Testbench ();
    logic clk;
    logic rst;
    logic r_enable;
    logic w_enable;

    logic [`D_width-1:0] data_in;
    logic [`D_width-1:0] BN_idx;
    logic [`MA_width-1:0] MA_idx;

    logic [`D_width-1:0] memory_ans;

    logic [`BANK_width-1:0] BN_golden [0:`degree-1];
    logic [`MA_width-1:0] MA_golden [0:`degree-1];
    logic [`D_width-1:0] data_golden [0:`degree-1];

    logic [`D_width-1:0] cnt;
    integer num = 0;
    integer err = 0;
    logic flag = 0;
    integer i;

    memory_rtl mem(
        .data_in(data_in),
        .BN_idx(BN_idx),
        .MA_idx(MA_idx),

        .r_enable(r_enable),
        .w_enable(w_enable),
        .clk(clk),
        .rst(rst),
        .memory_ans(memory_ans)
    );

    initial begin
        $readmemh("../sim/data_file/mem/mem_algo_bank.txt", BN_golden);  
        $readmemh("../sim/data_file/mem/mem_algo_MA.txt", MA_golden);  
        $readmemh("../sim/data_file/mem/mem_algo_data.txt", data_golden);  
    end


    always #(`CYCLE/2) clk = ~clk;

    initial begin
        #0
        clk = 0; 
        rst = 1;
        i = 0;
        #`CYCLE rst = 0;
    end


    always_ff @( posedge clk or posedge rst ) begin
        if (rst) begin
            cnt <= 'd0;            
        end else begin
            if (cnt == `degree - 1) begin
                cnt <= cnt;
            end else begin
                cnt <= cnt + 'd1;
            end
        end
    end

    initial begin
        for(int i=0; i<`BN; i = i+1) begin
            for (int j =0 ;j<`MA ;j=j+1 ) begin
                data_in <= i*`BN + j;
                BN_idx <= i;
                MA_idx <= j;
                r_enable <= 'd0;
                w_enable <= 'd1;
                flag = flag;
                #`CYCLE;
            end
        end
        flag = 1;
    end

    initial begin
        #(`CYCLE*8192);
        for(int i=0; i<`degree; i = i+1) begin
            data_in <= 'd0;
            BN_idx <= BN_golden[i];
            MA_idx <= MA_golden[i];
            r_enable <= 'd0;
            w_enable <= 'd1;
            #`CYCLE;
            if (memory_ans == data_golden[i]) begin
                $display("%d data is correct, your (BN, MA, data) = (%d, %d, %d), golden (BN, MA, data) = (%d, %d, %d)",
                            num, BN_idx, MA_idx, memory_ans, BN_golden[i], MA_golden[i], data_golden[i]);
            end else begin
                $display("%d data is failed!!!!, your (BN, MA, data) = (%d, %d, %d), golden (BN, MA, data) = (%d, %d, %d)",
                            num, BN_idx, MA_idx, memory_ans, BN_golden[i], MA_golden[i], data_golden[i]);
                err = err + 1;
            end
            num = num + 1;
        end
        result(err, num);
        #(`CYCLE*`MAX) $finish;
    end


    initial begin
        $dumpfile("MEM_tb.vcd");
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