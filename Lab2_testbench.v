module Lab2_testbench();
	reg in;
	reg clock;
	reg reset;
	wire out;
	wire [3:0] st_out;
	
	Lab2 dut (clock, reset, in, st_out, out);

	initial begin
	clock = 0;
	forever #100 clock = ~clock;
	end
	
	initial begin
	#100 reset = 1;
	#100
	#100 reset = 0;
	#100
	#100 in = 0;
	#100
	#100 in = 1;
	#100
	#100 in = 0;
	#100
	#100 in = 0;
	#100
	#100 in = 1;
	
		#1500 $stop;
	end
endmodule
