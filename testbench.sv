`timescale 1ns / 1ps

module traffic_light_tb;

    reg clk;
    reg reset;
    wire [2:0] ns_light;
    wire [2:0] ew_light;

    traffic_light_controller uut (
        .clk(clk),
        .reset(reset),
        .ns_light(ns_light),
        .ew_light(ew_light)
    );

    always #5 clk = ~clk;

    initial begin
        $dumpfile("traffic_light.vcd");
        $dumpvars(0, traffic_light_tb);

        $monitor("Time=%0t | Reset=%b | State=%b | NS_Light=%b | EW_Light=%b", 
                 $time, reset, uut.current_state, ns_light, ew_light);

        clk = 0;
        reset = 1;

        #20 reset = 0;

        #350 $finish;
    end

endmodule
