module top_module (
    input clk,
    input reset,      // Synchronous active-high reset
    output [3:0] q);

    always_ff @(posedge clk) begin
        if (reset || q == 4'b1010)
            q <= 4'b001;
        else 
            q <= q + 1;
    end

endmodule