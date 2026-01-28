PISO
module piso_reg (
    input clk,
    input rst,
    input load,
    input [3:0] parallel_in,
    output serial_out
);
  reg [3:0] shift_reg;
  always @(posedge clk) begin
    if (rst)
      shift_reg <= 4'b0000;
    else if (load)
      shift_reg <= parallel_in;          // Parallel load
    else
      shift_reg <= {shift_reg[2:0], 1'b0}; // Shift right
  end
  assign serial_out = shift_reg[3]; // MSB first
endmodule
// Code your testbench here
// or browse Examples
module tb;
  reg clk,rst,load;
  reg [3:0] parallel_in;
  wire [3:0] shift_reg;
  piso_reg dut(clk,rst,load,parallel_in,serial_out);
  initial
    begin
      clk=0;
      forever #5 clk=~clk;
    end
  initial
    begin
      $monitor("time=%0t rst=%b load=%b parallel_in=%b  serial_out=%b",$time,rst,load,parallel_in,serial_out);
      rst=1;load=0;parallel_in='b0000;#10;
      rst=0;load=0;parallel_in='b0100;#10;
      rst=0;load=0;parallel_in='b1001;#10;
      rst=0;load=0;parallel_in='b1110;#10;
      rst=0;load=0;parallel_in='b0011;#10;
      rst=0;load=0;parallel_in='b1101;#10;
      rst=0;load=1;parallel_in='b1011;#10;
      $finish;
    end
endmodule
//OUTPUT
# KERNEL: time=0 rst=1 load=0 parallel_in=0000  serial_out=x
# KERNEL: time=5 rst=1 load=0 parallel_in=0000  serial_out=0
# KERNEL: time=10 rst=0 load=0 parallel_in=0100  serial_out=0
# KERNEL: time=20 rst=0 load=0 parallel_in=1001  serial_out=0
# KERNEL: time=30 rst=0 load=0 parallel_in=1110  serial_out=0
# KERNEL: time=40 rst=0 load=0 parallel_in=0011  serial_out=0
# KERNEL: time=50 rst=0 load=0 parallel_in=1101  serial_out=0
# KERNEL: time=60 rst=0 load=1 parallel_in=1011  serial_out=0
# KERNEL: time=65 rst=0 load=1 parallel_in=1011  serial_out=1
