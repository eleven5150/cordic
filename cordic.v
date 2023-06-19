`include "settings.h"

module cordic (
    input wire clk,
    input wire rst,
    
    input wire signed [`XY_BITS:0]    x_i,
    input wire signed [`XY_BITS:0]    y_i,
    
    output wire signed [`XY_BITS:0]    x_o,
    output wire signed [`XY_BITS:0]    y_o
    );
    /*
        arctan table in radian format  16 bit + sign bit.
        */
    function [`THETA_BITS:0] tanangle;
        input [3:0] i;
        begin
            case (i)
                4'b0000: tanangle = 17'd25735;    //  1/1
                4'b0001: tanangle = 17'd15192;    //  1/2
                4'b0010: tanangle = 17'd8027;     //  1/4
                4'b0011: tanangle = 17'd4075;     //  1/8
                4'b0100: tanangle = 17'd2045;     //  1/16
                4'b0101: tanangle = 17'd1024;     //  1/32
                4'b0110: tanangle = 17'd512;      //  1/64
                4'b0111: tanangle = 17'd256;      //  1/128
                4'b1000: tanangle = 17'd128;      //  1/256
                4'b1001: tanangle = 17'd64;       //  1/512
                4'b1010: tanangle = 17'd32;       //  1/1024
                4'b1011: tanangle = 17'd16;       //  1/2048
                4'b1100: tanangle = 17'd8;        //  1/4096
                4'b1101: tanangle = 17'd4;        //  1/8192
                4'b1110: tanangle = 17'd2;        //  1/16k
                4'b1111: tanangle = 17'd1;        //  1/32k
            endcase
        end
    endfunction
    
    wire signed [`XY_BITS:0] x [`ITERATIONS-1:0];
    wire signed [`XY_BITS:0] y [`ITERATIONS-1:0];
    assign x[0]    = x_i < 0  ? -x_i 
                                : x_i;
    assign y[0]    = y_i < 0  ? -y_i
                                : y_i;
    assign x_o     = x[`ITERATIONS-1];
    assign y_o     = y[`ITERATIONS-1];
    
    genvar i;
    generate
    for(i = 0;i<`ITERATIONS-1;i = i+1)
    begin
        rotator U (clk,rst,x[i],y[i],x[i+1],y[i+1]);
        defparam U.iteration = i;
        defparam U.tangle    = tanangle(i);
    end
    endgenerate
endmodule
