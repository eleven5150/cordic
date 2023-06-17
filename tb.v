`timescale 1ns/1ns
/*
 CORDIC testbench
 
 This testbench assumes the default settings for `defines
 in the cordic.v file.  If you change any of the defaults
 you may have to make modifications to this file as well.
 
 This testbench uses `defines from the cordic.v file
 make sure you have the `include path set correctly for your
 environment.
 */
`define AMOUNT_OF_TEST_VALUES 100

`include "cordic.v"
`include "rotator.v"
`include "signed_shifter.v"
module tb ();
    
    wire [`XY_BITS:0]    x_o,y_o;
    reg  [`XY_BITS:0]    x_i,y_i;
    reg  clock,reset;
    reg init;
    
    cordic UUT (.clk(clock),.rst(reset),
    .x_i(x_i),.y_i(y_i),
    .x_o(x_o),.y_o(y_o));
    
    integer input_data;
    integer scan_res;

    integer i,j,k;
    real x_ref,y_ref,x_comp,y_comp,len_e,len_comp,len_ref;
    
    reg signed [`XY_BITS:0] ex,ey;
    
    reg signed [16:0] x [`AMOUNT_OF_TEST_VALUES:0];
    reg signed [16:0] y [`AMOUNT_OF_TEST_VALUES:0];
    
    task show_vector_results;
        input integer j;
        input [`XY_BITS:0] x_value;
        input [`XY_BITS:0] y_value;
        begin
            x_ref = x[j];
            y_ref = y[j];
            len_ref = $sqrt($pow(x_ref,2) + $pow(y_ref,2));
            len_comp = x_value * 32768 / `CORDIC_GAIN;
            if (len_comp > len_ref) len_e = 100 * (len_comp - len_ref) / len_comp; else len_e = 100 * (len_ref - len_comp) / len_ref;

            $display("input x = %f and y = %f; ref magnitude is %f, cordic magnitude = %f, error %f percents",x_ref,y_ref,len_ref,len_comp,len_e);
        end
    endtask

    task show_results;
        input integer j;
        input [`XY_BITS:0] lx;
        input [`XY_BITS:0] ly;
        begin
            show_vector_results(j,lx,ly);
        end
    endtask

    initial begin
        $display("Starting simulation");
        
        input_data = $fopen("input_data.txt", "r");
        // The following data is signed 16-bit values
        
        for (j = 0; j <= `AMOUNT_OF_TEST_VALUES; j = j + 1) begin
            scan_res  = $fscanf(input_data, "%d %d\n", x[j][15:0], y[j][15:0]);
            x[j][16] = x[j][15];              y[j][16] = y[j][15];   
        end
        
        clock    <= 0;
        init     <= 0;
        reset    <= 1;
        x_i      <= 0;
        y_i      <= 0;
        #1 clock <= 1;
        #1 clock <= 0;
        reset    <= 0;
        
        for (j = 0;j <= `AMOUNT_OF_TEST_VALUES;j = j+1) begin // test 91 different angles, 0 to 90 degrees
            x_i     <= x[j];
            y_i     <= y[j];
            
            
            #1 clock <= 1;
            #1 clock <= 0;
            if (j >= (`ITERATIONS-2)) begin // wait until the results start popping out
                show_results((j-(`ITERATIONS-2)),x_o,y_o);
            end

            if (j == `AMOUNT_OF_TEST_VALUES)  // now flush the pipe
                for(i = 0;i<(`ITERATIONS-2);i = i+1) begin
                    #1 clock <= 1;
                    #1 clock <= 0;
                    show_results((`AMOUNT_OF_TEST_VALUES-`ITERATIONS+3+i),x_o,y_o);
                end
        end

        for(i = 0;i < 16;i = i + 1)  // dump a few extra clock just for grins
            #1 clock <= ~clock;
            
    end
endmodule
