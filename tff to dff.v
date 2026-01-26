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
module tff_to_dff(d,clk,q);
  input d,clk;
  output q;
  wire t;
  assign t=d^q;
      tff ff(.clk(clk),.t(t),.q(q));
endmodule  
// Code your testbench here
// or browse Examples
module tb;
  reg d,clk;
  wire q;
  tff_to_dff ff(d,clk,q);
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
      d=1;#10;
      $finish;
    end
endmodule
//output
# KERNEL: t=0 d=0 q=0
# KERNEL: t=10 d=1 q=0
# KERNEL: t=15 d=1 q=1
# KERNEL: t=20 d=0 q=1
# KERNEL: t=25 d=0 q=0
# KERNEL: t=30 d=1 q=0
# KERNEL: t=35 d=1 q=1
