module top_module (
    input clk,
    input [7:0] in,
    output [7:0] anyedge
);

    logic [7:0] prev;

    always_ff @( posedge clk ) begin
        prev    <= in;
        anyedge <= in ^ prev;    
    end

endmodule