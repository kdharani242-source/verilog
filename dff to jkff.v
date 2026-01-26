// Code your design here
module dff(d,clk,q);
  input d,clk;
  output reg q;
  always@(posedge clk) begin
      q<=d;
  end
endmodule
module dff_to_jkff(j,k,clk,q);
  input j,k,clk;
  output q;
  wire d;
  assign d=(~k&q)|(j&~q);
  dff ff(.clk(clk),.d(d),.q(q));
endmodule  
//tb
// Code your testbench here
// or browse Examples
module tb;
  reg j,k,clk;
  wire q;
  dff_to_jkff ff(j,k,clk,q);
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
# KERNEL: time=0 j=0 k=0 q=x
# KERNEL: time=10 j=0 k=1 q=x
# KERNEL: time=15 j=0 k=1 q=0
# KERNEL: time=20 j=1 k=0 q=0
# KERNEL: time=25 j=1 k=0 q=1
# KERNEL: time=30 j=1 k=1 q=1
# KERNEL: time=35 j=1 k=1 q=0
# KERNEL: time=40 j=0 k=0 q=0
