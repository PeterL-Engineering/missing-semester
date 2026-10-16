module twos_complement (

    parameter   DATA_WIDTH      = 16;
    localparam  LOG_DATA_WIDTH  = $clog(DATA_WIDTH);

) (

    input   logic   Clk,
    input   logic   Rst,
    input   logic   Start,
    input   logic   A,

    output  logic   Q

);

    // Define state logic
    typedef enum logic {
        2'b00 : IDLE;
        2'b01 : RUNNING;
        2'b10 : DONE;
    } state;

    // Define FSM combinational logic
    logic state Cur_state;
    logic state Next_state;

    logic [LOG_DATA_WIDTH-1:0] Count;   

    always_comb begin : next_state_comb

        // Default state
        Next_state = IDLE;

        if (Cur_state == IDLE && Start) 
            Next_state = RUNNING;
        else if (Cur_state == RUNNING && Count)
            Next_state = DONE;
        else if (Cur_state == DONE)
            Next_state = IDLE;
    end
                           
    // Define FSM sequential logic
    always_ff @(posedge Clk || posedge Rst) begin : next_state_seq
        if (Rst)
            Cur_state <= IDLE;
        else
            Cur_state <= Next_state;
    end

    // Define datapath sequential logic
    logic [DATA_WIDTH-1:0]     Data;
    logic [LOG_DATA_WIDTH-1:0] Counter;

    always_ff @(posedge Clk || posedge Rst) begin : datapath_seq
        if (Rst) begin
            Data    <= '0;
            Counter <= '0;
            Q       <= '0;
        end else if (Cur_state == RUNNING) begin
            Counter <= Counter + 1;
            Data    <= {Data[14:0], A};
        end else if (Cur_state == DONE) begin
            Counter <= '0;
            Q       <= ~Data + 1
        end 
    end

endmodule