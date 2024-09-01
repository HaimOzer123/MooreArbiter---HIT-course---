`timescale 1ns / 1ps

module MooreArbiter_tb;

reg clock;
reg reset;
reg [3:0] request;
wire [3:0] grant;
Arbiter uut (
    .clock(clock),
    .reset(reset),
    .request(request),
    .grant(grant)
);
reg [3:0] request_sequence[7:0];
integer i;
initial begin
    clock = 0;
    forever #10 clock = ~clock; // 50 MHz clock
end
initial begin
    reset = 1;
    request = 4'b0000;
    #20;
    reset = 0;
    
    request_sequence[0] = 4'b0001;
    request_sequence[1] = 4'b0010;
    request_sequence[2] = 4'b0100;
    request_sequence[3] = 4'b1000;
    request_sequence[4] = 4'b0011;
    request_sequence[5] = 4'b0110;
    request_sequence[6] = 4'b1100;
    request_sequence[7] = 4'b0000;
    for (i = 0; i < 8; i = i + 1) begin
        request = request_sequence[i];
        #20;
    end
    
    $finish;
end

endmodule
