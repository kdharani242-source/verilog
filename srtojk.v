// Code your design here
module srff(clk,s,r,q);
  input clk,s,r;
  output reg q=0;
  always@(posedge clk) begin
    case({s,r})
      2'b00:q<=q;
      2'b01:q<=0;
      2'b10:q<=1;
      2'b11:q<='bx;
    endcase
  end
endmodule
module sr_to_jk_ff(clk,j,k,q);
  input clk,j,k;
  output q;
  wire s,r;
  assign s=~q&j;
  assign r=q&k;
  srff sr(.clk(clk),.s(s),.r(r),.q(q));
endmodule
// Code your testbench here
// or browse Examples
module tb;
  reg j,k,clk;
  wire q;
  sr_to_jk_ff u1(clk,j,k,q);
  initial
    begin
      clk=0;
      forever #5 clk=~clk;
    end
  initial
    begin
      $monitor("t=%0t j=%b k=%b q=%b",$time,j,k,q);
      j=0;k=1;#10;
      j=1;k=1;#10;
      j=0;k=0;#10;
      j=0;k=1;#10;
      j=1;k=0;#10;
      j=0;k=1;#10;
      $finish;
    end
endmodule

//output
# KERNEL: t=0 j=0 k=1 q=0
# KERNEL: t=10 j=1 k=1 q=0
# KERNEL: t=15 j=1 k=1 q=1
# KERNEL: t=20 j=0 k=0 q=1
# KERNEL: t=30 j=0 k=1 q=1
# KERNEL: t=35 j=0 k=1 q=0
# KERNEL: t=40 j=1 k=0 q=0
# KERNEL: t=45 j=1 k=0 q=1
# KERNEL: t=50 j=0 k=1 q=1
# KERNEL: t=55 j=0 k=1 q=0
