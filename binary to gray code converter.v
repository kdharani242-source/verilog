// Code your design here
module bi_gray_code_converter(b,g);
  input [3:0] a;
  output [3:0] g;
  assign g=b^(b>>1);
endmodule

//design code
module bi_gray_code_converter (
    input  [3:0] b,
    output reg [3:0] g
);
   //integer j;
    always @(*) begin
        g[3] = b[3];              // MSB copied directly
      for (int j = 0; j <3; j++) begin
            g[j] = b[j+1] ^ b[j]; // XOR operation
        end
    end
endmodule


// Code your testbench here
// or browse Examples
module tb;
  reg [3:0] b;
  wire [3:0] g;
  bi_gray_code_converter u1(b,g);
  initial
    begin
      $monitor("b=%b g=%b",b,g);
      for(int i=0;i<16; i++) begin
        b=i;#1;
      end
    end
endmodule
//output
# KERNEL: b=0000 g=0000
# KERNEL: b=0001 g=0001
# KERNEL: b=0010 g=0011
# KERNEL: b=0011 g=0010
# KERNEL: b=0100 g=0110
# KERNEL: b=0101 g=0111
# KERNEL: b=0110 g=0101
# KERNEL: b=0111 g=0100
# KERNEL: b=1000 g=1100
# KERNEL: b=1001 g=1101
# KERNEL: b=1010 g=1111
# KERNEL: b=1011 g=1110
# KERNEL: b=1100 g=1010
# KERNEL: b=1101 g=1011
# KERNEL: b=1110 g=1001
# KERNEL: b=1111 g=1000
