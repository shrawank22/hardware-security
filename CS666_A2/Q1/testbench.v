`timescale 1ns/1ns

module testbench();
	reg signed [32:1] a, b;
	reg clk, rst;
	wire signed [32:1] out; 
	
	integer i;
	extended_euclidean dut(a, b, out, clk, rst);
	
	initial
	begin
		$dumpfile("euclidean.vcd");
    	$dumpvars(0, testbench);
		a = 719;
		b = 9001;
		
		clk = 0; rst = 0; #5;
		
		for(i = 1; i <= 999; i++)
		begin
			if(i == 1)
				rst = 1;
			else
				rst = 0;
			clk = 1; #5; clk = ~clk; #5;
			if(out != 0)
			begin
				$display(out);
				$finish;
			end
		end
	end
	
endmodule