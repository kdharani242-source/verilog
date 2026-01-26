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
module tff_to_jkff(j,k,clk,q);
  input j,k,clk;
  output q;
  wire t;
  assign t=(k&q)|(j&~q);
      tff ff(.clk(clk),.t(t),.q(q));
endmodule  
// Code your testbench here
// or browse Examples
module tb;
  reg j,k,clk;
  wire q;
  tff_to_jkff ff(j,k,clk,q);
  initial
    begin
      clk=0;
      forever #5 clk=~clk;
    end
  initial
    begin
      $monitor("time=%0t j=%b k=%b q=%b",$time,j,k,q);
      j=0;k=0;#10;
      j=0;k=1;#10;
      j=1;k=0;#10;
      j=1;k=1;#10;
      j=0;k=0;#10;
      $finish;
    end
endmodule
//output
# KERNEL: time=0 j=0 k=0 q=0
# KERNEL: time=10 j=0 k=1 q=0
# KERNEL: time=20 j=1 k=0 q=0
# KERNEL: time=25 j=1 k=0 q=1
# KERNEL: time=30 j=1 k=1 q=1
# KERNEL: time=35 j=1 k=1 q=0
# KERNEL: time=40 j=0 k=0 q=0
