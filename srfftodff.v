// Code your design here
module srff(clk,s,r,q);
  input clk,s,r;
  output reg q;
  always@(posedge clk) begin
    case({s,r})
      2'b00:q=q;
      2'b01:q=0;
      2'b10:q=1;
      2'b11:q='bx;
    endcase
  end
endmodule
module srff_dff(clk,d,q);
  input clk,d;
  output q;
  wire s,r;
  assign s=d;
  assign r=~d;
  srff dff(.clk(clk),.s(s),.r(r),.q(q));
endmodule
// Code your testbench here
// or browse Examples
module tb;
  reg clk,d;
  wire q;
  srff_dff u1(clk,d,q);
  initial
    begin
      clk=0;
      forever #5 clk=~clk;
    end
  initial
    begin
      $monitor("t=%0t d=%b q=%b",$time,d,q);
      d=0;#10;
      d=1;#10;
      d=0;#10;
      d=1;#10;
      $finish;
    end
endmodule
///output
# KERNEL: t=0 d=0 q=x
# KERNEL: t=5 d=0 q=0
# KERNEL: t=10 d=1 q=0
# KERNEL: t=15 d=1 q=1
# KERNEL: t=20 d=0 q=1
# KERNEL: t=25 d=0 q=0
# KERNEL: t=30 d=1 q=0
# KERNEL: t=35 d=1 q=1
