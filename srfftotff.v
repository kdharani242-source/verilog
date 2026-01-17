// Code your design here
// Code your design here
module srff(clk,s,r,q);
  input clk,s,r;
  output reg q=0;
  always@(posedge clk) begin
    case({s,r})
      2'b00:q=q;
      2'b01:q=0;
      2'b10:q=1;
      2'b11:q='bx;
    endcase
  end
endmodule
module srff_tff(clk,t,q);
  input clk,t;
  output q;
  wire s,r;
  assign s=t&~q;
  assign r=t&q;
  srff dff(.clk(clk),.s(s),.r(r),.q(q));
endmodule
// Code your testbench here
// or browse Examples
module tb;
  reg clk,t;
  wire q;
  srff_tff u1(clk,t,q);
  initial
    begin
      clk=0;
      forever #5 clk=~clk;
    end
  initial
    begin
      $monitor("time=%0t t=%b q=%b",$time,t,q);
      t=0;#10;
      t=1;#10;
      t=0;#10;
      t=1;#10;
      $finish;
    end
endmodule

//output
# KERNEL: time=0 t=0 q=0
# KERNEL: time=10 t=1 q=0
# KERNEL: time=15 t=1 q=1
# KERNEL: time=20 t=0 q=1
# KERNEL: time=30 t=1 q=1
# KERNEL: time=35 t=1 q=0
