// Code your design here
module tff(t,clk,q);
  input t,clk;
  output reg q=0;
  always@(posedge clk) begin
    if(!t) begin
      q<=q;
    end
    else begin
      q<=~q;
    end
  end
endmodule
    module tff_to_srff(s,r,clk,q);
  input s,r,clk;
  output q;
  wire t;
   assign t=(r&q)|(s&~q);
      tff ff(.clk(clk),.t(t),.q(q));
endmodule  
//tb
// Code your testbench here
// or browse Examples
module tb;
  reg s,r,clk;
  wire q;
  tff_to_srff ff(s,r,clk,q);
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
# KERNEL: time=0 s=0 r=0 q=0
# KERNEL: time=10 s=0 r=1 q=0
# KERNEL: time=20 s=1 r=0 q=0
# KERNEL: time=25 s=1 r=0 q=1
# KERNEL: time=30 s=1 r=1 q=1
# KERNEL: time=35 s=1 r=1 q=0
# KERNEL: time=40 s=0 r=0 q=0
