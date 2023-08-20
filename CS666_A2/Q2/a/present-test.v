module testbench;



reg [3:0] x;
wire [3:0] s;
present DUT(x, s);

initial 
begin
    $dumpfile("present.vcd");
    $dumpvars(0, testbench);
    $monitor ("x=%h, s=%h", x, s);
    #5 x=4'b0000; 
    #5 x=4'b0001; 
    #5 x=4'b0010;
    #5 x=4'b0011; 
    #5 x=4'b0100; 
    #5 x=4'b0101;
    #5 x=4'b0110; 
    #5 x=4'b0111; 
    #5 x=4'b1000;
    #5 x=4'b1001; 
    #5 x=4'b1010; 
    #5 x=4'b1011;
    #5 x=4'b1100; 
    #5 x=4'b1101; 
    #5 x=4'b1110; 
    #5 x=4'b1111; 
    #5 $finish;
end

endmodule