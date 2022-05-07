 //==============================================                                                
 //Writer:Shi-Yong Wu                                                                            
 //                                                                                              
 //Note:Modular multiplier                                                                       
 //using barrett reduction                                                                       
 //==============================================                                                

`include "../include/define.svh"                                                 
                                                                                                 
 module BR(                                                                                  
   input [`DOUBLE_DATA_WIDTH -1:0] S_in,                                                                                                                                                                            
   input rst,                                                                                        
   input clk,
   output logic [`DATA_WIDTH-1:0] result
 );                                                                                              
                                                                                           
   logic  [`DATA_FRI_RS_WIDTH-1:0] S_out_RS; //32-14 = 18                                            
   logic  [`DATA_MULT_PRE_WIDTH-1:0] af_pre; //18+16 = 34    mult by pre_computing                   
   logic  [`DATA_WIDTH:0] Q;               //quotient                                              
   logic  [`DOUBLE_DATA_WIDTH-1:0] QM;       //32 bits                                               
   logic  [`DATA_WIDTH:0] C_Minus_QM;                                                                
   logic  [`DATA_WIDTH:0] C_Minus_QM_1;                                                              
   logic  [`DATA_WIDTH-1:0] C_Minus_QM_MUX; 

  always_comb begin
    S_out_RS = S_in >> `rf_FRI;
    af_pre = S_out_RS * `pre_computing;
    Q = af_pre >> `rf_SEC;
    QM = Q * `Prime;
    //adder part 
    C_Minus_QM = S_in - QM;
    C_Minus_QM_1 = C_Minus_QM -`Prime;   
    C_Minus_QM_MUX   = ((C_Minus_QM_1[`DATA_WIDTH] == 1'b1))? C_Minus_QM:C_Minus_QM_1;       
  end

   always_ff @( posedge clk or posedge rst ) begin
       if (rst) begin
           result <= 'd0;
       end else begin
           result <= C_Minus_QM_MUX;
       end
   end                                                                                       
                                                                                                 
                                                                                                 
 endmodule                                                                                       
