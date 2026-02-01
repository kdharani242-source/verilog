module accumulator (
    input clk,
    input rst,
    input enable,
    input [7:0] data_in,
    output reg [7:0] acc
);

always @(posedge clk) begin
    if (rst)
        acc <= 8'b00000000;
    else if (enable)
        acc <= acc + data_in;   // Accumulation
end

endmodule
module tb;
  reg clk,rst,enable;
  reg [7:0] data_in;
  wire [7:0] acc;
  accumulator  dut(clk,rst,enable,data_in,acc);
  initial
    begin
      clk=0;
      forever #5 clk=~clk;
    end
  initial
    begin
      $monitor("time=%0t rst=%b enable=%b data_in=%b acc=%b",$time,rst,enable,data_in,acc);
      rst=1;enable=0;data_in='b10101010;#10;
      rst=0;enable=0;data_in='b10101010;#10;
      rst=0;enable=1;data_in='b10101010;#10;
      rst=0;enable=1;data_in='b10101111;#10;
      rst=0;enable=1;data_in='b11101010;#10;
      $finish;
    end
endmodule
//output
time=0 rst=1 enable=0 data_in=10101010 acc=xxxxxxxx
time=5 rst=1 enable=0 data_in=10101010 acc=00000000
time=10 rst=0 enable=0 data_in=10101010 acc=00000000
time=20 rst=0 enable=1 data_in=10101010 acc=00000000
time=25 rst=0 enable=1 data_in=10101010 acc=10101010
time=30 rst=0 enable=1 data_in=10101111 acc=10101010
time=35 rst=0 enable=1 data_in=10101111 acc=01011001
time=40 rst=0 enable=1 data_in=11101010 acc=01011001
time=45 rst=0 enable=1 data_in=11101010 acc=01000011
