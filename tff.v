// Code your design here
module dff(t,clk,q);
  input t,clk;
  output reg q=0;
  always@(posedge clk) begin
    if(clk) begin
      if(t) begin
        q<=~q;
      end
    end
  end
endmodule
// Code your testbench here
// or browse Examples
module tb;
  reg t,clk;
  wire q;
  dff u1(t,clk,q);
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
      $finish;
    end
endmodule
//output
# KERNEL: time=0 t=0 q=0
# KERNEL: time=10 t=1 q=0
# KERNEL: time=15 t=1 q=1
# KERNEL: time=20 t=0 q=1
