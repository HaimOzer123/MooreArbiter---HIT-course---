module MooreArbiter (
	input wire CLK,RESET,req0,req1,req2,req3,
  output reg grant0,grant1,grant2,grant3);

  // Define states
  reg [2:0] currentState, nextState;

  // State constants
  parameter IDLE_STATE = 3'b000;
  parameter GRANT_STATE_0 = 3'b001;
  parameter GRANT_STATE_1 = 3'b010;
  parameter GRANT_STATE_2 = 3'b011;
  parameter GRANT_STATE_3 = 3'b100;

  // logic for next state and outputs
  always @(*) begin
    grant0 = (currentState == GRANT_STATE_0);
    grant1 = (currentState == GRANT_STATE_1);
    grant2 = (currentState == GRANT_STATE_2);
    grant3 = (currentState == GRANT_STATE_3);

    // Default next state
    nextState = currentState;

    // State transitions
    case (currentState)
      IDLE_STATE:
        if (req0) begin
          nextState = GRANT_STATE_0;
        end
        else if (req1) begin
          nextState = GRANT_STATE_1;
        end
        else if (req2) begin
          nextState = GRANT_STATE_2;
        end
        else if (req3) begin 
          nextState = GRANT_STATE_3;
        end
	
      GRANT_STATE_0: begin 		    
			if (!req0) begin
          nextState = IDLE_STATE;
        end
		 end
      GRANT_STATE_1: begin 		    
			if (!req1) begin
          nextState = IDLE_STATE;
        end
		 end
      GRANT_STATE_2:begin 		    
			if (!req2) begin
          nextState = IDLE_STATE;
        end
		 end
      GRANT_STATE_3:begin 		    
			if (!req3) begin
          nextState = IDLE_STATE;
        end
		 end
		 
      default: nextState = IDLE_STATE;
    endcase
  end

  // Sequential logic for state register and synchronous reset
always @(posedge CLK) begin
    if (RESET) begin
        currentState <= IDLE_STATE;
    end
    else begin
        currentState <= nextState;
    end
end

endmodule