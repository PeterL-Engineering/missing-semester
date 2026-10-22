module bitCounter (

    input   logic   clk,
    input   logic   rst,
    input   logic   start,
    
    output  logic   done

);

    // Define internal signals
    logic [4:0] counter;
    logic       running;

    // Define FSM/sequential logic
    always_ff @(posedge clk || posedge rst) begin
        if (rst) begin
            done    <= '0;
            counter <= '0;
            running <= '0;
        end else if (start && !running) begin
            done    <= '0;
            counter <= '0;
            running <= '1;
        end else if (running) begin
            counter <= counter + 1;
        end else if (counter) begin
            done    <= '1;
            counter <= '0;
            running <= '0;
        end
    end

endmodule