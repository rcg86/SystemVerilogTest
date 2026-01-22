module half_adder_tb;

    logic a, b, sum, carry;

    half_adder dut (.*);

    initial begin
        // REQUIRED: These lines generate the .vcd file for GTKWave
        $dumpfile("waveform.vcd");
        $dumpvars(0, half_adder_tb);

        // Standard Monitor
        $monitor("Time: %0t | a=%b b=%b | sum=%b carry=%b", $time, a, b, sum, carry);

        // Stimulus with delays (Requires --timing flag in Verilator)
        a = 0; b = 0; #10;
        a = 0; b = 1; #10;
        a = 1; b = 0; #10;
        a = 1; b = 1; #10;

        $finish;
    end
endmodule
