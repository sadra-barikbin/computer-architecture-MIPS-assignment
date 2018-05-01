module hazardDetector(input[4:0] src1,src2,exeDst,memDst,
	input isRegWriterAndImmediate,MEMwb_en,EXEwb_en,output hazard,input fwEn,IDRegMemReadEn);
  //wire readWriteConflictMEM=(memDst==src1)||((~isRegWriterAndImmediate)&(memDst==src2));
  //wire readWriteConflictEXE=(exeDst==src1)||((~isRegWriterAndImmediate)&(exeDst==src2));
  //assign hazard=fwEn?(IDRegMemReadEn && (src1==exeDst || src2==exeDst)):((readWriteConflictEXE && EXEwb_en)||(readWriteConflictMEM && MEMwb_en));
  
    wire oneSource, twoSource;
  assign hazard =(fwEn==1)?(IDRegMemReadEn && (src1==exeDst || src2==exeDst)&& !isRegWriterAndImmediate):( oneSource | twoSource);
   assign oneSource = (isRegWriterAndImmediate && ((MEMwb_en && src1 == memDst) || (EXEwb_en && src1 == exeDst))) ? 1 : 0;
    assign twoSource = (!isRegWriterAndImmediate && ((MEMwb_en && (src1 == memDst || src2 == memDst)) || (EXEwb_en && (src1 == exeDst || src2 == exeDst)))) ? 1 : 0;
endmodule
