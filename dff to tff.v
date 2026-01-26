// Code your design here
module dff(d,clk,q);
  input d,clk;
  output reg q=0;
  always@(posedge clk) begin
      q<=d;
  end
endmodule
module dff_to_tff(t,clk,q);
  input t,clk;
  output q;
  wire d;
  assign d=t^q;
  dff ff(.clk(clk),.d(d),.q(q));
endmodule  
//tb
// Code your testbench here
// or browse Examples
module tb;
  reg t,clk;
  wire q;
  dff_to_tff ff(t,clk,q);
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
      t=0;#10;
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
# KERNEL: time=40 t=0 q=0
