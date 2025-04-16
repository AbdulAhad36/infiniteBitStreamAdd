// Testbench
module bitStreamAddFsm_tb;

  reg  A,B,clk;
  wire Y;
  
  // Instantiate device under test
  bitStreamAddFsm FSM(.Y(Y),
          .A(A),
          .B(B),
          .clk(clk)
       	 );
  
    initial
 		 clk = 1;		// clk time 							period = 							10 ps
  
  	always
  		#5 clk = ~clk;
			
  initial begin
			A= 0 ; B = 0;
			#10 A= 0 ; B = 1;
    		#10 A= 1 ; B = 1;
    		#10 A= 1 ; B = 1;
    		#10 A= 0 ; B = 1;
    		#10 A= 1 ; B = 0;
  end

endmodule
