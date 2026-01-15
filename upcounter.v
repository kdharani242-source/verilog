// Code your design here
module upcounter(clk,rst,count);
  input clk,rst;
  output reg [3:0]count=0;
  always@(posedge clk ) begin
    if(rst)
      count<=0;
     else
       count<=count+1;
  end
endmodule

// Code your testbench here
// or browse Examples
module tb;
  reg clk,rst;
  wire [3:0] count;
  upcounter u1(clk,rst,count);
  initial
    begin
      clk=0;
      forever #5 clk=~clk;
    end
  initial begin
    $monitor("time=%0t rst=%b count=%d",$time,rst,count);
    rst=0;#10;
    rst=1;#10;
    rst=0;#10;
    rst=0;#10;
    rst=0;#10;
    $finish;
  end
endmodule
//output
# KERNEL: time=0 rst=0 count= 0
# KERNEL: time=5 rst=0 count= 1
# KERNEL: time=10 rst=1 count= 1
# KERNEL: time=15 rst=1 count= 0
# KERNEL: time=20 rst=0 count= 0
# KERNEL: time=25 rst=0 count= 1
# KERNEL: time=35 rst=0 count= 2
# KERNEL: time=45 rst=0 count= 3
