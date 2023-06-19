`include "settings.h"

module signed_shifter (input wire [`ITERATION_BITS-1:0] i,
                       input wire signed [`XY_BITS:0] D,
                       output reg signed [`XY_BITS:0] Q);
integer j;
always @ *
begin
Q = D;
for(j = 0;j<i;j = j+1)
    Q = (Q >> 1) | (D[`XY_BITS] << `XY_BITS); // Shift right by 1 bit "i" times - keep the sign
end
endmodule