module seven_segment_decoder (
    input  [3:0] bcd,
    output reg [6:0] seg
);

always @(*) begin
    case (bcd)
        4'b0000: seg = 7'b1111110; // 0
        4'b0001: seg = 7'b0110000; // 1
        4'b0010: seg = 7'b1101101; // 2
        4'b0011: seg = 7'b1111001; // 3
        4'b0100: seg = 7'b0110011; // 4
        4'b0101: seg = 7'b1011011; // 5
        4'b0110: seg = 7'b1011111; // 6
        4'b0111: seg = 7'b1110000; // 7
        4'b1000: seg = 7'b1111111; // 8
        4'b1001: seg = 7'b1111011; // 9
        default: seg = 7'b0000000; // OFF
    endcase
end

endmodule
// Code your testbench here
// or browse Examples
module tb;
  reg [3:0] bcd;
  wire [6:0] seg;
  seven_segment_decoder u1(bcd,seg);
  initial
    begin
      $monitor("bcd=%b seg=%b",bcd,seg);
      for(int i=0;i<10;i++) begin
        bcd=i;#1;
      end
    end
endmodule

//output
# KERNEL: bcd=0000 seg=1111110
# KERNEL: bcd=0001 seg=0110000
# KERNEL: bcd=0010 seg=1101101
# KERNEL: bcd=0011 seg=1111001
# KERNEL: bcd=0100 seg=0110011
# KERNEL: bcd=0101 seg=1011011
# KERNEL: bcd=0110 seg=1011111
# KERNEL: bcd=0111 seg=1110000
# KERNEL: bcd=1000 seg=1111111
# KERNEL: bcd=1001 seg=1111011
