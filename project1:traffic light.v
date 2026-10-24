// Code your design here

module traffic_light(
    input clk,
    input rst,

    output reg [2:0] road_a,
    output reg [2:0] road_b
);
    parameter GREEN_TIME  = 5;
    parameter YELLOW_TIME = 2;

    // Light encoding: {Red, Yellow, Green}
    localparam RED    = 3'b100;
    localparam YELLOW = 3'b010;
    localparam GREEN  = 3'b001;

    // FSM states
    localparam S0 = 2'b00; // A green, B red
    localparam S1 = 2'b01; // A yellow, B red
    localparam S2 = 2'b10; // A red, B green
    localparam S3 = 2'b11; // A red, B yellow

    reg [1:0] state;
    reg [31:0] count;

    // Sequential logic: state and timer
    always @(posedge clk) begin
        if (rst) begin
            state <= S0;
            count <= 0;
        end
        else begin
            case (state)
                S0: begin
                    if (count >= GREEN_TIME - 1) begin
                        state <= S1;
                        count <= 0;
                    end
                    else
                        count <= count + 1;
                end

                S1: begin
                    if (count >= YELLOW_TIME - 1) begin
                        state <= S2;
                        count <= 0;
                    end
                    else
                        count <= count + 1;
                end

                S2: begin
                    if (count >= GREEN_TIME - 1) begin
                        state <= S3;
                        count <= 0;
                    end
                    else
                        count <= count + 1;
                end

                S3: begin
                    if (count >= YELLOW_TIME - 1) begin
                        state <= S0;
                        count <= 0;
                    end
                    else
                        count <= count + 1;
                end

                default: begin
                    state <= S0;
                    count <= 0;
                end
            endcase
        end
    end

    // Combinational logic: traffic light outputs
    always @(*) begin
        road_a = RED;
        road_b = RED;

        case (state)
            S0: begin
                road_a = GREEN;
                road_b = RED;
            end

            S1: begin
                road_a = YELLOW;
                road_b = RED;
            end

            S2: begin
                road_a = RED;
                road_b = GREEN;
            end

            S3: begin
                road_a = RED;
                road_b = YELLOW;
            end

            default: begin
                road_a = RED;
                road_b = RED;
            end
        endcase
    end

endmodule

// Code your testbench here
// or browse Examples
module tb;
  reg clk,rst;
  wire [2:0] road_a;
  wire [2:0] road_b;
  traffic_light tl(clk,rst,road_a,road_b);
  initial
    begin
      clk=0;
      forever #5 clk=~clk;
    end
  initial
    begin
      rst=1;#10;
      $display("time=%0t rst=%0b clk=%0b road_a=%b road_b=%b",$time,rst,clk,road_a,road_b);
      repeat(15) begin
        rst=0;#10;
         $display("time=%0t rst=%0b clk=%0b road-a=%b road_b=%b",$time,rst,clk,road_a,road_b);
      end
      $finish;
    end
endmodule

# KERNEL: time=10 rst=1 clk=1 road_a=001 road_b=100
# KERNEL: time=20 rst=0 clk=1 road-a=001 road_b=100
# KERNEL: time=30 rst=0 clk=1 road-a=001 road_b=100
# KERNEL: time=40 rst=0 clk=1 road-a=001 road_b=100
# KERNEL: time=50 rst=0 clk=1 road-a=001 road_b=100
# KERNEL: time=60 rst=0 clk=1 road-a=010 road_b=100
# KERNEL: time=70 rst=0 clk=1 road-a=010 road_b=100
# KERNEL: time=80 rst=0 clk=1 road-a=100 road_b=001
# KERNEL: time=90 rst=0 clk=1 road-a=100 road_b=001
# KERNEL: time=100 rst=0 clk=1 road-a=100 road_b=001
# KERNEL: time=110 rst=0 clk=1 road-a=100 road_b=001
# KERNEL: time=120 rst=0 clk=1 road-a=100 road_b=001
# KERNEL: time=130 rst=0 clk=1 road-a=100 road_b=010
# KERNEL: time=140 rst=0 clk=1 road-a=100 road_b=010
# KERNEL: time=150 rst=0 clk=1 road-a=001 road_b=100
# KERNEL: time=160 rst=0 clk=1 road-a=001 road_b=100
