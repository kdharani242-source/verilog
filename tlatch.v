module tlatch(en, t, q);
  input  en, t;
  output reg q;

  initial q = 1'b0;   // ✅ initialization

  always @(*) begin
    if (en) begin
      if (t)
        q = ~q;   // toggle
      // else hold
    end
    // else hold
  end
endmodule
// Code your testbench here
// or browse Examples
module tb;
  reg en,t;
  wire q;
  tlatch u1(en,t,q);
  initial
    begin
     
      $monitor("en=%b t=%b q=%b",en,t,q);
      for(int i=0;i<4;i++) begin
        {en,t}=i;#1;
      end
      en=0;t=0;#1;
      en=1;t=1;
    end
endmodule

//output
# KERNEL: en=0 t=0 q=0
# KERNEL: en=0 t=1 q=0
# KERNEL: en=1 t=0 q=0
# KERNEL: en=1 t=1 q=1
# KERNEL: en=0 t=0 q=1
# KERNEL: en=1 t=1 q=0
