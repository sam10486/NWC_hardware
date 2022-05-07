`include "../include/define.svh"
`include "ModSub.sv"
`define CYCLE 10


module Testbench();
    logic [`D_width-1:0] in_1;
    logic [`D_width-1:0] in_2;
    logic [`D_width-1:0] modulus;
    logic [`D_width-1:0] out;

    assign modulus = 17;
    
    /*ModAdd ModAdd(
        .in_1(in_1),
        .in_2(in_2),
        .modulus(modulus),
        .out(out)
    );*/
    ModSub ModSub(
        .in_1(in_1),
        .in_2(in_2),
        .modulus(modulus),
        .out(out)
    );
    
    reg [`D_width-1:0] ans;
    reg c;
    integer num = 0;
    integer i, j;
    integer err = 0;

    /*initial begin
        for (i= 0; i<32;i=i+1 ) begin
            for (j=0 ; j<16; j=j+1) begin
                #`CYCLE in_1 = (i%modulus); in_2 = (j%modulus);
                #`CYCLE ans = ((i+j) % modulus);
                if (ans == out) begin
                    $display("%d data is correct!!", num);
                end else begin
                    $display("%d, %d", i,j);
                    $display("%d data is error !! your data is %b, correct data is %b", num, out, ans);
                    err = err + 1;
                end
                num = num + 1; 
            end
        end
        result(err, num);
        #(`CYCLE*`MAX) $finish;
    end*/

    initial begin
        for (i= 0; i<32;i=i+1 ) begin
            for (j=0 ; j<16; j=j+1) begin
                #`CYCLE in_1 = (i%modulus); in_2 = (j%modulus);
                #`CYCLE ans = ((i-j) < 0) ? (i-j)+modulus : (i-j)%modulus;
                if (ans == out) begin
                    $display("%d data is correct!!", num);
                end else begin
                    $display("%d, %d", i,j);
                    $display("%d data is error !! your data is %b, correct data is %b", num, out, ans);
                    err = err + 1;
                end
                num = num + 1; 
            end
        end
        result(err, num);
        #(`CYCLE*`MAX) $finish;
    end

    initial
    begin
        `ifdef FSDB
        $dumpfile("modular_tb.fsdb");
        //$fsdbDumpvars(0, TOP);
        $dumpvars;
        `elsif FSDB_ALL
        $dumpfile("modular_tb.fsdb");
        $dumpvars("+struct", "+mda", TOP);
        //$fsdbDumpvars("+struct", "+mda", i_DRAM);
        $dumpvars("+struct", i_DRAM);
        `endif
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