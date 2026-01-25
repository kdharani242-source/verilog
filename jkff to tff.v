// Code your design here
module jkff(j, k, clk, q);
  input j, k, clk;
  output reg q=0;

  always @(posedge clk) begin
    case ({j, k})
      2'b00: q=q;       // hold
      2'b01: q=1'b0;    // reset
      2'b10: q=1'b1;    // set
      2'b11: q=~q;      // toggle
    endcase
  end
endmodule
module jkff_to_tff(t,clk,q);
  input t,clk;
  output q;
  wire j,k;
  assign j=t;
  assign k=t;
  jkff ff(.clk(clk),.j(j),.k(k),.q(q));
endmodule
//tb
// Code your testbench here
// or browse Examples
module tb;
  reg t,clk;
  wire q;
  jkff_to_tff ff(t,clk,q);
  initial
    begin
      clk=0;
      forever #5 clk=~clk;
    end
  initial
    begin
      $monitor("time=%0t t=%b q=%b",$time,t,q);
      t=0;#10;
      t=0;#10;
      t=1;#10;
      t=1;#10;
      t=0;#10;
      $finish;
    end
endmodule

//output
# KERNEL: time=0 t=0 q=0
# KERNEL: time=20 t=1 q=0
# KERNEL: time=25 t=1 q=1
# KERNEL: time=35 t=1 q=0
# KERNEL: time=40 t=0 q=0
