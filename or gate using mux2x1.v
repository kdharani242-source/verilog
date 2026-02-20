// Code your design here
// Code your design here
module mux2x1(s,i0,i1,y);
  input s,i0,i1;
  output y;
  assign y=s?i1:i0;
endmodule
module or_gate(a,b,y);
  input a,b;
  output y;
  wire i0,i1;
  assign i0=b;
  assign i1=1'b1;
  mux2x1 m(.s(a),.i0(i0),.i1(i1),.y(y));
endmodule

// Code your testbench here
// or browse Examples
module tb;
  reg a,b;
  wire y;
  or_gate o(a,b,y);
  initial
    begin
      $monitor("a=%0b b=%0b y=%0b",a,b,y);
      for(int i=0;i<4;i++) begin
        {a,b}=i;#10;
      end
    end
endmodule

//output
# KERNEL: a=0 b=0 y=0
# KERNEL: a=0 b=1 y=1
# KERNEL: a=1 b=0 y=1
# KERNEL: a=1 b=1 y=1
