module testbench();
reg [3:0] i0, i1, i2, i3, i4, i5, i6, i7, i8, i9, i10, i11, i12, i13, i14, i15, select;
wire [3:0] out;
present DUT(i0, i1, i2, i3, i4, i5, i6, i7, i8, i9, i10, i11, i12, i13, i14, i15, select, out);
initial 
begin
    $dumpfile("present.vcd");
    $dumpvars(0,testbench);
    $monitor ("x=%h, s[x]=%h", select[3:0], out[3:0]);

    assign i0 = 4'hC;
    assign i1 = 4'h5;
    assign i2 = 4'h6;
    assign i3 = 4'hB;
    assign i4 = 4'h9; 
    assign i5 = 4'h0; 
    assign i6 = 4'hA;
    assign i7 = 4'hD;
    assign i8 = 4'h3;
    assign i9 = 4'hE;
    assign i10 = 4'hF;
    assign i11 = 4'h8;
    assign i12 = 4'h4;
    assign i13 = 4'h7;
    assign i14 = 4'h1;
    assign i15 = 4'h2;
    select = 4'b0000;
    #2 select = 4'b0001;
    #2 select = 4'b0010;
    #2 select= 4'b0011;
    #2 select = 4'b0100;
    #2 select = 4'b0101;
    #2 select = 4'b0110;
    #2 select = 4'b0111;
    #2 select = 4'b1000;
    #2 select = 4'b1001;
    #2 select = 4'b1010;
    #2 select = 4'b1011;
    #2 select = 4'b1100;
    #2 select = 4'b1101;
    #2 select = 4'b1110;
    #2 select = 4'b1111;
    #200 $finish;

end
endmodule
