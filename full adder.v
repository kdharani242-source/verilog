module fulladder(a,b,c,sum,carry);
  input a,b,c;
  output sum,carry;
  assign sum=a^b^c;
  assign carry=(a&b)|((a^b)&c);
endmodule

//tb
module tb;
  reg a,b,c;
  wire sum,carry;
  fulladder u1(.a(a),.b(b),.c(c),.sum(sum),.carry(carry));
  initial
    begin
      $monitor("a=%0b b=%0b c=%0b sum=%0b carry%0b",a,b,c,sum,carry);
      for(int i=0;i<8;i++) begin
        {a,b,c}=i;#1;
      end
    end
endmodule
