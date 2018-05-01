// ============================================================================
// Copyright (c) 2012 by Terasic Technologies Inc.
// ============================================================================
//
// Permission:
//
//   Terasic grants permission to use and modify this code for use
//   in synthesis for all Terasic Development Boards and Altera Development 
//   Kits made by Terasic.  Other use of this code, including the selling 
//   ,duplication, or modification of any portion is strictly prohibited.
//
// Disclaimer:
//
//   This VHDL/Verilog or C/C++ source code is intended as a design reference
//   which illustrates how these types of functions can be implemented.
//   It is the user's responsibility to verify their design for
//   consistency and functionality through the use of formal
//   verification methods.  Terasic provides no warranty regarding the use 
//   or functionality of this code.
//
// ============================================================================
//           
//  Terasic Technologies Inc
//  9F., No.176, Sec.2, Gongdao 5th Rd, East Dist, Hsinchu City, 30070. Taiwan
//
//
//
//                     web: http://www.terasic.com/
//                     email: support@terasic.com
//
// ============================================================================
//
// Major Functions:	DE2 TOP LEVEL
//
// ============================================================================
//
// Revision History :
// ============================================================================
//   Ver  :| Author            :| Mod. Date :| Changes Made:
//   V1.0 :| Johnny Chen       :| 05/08/19  :|      Initial Revision
//   V1.1 :| Johnny Chen       :| 05/11/16  :|      Added FLASH Address FL_ADDR[21:20]
//   V1.2 :| Johnny Chen       :| 05/11/16  :|		Fixed ISP1362 INT/DREQ Pin Direction.   
//   V1.3 :| Johnny Chen       :| 06/11/16  :|		Added the Dedicated TV Decoder Line-Locked-Clock Input
//													            for DE2 v2.X PCB.
//   V1.5 :| Eko    Yan        :| 12/01/30  :|      Update to version 11.1 sp1.
// ============================================================================

module MIPS
	(
		////////////////////	Clock Input	 	////////////////////	 
		CLOCK_27,						//	27 MHz
		CLOCK_50,						//	50 MHz
		EXT_CLOCK,						//	External Clock
		////////////////////	Push Button		////////////////////
		KEY,							//	Pushbutton[3:0]
		////////////////////	DPDT Switch		////////////////////
		SW,								//	Toggle Switch[17:0]
		////////////////////	7-SEG Dispaly	////////////////////
		HEX0,							//	Seven Segment Digit 0
		HEX1,							//	Seven Segment Digit 1
		HEX2,							//	Seven Segment Digit 2
		HEX3,							//	Seven Segment Digit 3
		HEX4,							//	Seven Segment Digit 4
		HEX5,							//	Seven Segment Digit 5
		HEX6,							//	Seven Segment Digit 6
		HEX7,							//	Seven Segment Digit 7
		////////////////////////	LED		////////////////////////
		LEDG,							//	LED Green[8:0]
		LEDR,							//	LED Red[17:0]
		////////////////////////	UART	////////////////////////
		//UART_TXD,						//	UART Transmitter
		//UART_RXD,						//	UART Receiver
		////////////////////////	IRDA	////////////////////////
		//IRDA_TXD,						//	IRDA Transmitter
		//IRDA_RXD,						//	IRDA Receiver
		/////////////////////	SDRAM Interface		////////////////
		DRAM_DQ,						//	SDRAM Data bus 16 Bits
		DRAM_ADDR,						//	SDRAM Address bus 12 Bits
		DRAM_LDQM,						//	SDRAM Low-byte Data Mask 
		DRAM_UDQM,						//	SDRAM High-byte Data Mask
		DRAM_WE_N,						//	SDRAM Write Enable
		DRAM_CAS_N,						//	SDRAM Column Address Strobe
		DRAM_RAS_N,						//	SDRAM Row Address Strobe
		DRAM_CS_N,						//	SDRAM Chip Select
		DRAM_BA_0,						//	SDRAM Bank Address 0
		DRAM_BA_1,						//	SDRAM Bank Address 0
		DRAM_CLK,						//	SDRAM Clock
		DRAM_CKE,						//	SDRAM Clock Enable
		////////////////////	Flash Interface		////////////////
		FL_DQ,							//	FLASH Data bus 8 Bits
		FL_ADDR,						//	FLASH Address bus 22 Bits
		FL_WE_N,						//	FLASH Write Enable
		FL_RST_N,						//	FLASH Reset
		FL_OE_N,						//	FLASH Output Enable
		FL_CE_N,						//	FLASH Chip Enable
		////////////////////	SRAM Interface		////////////////
		SRAM_DQ,						//	SRAM Data bus 16 Bits
		SRAM_ADDR,						//	SRAM Address bus 18 Bits
		SRAM_UB_N,						//	SRAM High-byte Data Mask 
		SRAM_LB_N,						//	SRAM Low-byte Data Mask 
		SRAM_WE_N,						//	SRAM Write Enable
		SRAM_CE_N,						//	SRAM Chip Enable
		SRAM_OE_N,						//	SRAM Output Enable
		////////////////////	ISP1362 Interface	////////////////
		OTG_DATA,						//	ISP1362 Data bus 16 Bits
		OTG_ADDR,						//	ISP1362 Address 2 Bits
		OTG_CS_N,						//	ISP1362 Chip Select
		OTG_RD_N,						//	ISP1362 Write
		OTG_WR_N,						//	ISP1362 Read
		OTG_RST_N,						//	ISP1362 Reset
		OTG_FSPEED,						//	USB Full Speed,	0 = Enable, Z = Disable
		OTG_LSPEED,						//	USB Low Speed, 	0 = Enable, Z = Disable
		OTG_INT0,						//	ISP1362 Interrupt 0
		OTG_INT1,						//	ISP1362 Interrupt 1
		OTG_DREQ0,						//	ISP1362 DMA Request 0
		OTG_DREQ1,						//	ISP1362 DMA Request 1
		OTG_DACK0_N,					//	ISP1362 DMA Acknowledge 0
		OTG_DACK1_N,					//	ISP1362 DMA Acknowledge 1
		////////////////////	LCD Module 16X2		////////////////
		LCD_ON,							//	LCD Power ON/OFF
		LCD_BLON,						//	LCD Back Light ON/OFF
		LCD_RW,							//	LCD Read/Write Select, 0 = Write, 1 = Read
		LCD_EN,							//	LCD Enable
		LCD_RS,							//	LCD Command/Data Select, 0 = Command, 1 = Data
		LCD_DATA,						//	LCD Data bus 8 bits
		////////////////////	SD_Card Interface	////////////////
		//SD_DAT,							//	SD Card Data
		//SD_WP_N,						   //	SD Write protect 
		//SD_CMD,							//	SD Card Command Signal
		//SD_CLK,							//	SD Card Clock
		////////////////////	USB JTAG link	////////////////////
		TDI,  							// CPLD -> FPGA (data in)
		TCK,  							// CPLD -> FPGA (clk)
		TCS,  							// CPLD -> FPGA (CS)
	   TDO,  							// FPGA -> CPLD (data out)
		////////////////////	I2C		////////////////////////////
		I2C_SDAT,						//	I2C Data
		I2C_SCLK,						//	I2C Clock
		////////////////////	PS2		////////////////////////////
		PS2_DAT,						//	PS2 Data
		PS2_CLK,						//	PS2 Clock
		////////////////////	VGA		////////////////////////////
		VGA_CLK,   						//	VGA Clock
		VGA_HS,							//	VGA H_SYNC
		VGA_VS,							//	VGA V_SYNC
		VGA_BLANK,						//	VGA BLANK
		VGA_SYNC,						//	VGA SYNC
		VGA_R,   						//	VGA Red[9:0]
		VGA_G,	 						//	VGA Green[9:0]
		VGA_B,  						//	VGA Blue[9:0]
		////////////	Ethernet Interface	////////////////////////
		ENET_DATA,						//	DM9000A DATA bus 16Bits
		ENET_CMD,						//	DM9000A Command/Data Select, 0 = Command, 1 = Data
		ENET_CS_N,						//	DM9000A Chip Select
		ENET_WR_N,						//	DM9000A Write
		ENET_RD_N,						//	DM9000A Read
		ENET_RST_N,						//	DM9000A Reset
		ENET_INT,						//	DM9000A Interrupt
		ENET_CLK,						//	DM9000A Clock 25 MHz
		////////////////	Audio CODEC		////////////////////////
		AUD_ADCLRCK,					//	Audio CODEC ADC LR Clock
		AUD_ADCDAT,						//	Audio CODEC ADC Data
		AUD_DACLRCK,					//	Audio CODEC DAC LR Clock
		AUD_DACDAT,						//	Audio CODEC DAC Data
		AUD_BCLK,						//	Audio CODEC Bit-Stream Clock
		AUD_XCK,						//	Audio CODEC Chip Clock
		////////////////	TV Decoder		////////////////////////
		TD_DATA,    					//	TV Decoder Data bus 8 bits
		TD_HS,							//	TV Decoder H_SYNC
		TD_VS,							//	TV Decoder V_SYNC
		TD_RESET,						//	TV Decoder Reset
		TD_CLK27,                  //	TV Decoder 27MHz CLK
		////////////////////	GPIO	////////////////////////////
		GPIO_0,							//	GPIO Connection 0
		GPIO_1							//	GPIO Connection 1
	);

////////////////////////	Clock Input	 	////////////////////////
input		   	CLOCK_27;				//	27 MHz
input		   	CLOCK_50;				//	50 MHz
input			   EXT_CLOCK;				//	External Clock
////////////////////////	Push Button		////////////////////////
input	   [3:0]	KEY;					//	Pushbutton[3:0]
////////////////////////	DPDT Switch		////////////////////////
input	  [17:0]	SW;						//	Toggle Switch[17:0]
////////////////////////	7-SEG Dispaly	////////////////////////
output	[6:0]	HEX0;					//	Seven Segment Digit 0
output	[6:0]	HEX1;					//	Seven Segment Digit 1
output	[6:0]	HEX2;					//	Seven Segment Digit 2
output	[6:0]	HEX3;					//	Seven Segment Digit 3
output	[6:0]	HEX4;					//	Seven Segment Digit 4
output	[6:0]	HEX5;					//	Seven Segment Digit 5
output	[6:0]	HEX6;					//	Seven Segment Digit 6
output	[6:0]	HEX7;					//	Seven Segment Digit 7
////////////////////////////	LED		////////////////////////////
output	[8:0]	LEDG;					//	LED Green[8:0]
output  [17:0]	LEDR;					//	LED Red[17:0]
////////////////////////////	UART	////////////////////////////
//output			UART_TXD;				//	UART Transmitter
//input			   UART_RXD;				//	UART Receiver
////////////////////////////	IRDA	////////////////////////////
//output			IRDA_TXD;				//	IRDA Transmitter
//input			   IRDA_RXD;				//	IRDA Receiver
///////////////////////		SDRAM Interface	////////////////////////
inout	  [15:0]	DRAM_DQ;				//	SDRAM Data bus 16 Bits
output  [11:0]	DRAM_ADDR;				//	SDRAM Address bus 12 Bits
output			DRAM_LDQM;				//	SDRAM Low-byte Data Mask 
output			DRAM_UDQM;				//	SDRAM High-byte Data Mask
output			DRAM_WE_N;				//	SDRAM Write Enable
output			DRAM_CAS_N;				//	SDRAM Column Address Strobe
output			DRAM_RAS_N;				//	SDRAM Row Address Strobe
output			DRAM_CS_N;				//	SDRAM Chip Select
output			DRAM_BA_0;				//	SDRAM Bank Address 0
output			DRAM_BA_1;				//	SDRAM Bank Address 0
output			DRAM_CLK;				//	SDRAM Clock
output			DRAM_CKE;				//	SDRAM Clock Enable
////////////////////////	Flash Interface	////////////////////////
inout	  [7:0]	FL_DQ;					//	FLASH Data bus 8 Bits
output [21:0]	FL_ADDR;				//	FLASH Address bus 22 Bits
output			FL_WE_N;				//	FLASH Write Enable
output			FL_RST_N;				//	FLASH Reset
output			FL_OE_N;				//	FLASH Output Enable
output			FL_CE_N;				//	FLASH Chip Enable
////////////////////////	SRAM Interface	////////////////////////
inout	 [15:0]	SRAM_DQ;				//	SRAM Data bus 16 Bits
output [17:0]	SRAM_ADDR;				//	SRAM Address bus 18 Bits
output			SRAM_UB_N;				//	SRAM High-byte Data Mask 
output			SRAM_LB_N;				//	SRAM Low-byte Data Mask 
output			SRAM_WE_N;				//	SRAM Write Enable
output			SRAM_CE_N;				//	SRAM Chip Enable
output			SRAM_OE_N;				//	SRAM Output Enable
////////////////////	ISP1362 Interface	////////////////////////
inout	 [15:0]	OTG_DATA;				//	ISP1362 Data bus 16 Bits
output  [1:0]	OTG_ADDR;				//	ISP1362 Address 2 Bits
output			OTG_CS_N;				//	ISP1362 Chip Select
output			OTG_RD_N;				//	ISP1362 Write
output			OTG_WR_N;				//	ISP1362 Read
output			OTG_RST_N;				//	ISP1362 Reset
output			OTG_FSPEED;				//	USB Full Speed,	0 = Enable, Z = Disable
output			OTG_LSPEED;				//	USB Low Speed, 	0 = Enable, Z = Disable
input			   OTG_INT0;				//	ISP1362 Interrupt 0
input			   OTG_INT1;				//	ISP1362 Interrupt 1
input			   OTG_DREQ0;				//	ISP1362 DMA Request 0
input			   OTG_DREQ1;				//	ISP1362 DMA Request 1
output			OTG_DACK0_N;			//	ISP1362 DMA Acknowledge 0
output			OTG_DACK1_N;			//	ISP1362 DMA Acknowledge 1
////////////////////	LCD Module 16X2	////////////////////////////
inout	  [7:0]	LCD_DATA;				//	LCD Data bus 8 bits
output			LCD_ON;					//	LCD Power ON/OFF
output			LCD_BLON;				//	LCD Back Light ON/OFF
output			LCD_RW;					//	LCD Read/Write Select, 0 = Write, 1 = Read
output			LCD_EN;					//	LCD Enable
output			LCD_RS;					//	LCD Command/Data Select, 0 = Command, 1 = Data
////////////////////	SD Card Interface	////////////////////////
//inout	 [3:0]	SD_DAT;					//	SD Card Data
//input			   SD_WP_N;				   //	SD write protect
//inout			   SD_CMD;					//	SD Card Command Signal
//output			SD_CLK;					//	SD Card Clock
////////////////////////	I2C		////////////////////////////////
inout			   I2C_SDAT;				//	I2C Data
output			I2C_SCLK;				//	I2C Clock
////////////////////////	PS2		////////////////////////////////
input		 	   PS2_DAT;				//	PS2 Data
input			   PS2_CLK;				//	PS2 Clock
////////////////////	USB JTAG link	////////////////////////////
input  			TDI;					// CPLD -> FPGA (data in)
input  			TCK;					// CPLD -> FPGA (clk)
input  			TCS;					// CPLD -> FPGA (CS)
output 			TDO;					// FPGA -> CPLD (data out)
////////////////////////	VGA			////////////////////////////
output			VGA_CLK;   				//	VGA Clock
output			VGA_HS;					//	VGA H_SYNC
output			VGA_VS;					//	VGA V_SYNC
output			VGA_BLANK;				//	VGA BLANK
output			VGA_SYNC;				//	VGA SYNC
output	[9:0]	VGA_R;   				//	VGA Red[9:0]
output	[9:0]	VGA_G;	 				//	VGA Green[9:0]
output	[9:0]	VGA_B;   				//	VGA Blue[9:0]
////////////////	Ethernet Interface	////////////////////////////
inout	[15:0]	ENET_DATA;				//	DM9000A DATA bus 16Bits
output			ENET_CMD;				//	DM9000A Command/Data Select, 0 = Command, 1 = Data
output			ENET_CS_N;				//	DM9000A Chip Select
output			ENET_WR_N;				//	DM9000A Write
output			ENET_RD_N;				//	DM9000A Read
output			ENET_RST_N;				//	DM9000A Reset
input			   ENET_INT;				//	DM9000A Interrupt
output			ENET_CLK;				//	DM9000A Clock 25 MHz
////////////////////	Audio CODEC		////////////////////////////
inout			   AUD_ADCLRCK;			//	Audio CODEC ADC LR Clock
input			   AUD_ADCDAT;				//	Audio CODEC ADC Data
inout			   AUD_DACLRCK;			//	Audio CODEC DAC LR Clock
output			AUD_DACDAT;				//	Audio CODEC DAC Data
inout			   AUD_BCLK;				//	Audio CODEC Bit-Stream Clock
output			AUD_XCK;				//	Audio CODEC Chip Clock
////////////////////	TV Devoder		////////////////////////////
input	 [7:0]	TD_DATA;    			//	TV Decoder Data bus 8 bits
input			   TD_HS;					//	TV Decoder H_SYNC
input			   TD_VS;					//	TV Decoder V_SYNC
output			TD_RESET;				//	TV Decoder Reset
input          TD_CLK27;            //	TV Decoder 27MHz CLK
////////////////////////	GPIO	////////////////////////////////
inout	[35:0]	GPIO_0;					//	GPIO Connection 0
inout	[35:0]	GPIO_1;					//	GPIO Connection 1

//////////////////////////////////////// the real deal ///////////////////////////////////////I/////////
/*
    assignment: all of inter-modular wires are declared with this format:    signal-name"_"src-of-signal"_"dest-of-signal
                 
*/
////////////////////////////////////////////////////////////////////////////////////////////////////////
	

//////////to select desired clock : 50MHZ or switch clock
wire myClock;
assign myClock = (SW[2]==0)?SW[1]:CLOCK_50;
/////////////////////////////////////////	
	
	/////////////////////////    IF STAGE//////////////////////////////
	//outputs:
		wire[31:0] PC_if_ifReg,inst_if_ifReg;
	////
	//special inputs:
	 wire Br_taken_EXE_IFandIFReg;
	 wire[31:0] Br_addr_EXE_IF;
	 wire hazard_HD_IFandIFRegAndID;//-----this signal is drived from HD and is used in IF,ID,IFReg

	IF_Stage if_stage (.clk(myClock),
								.rst(SW[0]),
								.Br_taken(Br_taken_EXE_IFandIFReg),
								.Br_addr(Br_addr_EXE_IF),
								.PCp4(PC_if_ifReg),
								.instruction(inst_if_ifReg),
								.freeze(hazard_HD_IFandIFRegAndID)
	);
	//////////////////////////////////////////////////////////////////
	
	
	///////////////////////////    IF->REGISTER->ID////////////////////////
	//outputs:
	wire[31:0] PC_IFReg_IDReg,inst_IFReg_ID;
	//special input:
	   wire flush_EXE_IFRegandIDReg;
	   assign flush_EXE_IFRegandIDReg=Br_taken_EXE_IFandIFReg;
	////
	////////////////////////////////
	IF_Stage_reg IF_ID_stage_reg(.clk(myClock),
										.rst(SW[0]),
										.flush(flush_EXE_IFRegandIDReg),
										.PC_in(PC_if_ifReg),
										.Instruction_in(inst_if_ifReg),
										.Instruction(inst_IFReg_ID),
										.PC(PC_IFReg_IDReg),
										.freeze(hazard_HD_IFandIFRegAndID)
										);
/////////////////////////////////////////////////////////////////////////

//////////////////////////////////   ID STAGE ///////////////////////////
//outputs:
  wire [4:0] src1_ID_RF, src2_ID_RF, dst_ID_IDReg;
	wire [31:0] Reg2_ID_IDReg, Val2_ID_IDReg, Val1_ID_IDReg;// notice:  Val2 is multiplexed value 
	                             // of Reg2 and sign extended immediate 
	wire [1:0] Br_type_ID_IDReg;
	wire [3:0] exe_cmd_ID_IDReg;
	wire mem_r_en_ID_IDReg, mem_w_en_ID_IDReg, wb_en_ID_IDReg;
	wire isRegWriterAndImmediate_ID_HD;
	wire[4:0] hazardSrc2_ID_IDReg;
/////
//special inputs:
  wire[31:0] Reg1_RF_ID,Reg2_RF_ID;
  //wire hazard_HD_IFandIFRegAndID; ----this signal is declared above at IF
//////
/////
// notice:  Reg2 is multiplexed value of Val2 and sign extended immediate 
	ID_Stage id_stage (.clk(myClock),
								.rst(SW[0]),
								.Instruction(inst_IFReg_ID),
								.reg1(Reg1_RF_ID), 
								.reg2(Reg2_RF_ID),
	              .src1(src1_ID_RF),
	              .src2(src2_ID_RF),
				  .hazardSrc2(hazardSrc2_ID_IDReg),
	              .dst(dst_ID_IDReg),
                .Reg2(Reg2_ID_IDReg),
                .Val2(Val2_ID_IDReg),
                .Val1(Val1_ID_IDReg),
                .finalBr_type(Br_type_ID_IDReg),
                .exe_cmd(exe_cmd_ID_IDReg),
	              .finalMem_r_en(mem_r_en_ID_IDReg),
	              .finalMem_w_en(mem_w_en_ID_IDReg),
	              .finalWb_en(wb_en_ID_IDReg),
	              .freeze(hazard_HD_IFandIFRegAndID),
	              .isRegWriterAndImmediate(isRegWriterAndImmediate_ID_HD)
);
////////////// Register file near ID
//outputs:
  	//wire[31:0] Reg1_RF_ID;------------because these wires is used in ID ,syntactically
  	//wire[31:0] Reg2_RF_ID;------------it should be declared there
////
////special input :
  wire wb_en_WB_RF;
  wire[31:0] valueToWrite_WB_RF;
  wire[4:0] writeDest_WB_RF;
////
Register_file r_f(.clk(myClock),
							.rst(SW[0]),
							.wr_en(wb_en_WB_RF),
							.valueToWrite(valueToWrite_WB_RF),
							.readSrc1(src1_ID_RF),
							.readSrc2(src2_ID_RF),
							.writeDest(writeDest_WB_RF),
							.readVal1(Reg1_RF_ID),
							.readVal2(Reg2_RF_ID)
							);
//////////////////////////////////////////////////////////////////////////


///////////////////////////////      ID -> REGISTER -> EXE ///////////////
//outputs:
	wire[4:0] dst_IDReg_EXEReg;
	wire[31:0] reg2_IDReg_EXEandEXEReg, val2_IDReg_EXE, val1_IDReg_EXE, PC_IDReg_EXEandEXEReg;
	wire[1:0] Br_type_IDReg_EXE;
	wire[3:0] exe_cmd_IDReg_EXE;
	wire mem_r_en_IDReg_EXEReg, mem_w_en_IDReg_EXEReg, wb_en_IDReg_EXEReg;
	wire[4:0] src1_IDReg_FU,src2_IDReg_FU;
////
//special input:
  //wire flush_EXE_IFRegandIDReg;---------this wire has already been declared in IFReg
  //                             ---------because  is used there
  wire[4:0] src1_ID_RFandIDReg=src1_ID_RF;
  //wire hazardSrc2_ID_IDReg;
 ///
ID_Stage_reg  ID_EXE_stage_reg(
   .clk(myClock),
   .rst(SW[0]),
   .flush(flush_EXE_IFRegandIDReg),
	 .dst_in(dst_ID_IDReg),
	 .reg2_in(Reg2_ID_IDReg), 
	 .val2_in(Val2_ID_IDReg), 
	 .val1_in(Val1_ID_IDReg), 
	 .PC_in(PC_IFReg_IDReg),
	 .Br_type_in(Br_type_ID_IDReg),
	 .exe_cmd_in(exe_cmd_ID_IDReg),
	 .mem_r_en_in(mem_r_en_ID_IDReg), 
	 .mem_w_en_in(mem_w_en_ID_IDReg),
	 .wb_en_in(wb_en_ID_IDReg),
	 .src1_in(src1_ID_RFandIDReg),
	 .src2_in(),
	 .dst(dst_IDReg_EXEReg),
	 .reg2(reg2_IDReg_EXEandEXEReg),
	 .val2(val2_IDReg_EXE),
	 .val1(val1_IDReg_EXE),
	 .PC_out(PC_IDReg_EXEandEXEReg),
	 .Br_type(Br_type_IDReg_EXE),
	 .exe_cmd(exe_cmd_IDReg_EXE),
	 .mem_r_en(mem_r_en_IDReg_EXEReg), 
	 .mem_w_en(mem_w_en_IDReg_EXEReg),
	 .wb_en(wb_en_IDReg_EXEReg),
	 .src1(src1_IDReg_FU),
	 .src2(src2_IDReg_FU)
);
///////////////////////////////////////////////////////////////////////


//////////////////////////////  EXE Stage //////////////////////////
//outputs:
  wire[31:0] alu_result_EXE_EXEReg;
  //wire[31:0] Br_addr_EXE_IF;     ------------because this wire is used in IF ,syntactically
  //                               ------------it should be declared there
  //wire Br_taken_EXE_IFandIFReg;  ------------because this wire is used in IF and IFReg, syntactically
  //                               ------------it should be declared there
//special inputs:
	wire[1:0] val1Forward_FU_EXE,val2Forward_FU_EXE,src2ValForward_FU_EXE;
	wire[31:0] alu_result_EXEReg_MEMandMEMReg;///because syntax rules it's declared here
	wire[31:0] alu_result_EXEReg_MEMandMEMRegAndEXE=alu_result_EXEReg_MEMandMEMReg;
	wire[31:0] valueToWrite_WB_RFandEXE=valueToWrite_WB_RF;
/////////	
//
EXE_Stage exe(
	.clk(myClock),
	.exe_cmd(exe_cmd_IDReg_EXE),
	.val1(val1_IDReg_EXE),
	.val2(val2_IDReg_EXE), 
	.val_src2(reg2_IDReg_EXEandEXEReg), 
	.PC(PC_IDReg_EXEandEXEReg),
	.Br_type(Br_type_IDReg_EXE),
	.alu_result(alu_result_EXE_EXEReg),
	.Br_addr(Br_addr_EXE_IF),
	.Br_taken(Br_taken_EXE_IFandIFReg),
	.exeStVal(alu_result_EXEReg_MEMandMEMRegAndEXE),
	.memStVal(valueToWrite_WB_RFandEXE),
	.val1Forward(val1Forward_FU_EXE),
	.val2Forward(val2Forward_FU_EXE),
	.src2_valForward(src2ValForward_FU_EXE)
);
////////////////////////////////////////////////////////////////////



//////////////////////////////   EXE -> REGISTER -> MEM //////////////////
//outputs:
  wire[31:0] PC_EXEReg_WBReg,reg2_EXEReg_MEM;
  wire wb_en_EXEReg_MEMReg, mem_r_en_EXEReg_MEMandMEMReg, mem_w_en_EXEReg_MEM;
  wire[4:0] dst_EXEReg_MEMReg;
  //wire[31:0] alu_result_EXEReg_MEMandMEMReg;  ----because it's used in exe so it's declared there.
/////////
EXE_Stage_reg exe_reg(
	.clk(myClock),
	.rst(SW[0]),
	.wb_en_in(wb_en_IDReg_EXEReg), 
	.mem_r_en_in(mem_r_en_IDReg_EXEReg), 
	.mem_w_en_in(mem_w_en_IDReg_EXEReg),
	.dst_in(dst_IDReg_EXEReg),
	.PC_in(PC_IDReg_EXEandEXEReg), 
	.alu_result_in(alu_result_EXE_EXEReg), 
	.st_val_in(reg2_IDReg_EXEandEXEReg), 
	.wb_en(wb_en_EXEReg_MEMReg), 
	.mem_r_en(mem_r_en_EXEReg_MEMandMEMReg),
	.mem_w_en(mem_w_en_EXEReg_MEM),
	.PC(PC_EXEReg_WBReg), 
	.alu_result(alu_result_EXEReg_MEMandMEMReg), 
	.st_val(reg2_EXEReg_MEM),
	.dst(dst_EXEReg_MEMReg)
);
//////////////////////////////////////


	
//////////////////////////////  MEM Stage //////////////////////////
//outputs:
  wire[31:0] memReadVal_MEM_MEMReg;
//

MEM_Stage mem(
	.clk(myClock), 
	.rst(SW[0]),
	.mem_r_en_in(mem_r_en_EXEReg_MEMandMEMReg), 
	.mem_w_en_in(mem_w_en_EXEReg_MEM),
	.alu_result_in(alu_result_EXEReg_MEMandMEMReg), 
	.st_val(reg2_EXEReg_MEM),
	.mem_read_value(memReadVal_MEM_MEMReg)
);	
///////////////////////////////////////////////////////////////////
	

//////////////////////////////   MEM -> REGISTER -> WB //////////////////
//outputs:
  wire wb_en_MEMReg_WB,mem_r_en_MEMReg_WB;
  wire[31:0] alu_result_MEMReg_WB,memReadValue_MEMReg_WB;
  wire[4:0] dst_MEMReg_WB; 
//

MEM_Stage_reg mem_reg(
	.clk(myClock), 
	.rst(SW[0]), 
	.wb_en_in(wb_en_EXEReg_MEMReg), 
	.mem_r_en_in(mem_r_en_EXEReg_MEMandMEMReg),
	.alu_result_in(alu_result_EXEReg_MEMandMEMReg), 
	.mem_read_value_in(memReadVal_MEM_MEMReg),
	.dst_in(dst_EXEReg_MEMReg),
	.wb_en(wb_en_MEMReg_WB), 
	.mem_r_en(mem_r_en_MEMReg_WB),
	.alu_result(alu_result_MEMReg_WB), 
	.mem_read_value(memReadValue_MEMReg_WB),
	.dst(dst_MEMReg_WB)
);
///////////////////////////////////////////////////////////////////////

///////////////////////////////  Hazard Detector//////////////////////
//outputs:
  //wire hazard_HD_IFandIFRegAndID;    ----------because these wires are used in IF,IFReg and ID ,syntactically
  //                                   ----------it should be declared there
//special inputs:
  wire wb_en_IDReg_EXERegAndHD=wb_en_IDReg_EXEReg;
  wire wb_en_EXEReg_MEMRegAndHD=wb_en_EXEReg_MEMReg;
  wire[4:0] dst_IDReg_EXERegAndHD=dst_IDReg_EXEReg;
  wire[4:0] dst_EXEReg_MEMRegAndHD=dst_EXEReg_MEMReg;
  wire[4:0] src1_ID_RFandHD=src1_ID_RF;
  wire[4:0] src2_ID_RFandHD=src2_ID_RF;
  wire forwardingEn=SW[3];
  wire mem_r_en_IDReg_EXERegAndHD=mem_r_en_IDReg_EXEReg;
  //wire isRegWriterAndImmediate_ID_HD; -----this wire is declared at ID
//  
  hazardDetector HD(.src1(src1_ID_RFandHD),
                    .src2(src2_ID_RFandHD),
                    .exeDst(dst_IDReg_EXERegAndHD),
                    .memDst(dst_EXEReg_MEMRegAndHD),
                    .isRegWriterAndImmediate(isRegWriterAndImmediate_ID_HD),
                    .MEMwb_en(wb_en_EXEReg_MEMRegAndHD),
                    .EXEwb_en(wb_en_IDReg_EXERegAndHD),
                    .hazard(hazard_HD_IFandIFRegAndID),
					.fwEn(forwardingEn),
					.IDRegMemReadEn(mem_r_en_IDReg_EXERegAndHD)
  );  
/////////////////////////////////////////////////////////////////////


//////////////////////////////  WB Stage //////////////////////////
//outputs:
  //wire wb_en_WB_RF;            ------------because these wires are used in RF ,syntactically
  //wire[31:0] valueToWrite_WB_RF------------it should be declared there
  //wire[4:0] writeDest_WB_RF    ------------
//
WB_Stage wb(
	.clk(myClock), 
	.wb_en_in(wb_en_MEMReg_WB), 
	.mem_r_en(mem_r_en_MEMReg_WB),
	.alu_result(alu_result_MEMReg_WB),
	.mem_r_value(memReadValue_MEMReg_WB),
	.dst_in(dst_MEMReg_WB),
	.wb_en(wb_en_WB_RF), 
	.write_value(valueToWrite_WB_RF),
	.dst(writeDest_WB_RF)
);
///////////////////////////////////////////////////////////////////

////////////////////////////  FORWARDING UNIT   //////////////////
//outputs:
	//wire[1:0] val1Forward_FU_EXE,val2Forward_FU_EXE,src2ValForward_FU_EXE;
//
///special inputs:
	wire wb_en_MEMReg_WBandFU=wb_en_MEMReg_WB;
	wire[4:0] dst_MEMReg_WBandFU=dst_MEMReg_WB;
	wire wb_en_EXEReg_MEMRegAndFU=wb_en_EXEReg_MEMReg;
	wire[4:0] dst_EXEReg_MEMRegAndFU=dst_EXEReg_MEMReg;
	wire[4:0] StAndBneSrc2_IDReg_FU=dst_IDReg_EXEReg;
	//wire[4:0] src1_IDReg_FU,src2_IDReg_FU    ----these are declared at IDReg
/////////
	ForwardingUnit fu(
		.forwardEn(forwardingEn),
		.exeWbEn(wb_en_EXEReg_MEMRegAndFU),
		.memWbEn(wb_en_MEMReg_WBandFU),
		.exeRegDst(dst_EXEReg_MEMRegAndFU),
		.memRegDst(dst_MEMReg_WBandFU),
		.stAndBneSrc(StAndBneSrc2_IDReg_FU),
		.src1(src1_IDReg_FU),
		.src2(src2_IDReg_FU),
		.val1Forward(val1Forward_FU_EXE),
		.val2Forward(val2Forward_FU_EXE),
		.src2_valForward(src2ValForward_FU_EXE)
	);
//////////////////////////////////////////////////////////////////
inout	 [15:0]	SRAM_DQ;				//	SRAM Data bus 16 Bits
output [17:0]	SRAM_ADDR;				//	SRAM Address bus 18 Bits
output			SRAM_UB_N;				//	SRAM High-byte Data Mask 
output			SRAM_LB_N;				//	SRAM Low-byte Data Mask 
output			SRAM_WE_N;				//	SRAM Write Enable
output			SRAM_CE_N;				//	SRAM Chip Enable
output			SRAM_OE_N;				//	SRAM Output Enable


endmodule
