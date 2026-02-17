
// Code your design here
module triangle (
    input  [7:0] a,       // side a
    input  [7:0] b,       // side b
    input  [7:0] c,       // side c
    input  [7:0] base,    // base
    input  [7:0] height,  // height
    output [15:0] area,
    output [9:0] perimeter
);

    assign perimeter = a + b + c;
  assign area = (base * height)/2;  // divide by 2

endmodule
// Code your testbench here
// or browse Examples
module tb;

    reg  [7:0] a, b, c;
    reg  [7:0] base, height;
    wire [15:0] area;
    wire [9:0]  perimeter;

    triangle t1 (a, b, c, base, height, area, perimeter);

    initial begin
        $monitor("a=%0d b=%0d c=%0d base=%0d height=%0d | Area=%0d Perimeter=%0d",
                  a, b, c, base, height, area, perimeter);

        a = 3; b = 4; c = 5;
        base = 4; height = 6;
        #10;

        a = 5; b = 5; c = 5;
        base = 5; height = 4;
        #10;

        $finish;
    end
endmodule



//output
# KERNEL: a=3 b=4 c=5 base=4 height=6 | Area=12 Perimeter=12
# KERNEL: a=5 b=5 c=5 base=5 height=4 | Area=10 Perimeter=15
