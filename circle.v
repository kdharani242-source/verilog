// Code your design here
// Code your design here
module circle(r,area,perimeter);
  input real  r;
  output real area,perimeter;
  assign area=3.1416*r*r;
  assign perimeter=2*3.1416*r;
endmodule

// Code your testbench here
// or browse Examples
module tb;
  real  r;
  real  area,perimeter;
  circle c1(r,area,perimeter);
  initial
    begin
      $monitor("r=%0d area=%0.2f perimeter=%0f",r,area,perimeter);
      r='d5;#10;
      r='d2;#10; 
      r='b100;#10;
    end
endmodule

//OUTPUT
# KERNEL: r=5 area=78.54 perimeter=31.416000
# KERNEL: r=2 area=12.57 perimeter=12.566400
# KERNEL: r=4 area=50.27 perimeter=25.132800
