module half_adder_tb;

    // Declare signals to connect to the DUT (Device Under Test)
    logic a;
    logic b;
    logic sum;
    logic carry;

    // Instantiate the Half Adder
    // using .* allows automatic connection by name if signal names match
    half_adder dut (.*);

    // Stimulus generation
    initial begin
        // Print header
        $display("-----------------------------------------");
        $display(" Time | A  B | Sum Carry");
        $display("-----------------------------------------");

        // Monitor changes. This prints whenever a, b, sum, or carry changes.
        $monitor(" %4t | %b  %b |  %b    %b", $time, a, b, sum, carry);

        // Test Cases (Truth Table)
        a = 0; b = 0; #10; // 0 + 0
        a = 0; b = 1; #10; // 0 + 1
        a = 1; b = 0; #10; // 1 + 0
        a = 1; b = 1; #10; // 1 + 1

        // End simulation
        $finish;
    end

endmodule
