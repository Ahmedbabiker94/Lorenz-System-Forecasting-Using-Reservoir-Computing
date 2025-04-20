`timescale 1ns/1ps

module lorenz_reservoir_tb;

    // Parameters
    parameter INT_WIDTH = 16;
    parameter FRAC_BITS = 8;
    parameter OUT_WIDTH = 8;
    parameter RESERVOIR_SIZE = 500;
    parameter INPUT_SCALING = 10;
    parameter SPECTRAL_RADIUS = 95;
    parameter LEAK_RATE = 30;
    parameter LAMBDA_REG = 80;
// Testbench signals
    reg clk;
    reg reset;
    wire signed [7:0] predicted_y;
    wire signed [7:0] actual_y;
    wire signed [7:0] lorenz_x;
    wire signed [7:0] lorenz_z;

    // Instantiate the DUT
    lorenz_reservoir dut (
        .clk(clk),
        .reset(reset),
        .predicted_y(predicted_y),
        .actual_y(actual_y),
        .lorenz_x(lorenz_x),
        .lorenz_z(lorenz_z)
    );

    // Clock generation
    initial begin
        clk = 0;
        forever #5 clk = ~clk; // 10ns clock period
    end

    // Test sequence
    initial begin
        // Initialize
        reset = 1;
        #20;
        reset = 0;

        // Run for some cycles
        #1000;

        // Check results
        if ((predicted_y - actual_y < 0 ? -(predicted_y - actual_y) : predicted_y - actual_y) > 5) begin
            $display("Error: Predicted and actual values differ by more than 5!");
        end else begin
            $display("Test passed: Predicted and actual values are within tolerance.");
        end

        // End simulation
        $finish;
    end

endmodule
