// Code your design here
module universal_shift_reg (
    input clk,
    input rst,
    input [1:0] sel,        // 00: Hold, 01: Shift Right, 10: Shift Left, 11: Parallel Load
    input serial_in,
    input [3:0] parallel_in,
    output reg [3:0] q
);

always @(posedge clk) begin
    if (rst)
        q <= 4'b0000;
    else begin
        case (sel)
            2'b00: q <= q;                                // Hold
            2'b01: q <= {serial_in, q[3:1]};              // Shift Right
            2'b10: q <= {q[2:0], serial_in};              // Shift Left
            2'b11: q <= parallel_in;                      // Parallel Load
        endcase
    end
end

endmodule
// Code your testbench here
// or browse Examples
module tb;
  reg clk,rst,serial_in;
  reg [1:0] sel;
  reg [3:0] parallel_in;
  wire [3:0] q;
  universal_shift_reg  dut(clk,rst,sel,serial_in,parallel_in,q);
  initial
    begin
      clk=0;
      forever #5 clk=~clk;
    end
  initial
    begin
      $monitor("time=%0t rst=%b sel=%b serial_in=%b parallel_in=%b q=%b",$time,rst,sel,serial_in,parallel_in,q);
      rst=1;sel=2'b01;serial_in=1;parallel_in=4'b1100;#10;
      rst=0;sel=2'b00;serial_in=1;parallel_in=4'b1100;#10;
      rst=0;sel=2'b01;serial_in=1;parallel_in=4'b1100;#10;
      rst=0;sel=2'b10;serial_in=1;parallel_in=4'b1100;#10;
      rst=0;sel=2'b11;serial_in=1;parallel_in=4'b1100;#10;
      $finish;
    end
endmodule


//output
# KERNEL: time=0 rst=1 sel=01 serial_in=1 parallel_in=1100 q=xxxx
# KERNEL: time=5 rst=1 sel=01 serial_in=1 parallel_in=1100 q=0000
# KERNEL: time=10 rst=0 sel=00 serial_in=1 parallel_in=1100 q=0000
# KERNEL: time=20 rst=0 sel=01 serial_in=1 parallel_in=1100 q=0000
# KERNEL: time=25 rst=0 sel=01 serial_in=1 parallel_in=1100 q=1000
# KERNEL: time=30 rst=0 sel=10 serial_in=1 parallel_in=1100 q=1000
# KERNEL: time=35 rst=0 sel=10 serial_in=1 parallel_in=1100 q=0001
# KERNEL: time=40 rst=0 sel=11 serial_in=1 parallel_in=1100 q=0001
# KERNEL: time=45 rst=0 sel=11 serial_in=1 parallel_in=1100 q=1100
      
