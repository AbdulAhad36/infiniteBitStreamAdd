



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
 		 clk = 0;		// clk time 							period = 							10 ps
  
  	always
  		#5 clk = ~clk;
			
  initial begin

    
    A = 0; B = 0;
    #10 A = 0; B = 1;
    #10 A = 1; B = 1;
    #10 A = 1; B = 1;
    #10 A = 0; B = 1;
    #10 A = 1; B = 0;
    #10 A = 0; B = 1;
    #10 A = 1; B = 0;
    #10 A = 1; B = 1;
    #10 A = 0; B = 0;
    #10 A = 1; B = 1;
    #10 A = 0; B = 1;
    #10 A = 1; B = 0;
    #10 A = 0; B = 0;
    #10 A = 1; B = 1;
    #10 A = 1; B = 0;
  end

endmodule



// module bitStreamAddFsm_tb;

//   reg A, B, clk;
//   wire Y;
  
//   // Instantiate device under test
//   bitStreamAddFsm FSM (
//     .Y(Y),
//     .A(A),
//     .B(B),
//     .clk(clk)
//   );

//   integer i;

//   initial clk = 0;
//   always #5 clk = ~clk;

//   initial begin
//     $display("Time\tA\tB\tY");
//     $monitor("%0dns\t%b\t%b\t%b", $time, A, B, Y);
    
//     // Initialize with some values
//     A = 0;
//     B = 0;
    
//     // Wait for 1st posedge
//     @(posedge clk);

//     // Generate 16 bits
//     for (i = 0; i < 16; i = i + 1) begin
//       A = $random % 2;
//       B = $random % 2;
//       @(posedge clk);  // Wait for next clock cycle
//     end

//     //$finish;
//   end

// endmodule