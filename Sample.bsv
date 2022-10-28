package Sample;

import GetPut::*;
// <- side effect assignment
// = local assignment
// <= non-blocking assignment

interface Sample_ifc;
	method ActionValue#(int) actionValueTest(int x); // ActionValue
	method Action actionTest(int x); // Action
	method int getTestVal(); // Value
	interface Get#(int) getInterfaceTest;
endinterface: Sample_ifc

module mkSample#(parameter int startVal) (Sample_ifc);
	Reg#(int) testval <- mkReg(startVal);
	
	method ActionValue#(int) actionValueTest(int x);
		$display("testval = %0d", testval);
		testval <= testval + x;
		return testval;
	endmethod

	method Action actionTest(int x);
		testval <= testval + x;
	endmethod

	method int getTestVal();
		return 3;
	endmethod

	interface Get getInterfaceTest;
		method ActionValue#(int) get() if(testval > 5);
			return 2;
		endmethod
	endinterface
endmodule: mkSample

endpackage: Sample
