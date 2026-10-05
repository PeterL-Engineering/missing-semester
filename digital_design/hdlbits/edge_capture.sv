module top_module (
    input clk,
    input reset,
    input [31:0] in,
    output [31:0] out
);

    logic [31:0] prev;

    always_ff @(posedge clk) begin
        if (reset) 
            out     <= '0;
        else begin
            out     <= (~in & prev) | out;
        end
        prev    <= in;
    end

endmodule