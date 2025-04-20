
module lorenz_system (
    input wire clk,
    input wire reset,
    input wire [31:0] sigma,   // Parameter sigma
    input wire [31:0] beta,    // Parameter beta (scaled by 10000)
    input wire [31:0] rho,     // Parameter rho
    input wire [31:0] dt,      // Time step (scaled by 100)
    output reg [31:0] x,       // Output x
    output reg [31:0] y,       // Output y
    output reg [31:0] z        // Output z
);

    reg [31:0] dx, dy, dz;

    always @(posedge clk or posedge reset) begin
        if (reset) begin
            x <= 32'd100;  // Initial x0 scaled by 100
            y <= 32'd100;  // Initial y0 scaled by 100
            z <= 32'd100;  // Initial z0 scaled by 100
        end else begin
            dx <= (sigma * (y - x)) * dt / 100;
            dy <= ((x * (rho - z) - y) * dt) / 100;
            dz <= ((x * y - beta * z / 10000) * dt) / 100;

            x <= x + dx;
            y <= y + dy;
            z <= z + dz;
        end
    end
endmodule
        