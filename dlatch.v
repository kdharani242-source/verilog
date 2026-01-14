// Code your design here
module dlatch(en,d,q);
  input en,d;
  output q;
  assign q=en?d:q;
endmodule

// Code your testbench here
// or browse Examples
module tb;
  reg en,d;
  wire q;
  dlatch u1(en,d,q);
  initial
    begin
      $monitor("en=%b d=%b q=%b",en,d,q);
      for(int i=0;i<4;i++) begin
        {en,d}=i;#1;
      end
      en=0;d=0;#1;
      en=1;d=1;
    end
endmodule
//output
# KERNEL: en=0 d=0 q=x
# KERNEL: en=0 d=1 q=x
# KERNEL: en=1 d=0 q=0
# KERNEL: en=1 d=1 q=1
# KERNEL: en=0 d=0 q=1
# KERNEL: en=1 d=1 q=1
