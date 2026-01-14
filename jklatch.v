module jklatch(j,k,q);
  input j,k;
  output reg q;
  always@(*) begin
    case({j,k})
      2'b00:q=q;
      2'b01:q='b0;
      2'b10:q='b1;
      2'b11:q=~q;
    endcase
  end
endmodule
// Code your testbench here
// or browse Examples
module tb;
  reg j,k;
  wire q;
  jklatch u1(j,k,q);
  initial
    begin
      $monitor("j=%b k=%b q=%b",j,k,q);
      for(int i=0;i<4;i++) begin
        {j,k}=i;#1;
      end
      j=0;k=0;#1;
      j=1;k=0;
    end
endmodule

//output
# KERNEL: j=0 k=0 q=x
# KERNEL: j=0 k=1 q=0
# KERNEL: j=1 k=0 q=1
# KERNEL: j=1 k=1 q=0
# KERNEL: j=0 k=0 q=0
# KERNEL: j=1 k=0 q=1
