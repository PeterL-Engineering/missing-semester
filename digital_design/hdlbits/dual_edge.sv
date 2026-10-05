module top_module (
    input clk,
    input d,
    output q
);

    logic p, n;

    always_ff @(posedge clk) p <= d ^ n;
    always_ff @(negedge clk) n <= d ^ p;

    assign q = p ^ n;

endmodule
