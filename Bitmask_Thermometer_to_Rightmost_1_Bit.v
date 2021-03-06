
//# Bitmask: Thermometer to Rightmost 1 Bit

// Credit: [Hacker's Delight](./books.html#Warren2013), Section 2-1: Manipulating Rightmost Bits

// Use the following formula to create a word with 1’s at the positions of the
// rightmost 1-bit and the trailing 0’s in the input, producing all 1’s if no
// 1-bit, and the integer 1 if no trailing 0’s (e.g., 01011000 -> 00001111)

`default_nettype none

module Bitmask_Thermometer_to_Rightmost_1_Bit
#(
    parameter WORD_WIDTH = 0
)
(
    input   wire    [WORD_WIDTH-1:0]    word_in,
    output  reg     [WORD_WIDTH-1:0]    word_out
);

    initial begin
        word_out = {WORD_WIDTH{1'b0}};
    end

    localparam ONE = {{WORD_WIDTH-1{1'b0}},1'b1};

    always @(*) begin
        word_out = word_in ^ (word_in - ONE);
    end

endmodule

