//=============================================================================
// Module: adder_4bit
// Description: 4-bit ripple carry adder using full adder instances
//              Demonstrates structural modeling and hierarchical design
// Author: SystemVerilog Lab Series
// Date: 2026-01-10
//=============================================================================

module adder_4bit (
    input  logic [3:0] a,      // 4-bit input A
    input  logic [3:0] b,      // 4-bit input B
    input  logic       cin,    // Carry input
    output logic [3:0] sum,    // 4-bit sum output
    output logic       cout    // Carry output
);

    // Internal carry signals between full adders
    // c[0] connects FA0 to FA1, c[1] connects FA1 to FA2, etc.
    logic [2:0] c;

    // Structural instantiation of 4 full adders
    // This creates a hierarchical design
    
    // Bit 0 (LSB): First full adder
    full_adder fa0 (
        .a(a[0]),
        .b(b[0]),
        .cin(cin),      // External carry input
        .sum(sum[0]),
        .cout(c[0])     // Internal carry to next stage
    );
    
    // Bit 1: Second full adder
    full_adder fa1 (
        .a(a[1]),
        .b(b[1]),
        .cin(c[0]),     // Carry from previous stage
        .sum(sum[1]),
        .cout(c[1])
    );
    
    // Bit 2: Third full adder
    full_adder fa2 (
        .a(a[2]),
        .b(b[2]),
        .cin(c[1]),
        .sum(sum[2]),
        .cout(c[2])
    );
    
    // Bit 3 (MSB): Fourth full adder
    full_adder fa3 (
        .a(a[3]),
        .b(b[3]),
        .cin(c[2]),
        .sum(sum[3]),
        .cout(cout)     // External carry output
    );

    // Note: This is structural modeling (instantiating components)
    // Alternative: behavioral modeling with assign sum = a + b + cin;
    // We use structural here to learn hierarchical design and see
    // how synthesis maps to actual hardware

endmodule : adder_4bit
