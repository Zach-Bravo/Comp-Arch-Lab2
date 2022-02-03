module Lab2(clock, reset, in, st_out, out);
	output reg out;
	output reg [3:0] st_out;
	input in;
	input clock, reset;
	parameter S0 = 4'b0000, S1 = 4'b0001, S2 = 4'b0010, S3 = 4'b0011, S4 = 4'b0100;
	reg [3:0] state, nx_state;
	
	always @(posedge clock, posedge reset)
	begin
	 if(reset==1) 
	 state <= S0;
	 else
	 state <= nx_state;
	end 
	
	always @(state, in)
	begin
	case(state)
	S0:
	if(in == 0) begin
	
	nx_state <= S0;
	
	end else begin
	
	nx_state <= S1;
	
	end
	S1:
	if(in == 0) begin
	
	nx_state <= S2;

	end else begin
	
	nx_state <= S1;
	
	end
	S2:
	if(in == 0) begin
	
	nx_state <= S3;
	
	end else begin
	
	nx_state <= S1;
	
	end
	S3:
	if(in == 0) begin
	
	nx_state <= S0;
	
	end else begin
	
	nx_state <= S4;
	
	end
	S4: 
	if(in == 0) begin
	
	nx_state <= S0;
	
	end else begin
	
	nx_state <= S2;
	
	end
	
	default: nx_state <= S0;
	
	endcase
	
	end
	
	always @(state)
	begin 
	 case(state) 
	 S0:   out = 0;
	 S0: st_out = 4'b0000;
	 S1:   out = 0;
	 S1: st_out = 4'b0001;
	 S2:  out = 0;
	 S2: st_out = 4'b0010;
	 S3:  out = 0;
	 S3: st_out = 4'b0011;
	 S4:  out = 1;
	 S4: st_out = 3'b0100;
	 default:  out = 0;
	 endcase
	end 
	
	endmodule 