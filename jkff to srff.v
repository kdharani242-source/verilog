// Code your design here
// Code your design here
module jkff(j, k, clk, q);
  input j, k, clk;
  output reg q;

  always @(posedge clk) begin
    case ({j, k})
      2'b00: q=q;       // hold
      2'b01: q=1'b0;    // reset
      2'b10: q=1'b1;    // set
      2'b11: q=~q;      // toggle
    endcase
  end
endmodule
module jkff_to_srff(s,r,clk,q);
  input s,r,clk;
  output q;
  wire j,k;
  assign j=s;
  assign k=r;
  jkff ff(.clk(clk),.j(j),.k(k),.q(q));
endmodule
//tb
// Code your testbench here
// or browse Examples
// Code your testbench here
// or browse Examples
module tb;
  reg s,r,clk;
  wire q;
  jkff_to_srff ff(s,r,clk,q);
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
# KERNEL: time=35 s=1 r=1 q=0
# KERNEL: time=40 s=0 r=0 q=0
      
