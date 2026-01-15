// Code your design here
module srff(s,r,clk,q);
  input s,r,clk;
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
// Code your testbench here
// or browse Examples
// Code your testbench here
// or browse Examples
module tb;
  reg s,r,clk;
  wire q;
  srff u1(s,r,clk,q);
  initial
    begin
      clk=0;
      forever #5 clk=~clk;
    end
  initial
    begin
      $monitor("t=%0t s=%b r=%b q=%b",$time,s,r,q);
      s=1;r=0;#10;//set
      s=0;r=0;#10;//hold
      s=0;r=1;#10;//reset
      s=1;r=1;#10;//invalid
      $finish;
    end
endmodule

//output
# KERNEL: t=0 s=1 r=0 q=x
# KERNEL: t=5 s=1 r=0 q=1
# KERNEL: t=10 s=0 r=0 q=1
# KERNEL: t=20 s=0 r=1 q=1
# KERNEL: t=25 s=0 r=1 q=0
# KERNEL: t=30 s=1 r=1 q=0
# KERNEL: t=35 s=1 r=1 q=x
      
