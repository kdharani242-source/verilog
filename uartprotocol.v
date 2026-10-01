// Code your design here
module uart_tx(
  input clk,
  input rst,
  input [7:0]data_in,
  input  tx_start,
  output reg tx,
  output reg tx_done
);
  reg [3:0]state;
  reg [2:0] bit_cnt;
  parameter IDLE=0,
            start=1,
            data=2,
            stop=3;
  always@(posedge clk or posedge rst)
    if(rst) begin
      state<=IDLE;
      tx_done<=0;
      bit_cnt<=0;
      tx<=1'b1;
    end
  else
    begin
      case(state)
        IDLE:
          begin
            tx<=1'b1;
            tx_done<=1'b0;
            if(tx_start)
              state<=start;
          end
        start:
          begin
            tx<=1'b0;
            state<=data;
            bit_cnt<=1'b0;
          end
        data:
          begin
            tx<=data_in[bit_cnt];
            if(bit_cnt==7)
              state<=stop;
            else
              bit_cnt<=bit_cnt+1;
          end
        stop:
          begin
            tx<=1;
            state<=IDLE;
            tx_done<=1'b1;
          end
      endcase
    end
endmodule

module uart_rx(
  input clk,
  input rst,
  input rx,
  output reg [7:0] rx_out,
  output reg rx_done
);
  reg [3:0]state;
reg [7:0] bit_cnt;
parameter IDLE=0,
          start=1,
          data=2,
          stop=3;
  always@(posedge clk or posedge rst)
  begin
    if(rst)
      begin
        state<=IDLE;
        bit_cnt<=0;
        rx_done<=0;
      end
    else
      begin
        case(state)
          IDLE:
            begin
              rx_done<=0;
              if(rx==0)
                state<=start;
            end
          start:
            begin
              state<=data;
              bit_cnt<=0;
            end
          data:
            begin
              rx_out[bit_cnt]<=rx;
              if(bit_cnt==7)
                state<=stop;
              else
                bit_cnt<=bit_cnt+1;
            end
          stop:
            begin
              if(rx==1)
                rx_done<=1;
              else
                state<=IDLE;
            end
        endcase
      end
  end
endmodule
          
        
  
  // Code your testbench here
// or browse Examples
module tb;

reg clk;
reg rst;
reg tx_start;
reg [7:0] data_in;

wire tx;
  wire [7:0] rx_out;
wire rx_done;
wire tx_done;

uart_tx DUT_TX(
    .clk(clk),
    .rst(rst),
    .tx_start(tx_start),
    .data_in(data_in),
    .tx(tx),
    .tx_done(tx_done)
);

uart_rx DUT_RX(
    .clk(clk),
    .rst(rst),
    .rx(tx),
  .rx_out(rx_out),
    .rx_done(rx_done)
);

always #5 clk = ~clk;

initial
begin
    clk = 0;
    rst = 1;
    tx_start = 0;
    data_in = 8'b10101010;

    #10 rst = 0;

    #10 tx_start = 1;
    #10 tx_start = 0;

    #200 $finish;
end

initial
begin
    $monitor("Time=%0t DATA_IN=%b TX=%b RX_OUT=%b RX_DONE=%b",
          $time, data_in, tx, rx_out, rx_done);
end

endmodule


//output
# KERNEL: Time=0 DATA_IN=10101010 TX=1 RX_OUT=xxxxxxxx RX_DONE=0
# KERNEL: Time=35 DATA_IN=10101010 TX=0 RX_OUT=xxxxxxxx RX_DONE=0
# KERNEL: Time=55 DATA_IN=10101010 TX=1 RX_OUT=xxxxxxxx RX_DONE=0
# KERNEL: Time=65 DATA_IN=10101010 TX=0 RX_OUT=xxxxxxx1 RX_DONE=0
# KERNEL: Time=75 DATA_IN=10101010 TX=1 RX_OUT=xxxxxx01 RX_DONE=0
# KERNEL: Time=85 DATA_IN=10101010 TX=0 RX_OUT=xxxxx101 RX_DONE=0
# KERNEL: Time=95 DATA_IN=10101010 TX=1 RX_OUT=xxxx0101 RX_DONE=0
# KERNEL: Time=105 DATA_IN=10101010 TX=0 RX_OUT=xxx10101 RX_DONE=0
# KERNEL: Time=115 DATA_IN=10101010 TX=1 RX_OUT=xx010101 RX_DONE=0
# KERNEL: Time=125 DATA_IN=10101010 TX=1 RX_OUT=x1010101 RX_DONE=0
# KERNEL: Time=135 DATA_IN=10101010 TX=1 RX_OUT=11010101 RX_DONE=0
# KERNEL: Time=145 DATA_IN=10101010 TX=1 RX_OUT=11010101 RX_DONE=1
# RUNTIME: Info: RUNTIME_0068 testbench.sv (46): $finish called.
