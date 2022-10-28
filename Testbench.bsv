package Testbench;

import Sample::*;

module mkTestbench (Empty);
	Sample_ifc m <- mkSample(0);
	Reg#(int) cnt <- mkReg(0);

	rule test;
		cnt <= cnt +1;
	endrule

	rule ausgabe;
		$display("%0d", cnt);
		if(cnt > 3) begin
			$finish(0);
		end
	endrule
endmodule: mkTestbench

endpackage: Testbench
		
