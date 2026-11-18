module traffic_light_controller (
    input wire clk,
    input wire reset,
    output reg [2:0] ns_light,
    output reg [2:0] ew_light
);

    parameter S0_NS_GREEN  = 2'b00;
    parameter S1_NS_YELLOW = 2'b01;
    parameter S2_EW_GREEN  = 2'b10;
    parameter S3_EW_YELLOW = 2'b11;

    parameter RED    = 3'b100;
    parameter YELLOW = 3'b010;
    parameter GREEN  = 3'b001;

    parameter GREEN_TIME  = 10;
    parameter YELLOW_TIME = 3;

    reg [1:0] current_state, next_state;
    reg [3:0] timer;

    always @(posedge clk or posedge reset) begin
        if (reset) begin
            current_state <= S0_NS_GREEN;
            timer <= 0;
        end else begin
            if (current_state != next_state) begin
                current_state <= next_state;
                timer <= 0;
            end else begin
                timer <= timer + 1;
            end
        end
    end

    always @(*) begin
        case (current_state)
            S0_NS_GREEN: begin
                if (timer >= GREEN_TIME - 1)
                    next_state = S1_NS_YELLOW;
                else
                    next_state = S0_NS_GREEN;
            end

            S1_NS_YELLOW: begin
                if (timer >= YELLOW_TIME - 1)
                    next_state = S2_EW_GREEN;
                else
                    next_state = S1_NS_YELLOW;
            end

            S2_EW_GREEN: begin
                if (timer >= GREEN_TIME - 1)
                    next_state = S3_EW_YELLOW;
                else
                    next_state = S2_EW_GREEN;
            end

            S3_EW_YELLOW: begin
                if (timer >= YELLOW_TIME - 1)
                    next_state = S0_NS_GREEN;
                else
                    next_state = S3_EW_YELLOW;
            end

            default: next_state = S0_NS_GREEN;
        endcase
    end

    always @(*) begin
        case (current_state)
            S0_NS_GREEN: begin
                ns_light = GREEN;
                ew_light = RED;
            end
            S1_NS_YELLOW: begin
                ns_light = YELLOW;
                ew_light = RED;
            end
            S2_EW_GREEN: begin
                ns_light = RED;
                ew_light = GREEN;
            end
            S3_EW_YELLOW: begin
                ns_light = RED;
                ew_light = YELLOW;
            end
            default: begin
                ns_light = RED;
                ew_light = RED;
            end
        endcase
    end

endmodule
