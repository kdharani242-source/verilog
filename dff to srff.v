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
module dff_to_srff(s,r,clk,q);
  input s,r,clk;
  output q;
  wire d;
  assign d=s|(~r&q);
  dff ff(.clk(clk),.d(d),.q(q));
endmodule  
//tb
// Code your testbench here
// or browse Examples
module tb;
  reg s,r,clk;
  wire q;
  dff_to_srff ff(s,r,clk,q);
  initial
    begin
      clk=0;
      forever #5 clk=~clk;
    end
  initial
    begin
      $monitor("time=%0t s=%b r=%b q=%b",$time,s,r,q);
      s=0;r=0;#10;
      s=0;r=1;#10;
      s=1;r=0;#10;
      s=1;r=1;#10;
      s=0;r=0;#10;
      $finish;
    end
endmodule
//output
# KERNEL: time=0 s=0 r=0 q=x
# KERNEL: time=10 s=0 r=1 q=x
# KERNEL: time=15 s=0 r=1 q=0
# KERNEL: time=20 s=1 r=0 q=0
# KERNEL: time=25 s=1 r=0 q=1
# KERNEL: time=30 s=1 r=1 q=1
# KERNEL: time=40 s=0 r=0 q=1
