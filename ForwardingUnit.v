module ForwardingUnit(input forwardEn,exeWbEn,memWbEn,input[4:0] exeRegDst,memRegDst,stAndBneSrc,src1,src2,
	output[1:0] val1Forward,val2Forward,src2_valForward);
	assign val1Forward=forwardEn?((exeRegDst==src1 && exeWbEn)?1:(memRegDst==src1 && memWbEn)?2:0):0;
	assign val2Forward=forwardEn?((exeRegDst==src2 && exeWbEn)?1:(memRegDst==src2 && memWbEn)?2:0):0;
	assign src2_valForward=forwardEn?((stAndBneSrc==exeRegDst && exeWbEn)?1:(stAndBneSrc==memRegDst && memWbEn)?2:0):0;
endmodule