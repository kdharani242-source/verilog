// Code your design here
module bcd_ex3_converteer(bcd,ex3);
  input [3:0] bcd;
  output [3:0] ex3;
  assign ex3=bcd+'b11;
endmodule
// Code your testbench here
// or browse Examples
module tb;
  reg [3:0] bcd;
  wire [3:0] ex3;
  bcd_ex3_converteer u1(bcd,ex3);
  initial
    begin
      $monitor("bcd=%b ex3=%b",bcd,ex3);
      for(int i=0;i<10;i++) begin
        bcd=i;#1;
      end
    end
endmodule
//output
# KERNEL: bcd=0000 ex3=0011
# KERNEL: bcd=0001 ex3=0100
# KERNEL: bcd=0010 ex3=0101
# KERNEL: bcd=0011 ex3=0110
# KERNEL: bcd=0100 ex3=0111
# KERNEL: bcd=0101 ex3=1000
# KERNEL: bcd=0110 ex3=1001
# KERNEL: bcd=0111 ex3=1010
# KERNEL: bcd=1000 ex3=1011
# KERNEL: bcd=1001 ex3=1100
