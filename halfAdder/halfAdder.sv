module half_adder (
    input  logic a,
    input  logic b,
    output logic sum,
    output logic carry
);

    // Continuous assignment for combinatorial logic
    assign sum   = a ^ b; // XOR operation
    assign carry = a & b; // AND operation

endmodule
