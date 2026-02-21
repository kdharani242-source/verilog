// Code your design here
module mux2x1(s,i0,i1,y);
  input s,i0,i1;
  output y;
  assign y=s?i1:i0;
endmodule
module not_gate(a,y);
  input a;
  output y;
  wire i0,i1;
  assign i0=1;
  assign i1=0;
  mux2x1 m(.s(a),.i0(i0),.i1(i1),.y(y));
endmodule

//output
// Code your testbench here
// or browse Examples
module tb;
  reg a;
  wire y;
  not_gate o(a,y);
  initial
    begin
      $monitor("a=%0b y=%0b",a,y);
      for(int i=0;i<2;i++) begin
        a=i;#10;
      end
    end
endmodule
//output
# KERNEL: a=0 y=1
# KERNEL: a=1 y=0
