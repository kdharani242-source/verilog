// Code your design here
// Half Adder
module half_adder(
    input a, b,
    output sum, carry
);
    assign sum   = a ^ b;
    assign carry = a & b;
endmodule

// Full Adder using two Half Adders
module full_adder(
    input a, b, c,
    output sum, carry
);
    wire s1, c1, c2;

    half_adder HA1 (.a(a),  .b(b),   .sum(s1), .carry(c1));
    half_adder HA2 (.a(s1), .b(c), .sum(sum), .carry(c2));

    assign carry = c1 | c2;
endmodule


//tb
module tb;
  reg a,b,c;
  wire sum,carry;
  full_adder u1(.a(a),.b(b),.c(c),.sum(sum),.carry(carry));
  initial
    begin
      $monitor("a=%0b b=%0b c=%0b sum=%0b carry%0b",a,b,c,sum,carry);
      for(int i=0;i<8;i++) begin
        {a,b,c}=i;#1;
      end
    end
endmodule
