module extended_euclidean(a, b, out, clk, rst);
	input signed [32:1] a, b;
	input clk, rst;
	output reg signed [32:1] out; 
	
	reg signed [32:1] u, v, w, x, y, z;
	reg [4:1] state, nxtstate;
	reg [32:1] temp, w_prev, x_prev, y_prev, z_prev;
	
	parameter state0 = 4'h0, state1 = 4'h1, state2 = 4'h2, statte3 = 4'h3;
	parameter state4 = 4'h4, state5 = 4'h5, state6 = 4'h6, state7 = 4'h7;
	
	always @ (posedge clk or posedge rst)
	begin
		if(rst)
		begin
			state <= state0;
			u <= a; v <= b;
			w <= 1; x <= 0; y <= 0; z <= 1;
		end
		else
			state = nxtstate;
	end
	
	always @ (*)
	begin
		case (state)
			state0:
				if(u != 0)
					nxtstate = state1;
				else
					nxtstate = state6;
			
			state1:
				begin
					if(u[0] == 1'b0)
						nxtstate = state2;
					else
						nxtstate = statte3;
				end
				
			state2:
				begin
					u = u >>> 1;
					if(w[0] == 1'b0 && x[0] == 1'b0)
					begin
						w_prev = w;
						w = w >>> 1;
						x_prev = x;
						x = x >>> 1;
						if(w_prev == w)
							w = 0;
						else 
							w = w;
						if(x_prev == x)
							x = 0;
						else
							x = x;
					end
					else
					begin
						w_prev = w + b;
						w = (w + b) >>> 1;
						x_prev = x - a;
						x = (x - a) >>> 1;
						if(w_prev == w) 
							w = 0;
						else 
							w = w;
						if(x_prev == x)
							x = 0;
						else
							x = x;
					end
					nxtstate = state1;
				end
				
			statte3:
				begin
					if(v[0] == 1'b0)
						nxtstate = state4;
					else
						nxtstate = state5;
				end
				
			state4:
				begin
					v = v >>> 1;
					if(y[0] == 1'b0 && z[0] == 1'b0)
					begin
						y_prev = y;
						y = y >>> 1;
						z_prev = z;
						z = z >>> 1;
						if(y_prev == y)
							y = 0;
						else 
							y = y;
						if(z_prev == z)
							z = 0;
						else
							z = z;
					end
					else
					begin
						y_prev = y + b;
						y = (y + b) >>> 1;
						z_prev = z - a;
						z = (z - a) >>> 1;
						if(y_prev == y)
							y = 0;
						else
							y = y;
						if(z_prev == z)
							z = 0;
						else
							z = z;
					end
					nxtstate = statte3;
				end
				
			state5:
				begin
					if(u >= v)
					begin
						u = u - v;
						w = w - y;
						x = x - z;
					end
					else
					begin
						v = v - u;
						y = y - w;
						z = z - x;
					end
					nxtstate = state0;
				end
				
			state6:
				begin
					if(y[31] == 1'b1)
					begin
						temp = (b - y) % b;
						out = b - temp;
					end
					else
						out = y % b;
					nxtstate = state7;
					end
					
			state7: ; //do nothing
			
			default: nxtstate = state0;
		endcase
	end
	
endmodule