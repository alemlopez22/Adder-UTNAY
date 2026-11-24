
`default_nettype none

module tt_um_alemlopez22_adder_utnay (
    input  wire [7:0] ui_in,
    output wire [7:0] uo_out,
    input  wire [7:0] uio_in,
    output wire [7:0] uio_out,
    output wire [7:0] uio_oe,
    input  wire       ena,
    input  wire       clk,
    input  wire       rst_n
);

    wire A;
    wire B;
    wire Cin;

    wire AxorB;
    wire Carry1;
    wire Carry2;

    assign A   = ui_in[0];
    assign B   = ui_in[1];
    assign Cin = ui_in[2];

    // Full Adder logic
    assign AxorB = A ^ B;

    assign uo_out[0] = AxorB ^ Cin;
    assign Carry1 = A & B;
    assign Carry2 = AxorB & Cin;
    assign uo_out[1] = Carry1 | Carry2;

    // Unused outputs and signals
    assign uo_out[7:2] = 6'b000000;
    assign uio_out = 8'b00000000;
    assign uio_oe = 8'b00000000;

endmodule

`default_nettype wire
