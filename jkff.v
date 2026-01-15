// Code your design here
module jkff(j,k,clk,q);
  input j,k,clk;
  output reg q;
  always@(posedge clk) begin
    case({j,k})
      2'b00:q=q;
      2'b01:q=0;
      2'b10:q=1;
      2'b11:q=~q;
    endcase
  end
endmodule

// Code your testbench here
// or browse Examples
module tb;
  reg j,k,clk;
  wire q;
  jkff u1(j,k,clk,q);
  initial
    begin
      clk=0;
      forever #5 clk=~clk;
    end
  initial
    begin
      $monitor("t=%0t j=%b k=%b q=%b",$time,j,k,q);
      j=1;k=0;#10;//set
      j=0;k=0;#10;//hold
      j=0;k=1;#10;//reset
      j=1;k=1;#10;//toggle
      $finish;
    end
endmodule
      //output
# KERNEL: t=0 j=1 k=0 q=x
# KERNEL: t=5 j=1 k=0 q=1
# KERNEL: t=10 j=0 k=0 q=1
# KERNEL: t=20 j=0 k=1 q=1
# KERNEL: t=25 j=0 k=1 q=0
# KERNEL: t=30 j=1 k=1 q=0
# KERNEL: t=35 j=1 k=1 q=1
