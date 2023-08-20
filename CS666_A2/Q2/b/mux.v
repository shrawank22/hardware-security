module mux(i0, i1, i2, i3, i4, i5, i6, i7, i8, i9, i10, i11, i12, i13, i14, i15, select, out);
input [3:0] i0, i1, i2, i3, i4, i5, i6, i7, i8, i9, i10, i11, i12, i13, i14, i15, select;
output reg [3:0] out;
always @(*)
begin
    case(select)
    	4'b0000:	out=i0;
		4'b0001:	out=i1;
		4'b0010:	out=i2;
		4'b0011:	out=i3;
		4'b0100:	out=i4;
		4'b0101:	out=i5;
		4'b0110:	out=i6;
		4'b0111:	out=i7;
		4'b1000:	out=i8;
		4'b1001:	out=i9;
		4'b1010:	out=i10;
		4'b1011:	out=i11;
		4'b1100:	out=i12;
		4'b1101:	out=i13;
		4'b1110:	out=i14;
		4'b1111:	out=i15;
		default:	$display("invalid selection");
    endcase
end
endmodule
