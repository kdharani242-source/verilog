// Code your design here
module fsm_moore(clk,rst,in,out);
  input clk,rst,in;
  output reg out;
  parameter s0=2'b00,
            s1=2'b01,
            s2=2'b10;
  reg [1:0] current_state,next_state;
  always@(posedge clk) begin
    if(rst)
      current_state<=s0;
    else
      current_state<=next_state;
  end
  always@(*) begin
    case(current_state)
      s0: next_state=in?s1:s0;
      s1: next_state=in?s2:s1;
      s2: next_state=in?s0:s2;
      default: next_state = s0;
    endcase
  end
  always@(*) begin
    case(current_state)
      s2: out=1'b1;
        default: out=1'b0;
    endcase
  end
endmodule

// Code your testbench here
// or browse Examples
module tb;
  reg clk,rst,in;
  wire out;
  wire current_state,next_state;
  fsm_moore u1(clk,rst,in,out);
  initial
    begin
      clk=0;
      forever #5 clk=~clk;
    end
  initial
    begin
      $monitor("time=%0t rst=%b in=%b out=%b",$time,rst,in,out);
      rst=1;in=0;#10;
      rst=0;in=0;#10;
      rst=0;in=1;#10;
      rst=0;in=1;#10;
      rst=0;in=1;#10;
      rst=0;in=1;#10;
      rst=0;in=1;#10;
      $finish;
    end
endmodule

//output
# KERNEL: time=0 rst=1 in=0 out=x
# KERNEL: time=5 rst=1 in=0 out=0
# KERNEL: time=10 rst=0 in=0 out=0
# KERNEL: time=20 rst=0 in=1 out=0
# KERNEL: time=35 rst=0 in=1 out=1
# KERNEL: time=45 rst=0 in=1 out=0
# KERNEL: time=65 rst=0 in=1 out=1
