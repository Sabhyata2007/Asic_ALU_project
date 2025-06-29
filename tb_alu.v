module tb_alu;

    reg [31:0] op1, op2;
    reg [3:0] alu_op;
    wire [31:0] result;
    wire zero, carry_out, overflow;

    alu uut (
        .op1(op1),
        .op2(op2),
        .alu_op(alu_op),
        .result(result),
        .zero(zero),
        .carry_out(carry_out),
        .overflow(overflow)
    );

    initial begin
        $dumpfile("dump.vcd");
        $dumpvars(0, tb_alu);

        op1 = 32'd10; op2 = 32'd5;

        alu_op = 4'b0000; #10;  // ADD
        alu_op = 4'b0001; #10;  // SUB
        alu_op = 4'b0010; #10;  // AND
        alu_op = 4'b0011; #10;  // OR
        alu_op = 4'b0100; #10;  // XOR
        alu_op = 4'b0101; #10;  // SLL
        alu_op = 4'b0110; #10;  // SRL
        alu_op = 4'b0111; #10;  // SRA
        alu_op = 4'b1000; #10;  // SLT
        alu_op = 4'b1001; #10;  // SLTU

        $finish;
    end

endmodule
