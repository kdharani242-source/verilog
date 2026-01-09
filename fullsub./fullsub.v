module fullsub(a,b,c,diff,borrow);
  input a,b,c;
  output diff, borrow;
  assign diff=a^b^c;
  assign borrow=((~a)&b)|((~(a^b))&c);
endmodule
// Code your testbench here
// or browse Examples
module tb;
  reg a,b,c;
  wire diff,borrow;
  fullsub u1(a,b,c,diff,borrow);
  initial
    begin
      $monitor("a=%0b b=%0b c=%0b diff=%0b borrow=%0b",a,b,c,diff,borrow);
      for(int i=0; i<8;i++) begin
        {a,b,c}=i;#1;
      end
    end
endmodule

//output
# KERNEL: a=0 b=0 c=0 diff=0 borrow=0
# KERNEL: a=0 b=0 c=1 diff=1 borrow=1
# KERNEL: a=0 b=1 c=0 diff=1 borrow=1
# KERNEL: a=0 b=1 c=1 diff=0 borrow=1
# KERNEL: a=1 b=0 c=0 diff=1 borrow=0
# KERNEL: a=1 b=0 c=1 diff=0 borrow=0
# KERNEL: a=1 b=1 c=0 diff=0 borrow=0
# KERNEL: a=1 b=1 c=1 diff=1 borrow=1
