module rotator (
    input wire clk,
    input wire rst,
    input wire signed  [`XY_BITS:0]    x_i,
    input wire signed  [`XY_BITS:0]    y_i,
    output wire signed [`XY_BITS:0]    x_o,
    output wire signed [`XY_BITS:0]    y_o
    );
    
    parameter integer iteration             = 0; // parameter overriden in cordic module
    parameter signed [`THETA_BITS:0] tangle = 0; // parameter overriden in cordic module
    reg signed [`XY_BITS:0] x_1;
    reg signed [`XY_BITS:0] y_1;
    wire signed [`XY_BITS:0] x_i_shifted;
    wire signed [`XY_BITS:0] y_i_shifted;
    signed_shifter x_shifter(iteration,x_i,x_i_shifted);
    signed_shifter y_shifter(iteration,y_i,y_i_shifted);
    always @ (posedge clk)
        if (rst) begin
            x_1 <= 0;
            y_1 <= 0;
            end else begin
            if (y_i > 0) begin  // tryin real hard to align that vector with x-axis
                x_1 <= x_i + y_i_shifted; //shifter(y_1,i); //(y_1 >> i);
                y_1 <= y_i - x_i_shifted; //shifter(x_1,i); //(x_1 >> i);
                end else begin
                x_1 <= x_i - y_i_shifted; //shifter(y_1,i); //(y_1 >> i);
                y_1 <= y_i + x_i_shifted; //shifter(x_1,i); //(x_1 >> i);
            end
        end
        assign x_o = x_1;
        assign y_o = y_1;
endmodule