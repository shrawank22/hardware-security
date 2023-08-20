`timescale 1ns / 1ns

module present(x, s);
    input [3:0] x;
    output reg [3:0] s;

    always @ (x)
    begin
	case (x)
        0: s = 12;
        1: s = 5;
        2: s = 6;
        3: s = 11;
        4: s = 9;
        5: s = 0;
        6: s = 10;
        7: s = 13;
        8: s = 3;
        9: s = 14;
        10: s = 15;
        11: s = 8;
        12: s = 4;
        13: s = 7;
        14: s = 1;
        15: s = 2;
	endcase
    end
endmodule
