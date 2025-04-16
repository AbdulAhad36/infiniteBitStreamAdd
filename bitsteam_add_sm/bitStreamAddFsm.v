module bitStreamAddFsm(
  output reg Y,
  input A,
  input B,
  input clk
);

  reg carry;
  reg [1:0] current_state;

	//State encoding
  parameter STATE_0 = 2'b00,
            STATE_1 = 2'b01,
            STATE_2 = 2'b10,
            STATE_3 = 2'b11;



always @(posedge clk) begin


    case (current_state)
      STATE_0: begin
        if (A == 0 && B == 0 && carry == 0) begin
          Y <= 0; carry <= 0;
        end else if ((A ^ B) && carry == 0) begin
          Y <= 1; carry <= 0; current_state <= STATE_1;
        end else if (A == 1 && B == 1 && carry == 0) begin
          Y <= 0; carry <= 1; current_state <= STATE_2;
        end
      end

      STATE_1: begin
        if (A == 0 && B == 0 && carry == 0) begin
          Y <= 0; carry <= 0; current_state <= STATE_0;
        end else if ((A ^ B) && carry == 0) begin
          Y <= 1; carry <= 0;
        end else if (A == 1 && B == 1 && carry == 0) begin
          Y <= 0; carry <= 1; current_state <= STATE_2;
        end
      end

      STATE_2: begin
        if (A == 0 && B == 0 && carry == 1) begin
          Y <= 1; carry <= 0; current_state <= STATE_1;
        end else if ((A ^ B) && carry == 1) begin
          Y <= 0; carry <= 1;
        end else if (A == 1 && B == 1 && carry == 1) begin
          Y <= 1; carry <= 1; current_state <= STATE_3;
        end
      end

      STATE_3: begin
        if (A == 0 && B == 0 && carry == 1) begin
          Y <= 1; carry <= 0; current_state <= STATE_1;
        end else if ((A ^ B) && carry == 1) begin
          Y <= 0; carry <= 1; current_state <= STATE_2;
        end else if (A == 1 && B == 1 && carry == 1) begin
          Y <= 1; carry <= 1;
        end
      end

      default: begin
        current_state <= STATE_0;
        carry <= 0;
        Y <= 0;
      end
    endcase
  end
endmodule
