SIPO
module sipo_reg (
    input clk,
    input rst,
    input serial_in,
    output reg [3:0] parallel_out
);

  always @(posedge clk) begin
    if (rst)
      parallel_out <= 4'b0000;
    else
      parallel_out <= {parallel_out[2:0], serial_in};
  end

endmodule
// Code your testbench here
// or browse Examples
module tb;
  reg clk,rst,serial_in;
  wire [3:0] parallel_out;
  sipo_reg dut(clk,rst,serial_in,parallel_out);
  initial
    begin
      clk=0;
      forever #5 clk=~clk;
    end
  initial
    begin
      $monitor("time=%0t rst=%b serial_in=%b  serial_out=%b",$time,rst,serial_in,parallel_out);
      rst=1;serial_in=0;#10;
      rst=0;serial_in=0;#10;
      rst=0;serial_in=1;#10;
      rst=0;serial_in=0;#10;
      rst=0;serial_in=1;#10;
      rst=0;serial_in=1;#10;
      rst=0;serial_in=1;#10;
      $finish;
    end
endmodule
//output
# KERNEL: time=0 rst=1 serial_in=0  serial_out=xxxx
# KERNEL: time=5 rst=1 serial_in=0  serial_out=0000
# KERNEL: time=10 rst=0 serial_in=0  serial_out=0000
# KERNEL: time=20 rst=0 serial_in=1  serial_out=0000
# KERNEL: time=25 rst=0 serial_in=1  serial_out=0001
# KERNEL: time=30 rst=0 serial_in=0  serial_out=0001
# KERNEL: time=35 rst=0 serial_in=0  serial_out=0010
# KERNEL: time=40 rst=0 serial_in=1  serial_out=0010
# KERNEL: time=45 rst=0 serial_in=1  serial_out=0101
# KERNEL: time=55 rst=0 serial_in=1  serial_out=1011
# KERNEL: time=65 rst=0 serial_in=1  serial_out=0111
