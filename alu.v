module alu (
    input wire [31:0] op1,
    input wire [31:0] op2,
    input wire [3:0] alu_op,
    output reg [31:0] result,
    output wire zero,
    output reg carry_out,
    output reg overflow
);

    localparam ADD  = 4'b0000;
    localparam SUB  = 4'b0001;
    localparam AND  = 4'b0010;
    localparam OR   = 4'b0011;
    localparam XOR  = 4'b0100;
    localparam SLL  = 4'b0101;
    localparam SRL  = 4'b0110;
    localparam SRA  = 4'b0111;
    localparam SLT  = 4'b1000;
    localparam SLTU = 4'b1001;

    wire [31:0] sum, diff;

    assign sum = op1 + op2;
    assign diff = op1 - op2;
    assign zero = (result == 32'b0);

    always @(*) begin
        carry_out = 0;
        overflow = 0;
        case (alu_op)
            ADD: result = sum;
            SUB: result = diff;
            AND: result = op1 & op2;
            OR:  result = op1 | op2;
            XOR: result = op1 ^ op2;
            SLL: result = op1 << op2[4:0];
            SRL: result = op1 >> op2[4:0];
            SRA: result = $signed(op1) >>> op2[4:0];
            SLT: result = ($signed(op1) < $signed(op2)) ? 32'd1 : 32'd0;
            SLTU: result = (op1 < op2) ? 32'd1 : 32'd0;
            default: result = 32'd0;
        endcase
    end

endmodule
