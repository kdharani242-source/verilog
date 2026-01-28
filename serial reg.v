SERIAL REGISTER 
module serial_reg(clk,rst,serial_in,shift_reg,serial_out);
  input clk,rst,serial_in;
  output reg serial_out;
  output reg [3:0] shift_reg;
  always@(posedge clk) begin
    if(rst)
      shift_reg<='b0;
    else
      shift_reg<={shift_reg[2:0],serial_in};
  end
  always@(*) begin
    serial_out=shift_reg[3];
  end
endmodule
// Code your testbench here
// or browse Examples
module tb;
  reg clk,rst,serial_in;
  wire serial_out;
  wire [3:0] shift_reg;
  serial_reg dut(clk,rst,serial_in,shift_reg,serial_out);
  initial
    begin
      clk=0;
      forever #5 clk=~clk;
    end
  initial
    begin
      $monitor("time=%0t rst=%b serial_in=%b shift_reg=%b serial_out=%b",$time,rst,serial_in,shift_reg,serial_out);
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
# KERNEL: time=0 rst=1 serial_in=0 shift_reg=xxxx serial_out=x
# KERNEL: time=5 rst=1 serial_in=0 shift_reg=0000 serial_out=0
# KERNEL: time=10 rst=0 serial_in=0 shift_reg=0000 serial_out=0
# KERNEL: time=20 rst=0 serial_in=1 shift_reg=0000 serial_out=0
# KERNEL: time=25 rst=0 serial_in=1 shift_reg=0001 serial_out=0
# KERNEL: time=30 rst=0 serial_in=0 shift_reg=0001 serial_out=0
# KERNEL: time=35 rst=0 serial_in=0 shift_reg=0010 serial_out=0
# KERNEL: time=40 rst=0 serial_in=1 shift_reg=0010 serial_out=0
# KERNEL: time=45 rst=0 serial_in=1 shift_reg=0101 serial_out=0
# KERNEL: time=55 rst=0 serial_in=1 shift_reg=1011 serial_out=1
# KERNEL: time=65 rst=0 serial_in=1 shift_reg=0111 serial_out=0
2) module serial_reg(clk,rst,serial_in,shift_reg,serial_out);
  input clk,rst,serial_in;
  output reg serial_out;
  output reg [3:0] shift_reg;
  always@(posedge clk) begin
    if(rst)
      shift_reg<='b0;
    else
      shift_reg<={serial_in,shift_reg[3:1]};
  end
  always@(*) begin
    serial_out=shift_reg[0];
  end
endmodule
// Code your testbench here
// or browse Examples
module tb;
  reg clk,rst,serial_in;
  wire serial_out;
  wire [3:0] shift_reg;
  serial_reg dut(clk,rst,serial_in,shift_reg,serial_out);
  initial
    begin
      clk=0;
      forever #5 clk=~clk;
    end
  initial
    begin
      $monitor("time=%0t rst=%b serial_in=%b shift_reg=%b serial_out=%b",$time,rst,serial_in,shift_reg,serial_out);
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
# KERNEL: time=0 rst=1 serial_in=0 shift_reg=xxxx serial_out=x
# KERNEL: time=5 rst=1 serial_in=0 shift_reg=0000 serial_out=0
# KERNEL: time=10 rst=0 serial_in=0 shift_reg=0000 serial_out=0
# KERNEL: time=20 rst=0 serial_in=1 shift_reg=0000 serial_out=0
# KERNEL: time=25 rst=0 serial_in=1 shift_reg=1000 serial_out=0
# KERNEL: time=30 rst=0 serial_in=0 shift_reg=1000 serial_out=0
# KERNEL: time=35 rst=0 serial_in=0 shift_reg=0100 serial_out=0
# KERNEL: time=40 rst=0 serial_in=1 shift_reg=0100 serial_out=0
# KERNEL: time=45 rst=0 serial_in=1 shift_reg=1010 serial_out=0
# KERNEL: time=55 rst=0 serial_in=1 shift_reg=1101 serial_out=1
# KERNEL: time=65 rst=0 serial_in=1 shift_reg=1110 serial_out=0
# RUNTIME: Info: RUNTIME_0068 testbench.sv (23): $finish called.
