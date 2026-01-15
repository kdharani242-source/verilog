// Code your design here
module dff(d,clk,q);
  input d,clk;
  output reg q;
  always@(posedge clk) begin
    if(clk) begin
      q<=d;
    end
  end
endmodule
// Code your testbench here
// or browse Examples
module tb;
  reg d,clk;
  wire q;
  dff u1(d,clk,q);
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
      $finish;
    end
endmodule
//output
# KERNEL: t=0 d=0 q=x
# KERNEL: t=5 d=0 q=0
# KERNEL: t=10 d=1 q=0
# KERNEL: t=15 d=1 q=1
# KERNEL: t=20 d=0 q=1
# KERNEL: t=25 d=0 q=0
