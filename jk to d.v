// Code your design here
module jkff(j, k, clk, q);
  input j, k, clk;
  output reg q;

  always @(posedge clk) begin
    case ({j, k})
      2'b00: q=q;       // hold
      2'b01: q=1'b0;    // reset
      2'b10: q=1'b1;    // set
      2'b11: q=~q;      // toggle
    endcase
  end
endmodule
module jkff_to_dff(d,clk,q);
  input d,clk;
  output q;
  wire j,k;
  assign j=d;
  assign k=~d;
  jkff ff(.clk(clk),.j(j),.k(k),.q(q));
endmodule


//tb
// Code your testbench here
// or browse Examples
module tb;
  reg d,clk;
  wire q;
  jkff_to_dff ff(d,clk,q);
  initial
    begin
      clk=0;
      forever #5 clk=~clk;
    end
  initial
    begin
      $monitor("time=%0t d=%b q=%b",$time,d,q);
      d=0;#10;
      d=0;#10;
      d=1;#10;
      d=1;#10;
      d=0;#10;
      $finish;
    end
endmodule

//output
# KERNEL: time=0 d=0 q=x
# KERNEL: time=5 d=0 q=0
# KERNEL: time=20 d=1 q=0
# KERNEL: time=25 d=1 q=1
# KERNEL: time=40 d=0 q=1
# KERNEL: time=45 d=0 q=0
