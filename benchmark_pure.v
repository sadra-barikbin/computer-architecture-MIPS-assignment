1.	32'b100000_00000_00001_00000_11000001010;//-- Addi	r0   ,r1 	 ,1546
2.	32'b000001_00000_00001_00010_00000000000;//-- Add 	r0   ,r1     ,r2 
3.	32'b000011_00000_00001_00011_00000000000;//-- sub	r0   ,r1     ,r3 
4.	32'b000101_00010_00011_00100_00000000000;//-- And	r2   ,r3     ,r4 
5.	32'b100001_00011_00101_00000_01000110100;//-- Subi	r3   ,r5	   ,564     
6.	32'b000110_00011_00100_00101_00000000000;//-- or	r3   ,r4     ,r5 
7.	32'b000111_00101_00000_00110_00000000000;//-- nor 	r5   ,r0     ,r6 
8.	32'b000111_00100_00000_01011_00000000000;//-- nor 	r4   ,r0     ,r11
9.	32'b000011_00101_00101_00101_00000000000;//-- sub	r5   ,r5     ,r5 
10.	32'b100000_00000_00001_00000_10000000000;//-- Addi 	r0   ,r1     ,1024    
11.	32'b100101_00001_00010_00000_00000000000;//-- st	r1   ,r2     ,0       
12.	32'b100100_00001_00101_00000_00000000000;//-- ld	r1   ,r5     ,0      
13.	32'b101000_01001_00000_00000_00000000001;//-- Bez	r5   , 1           
14.	32'b001000_00101_00001_00111_00000000000;//-- xor	r5   ,r1     ,r7 
15.	32'b001000_00101_00001_00000_00000000000;//-- xor	r5   ,r1     ,r0 
16.	32'b001001_00011_01011_00111_00000000000;//-- sla	r3   ,r11    ,r7 
17.	32'b001010_00011_01011_01000_00000000000;//-- sll	r3   ,r11    ,r8 
18.	32'b001011_00011_00100_01001_00000000000;//-- sra	r3   ,r4     ,r9 
19.	32'b001100_00011_00100_01010_00000000000;//-- srl	r3   ,r4     ,r10
20.	32'b100101_00001_00011_00000_00000000100;//-- st	r1   ,r3     ,4       
21.	32'b100101_00001_00100_00000_00000001000;//-- st	r1   ,r4     ,8       
22.	32'b100101_00001_00101_00000_00000001100;//-- st	r1   ,r5     ,12      
23.	32'b100101_00001_00110_00000_00000010000;//-- st	r1   ,r6     ,16      
24.	32'b100100_00001_01011_00000_00000000100;//-- ld	r1   ,r11    ,4      
25.	32'b100101_00001_00111_00000_00000010100;//-- st	r1   ,r7     ,20     
26.	32'b100101_00001_01000_00000_00000011000;//-- st	r1   ,r8     ,24     
27.	32'b100101_00001_01001_00000_00000011100;//-- st	r1   ,r9     ,28     
28.	32'b100101_00001_01010_00000_00000100000;//-- st	r1   ,r10    ,32     
29.	32'b100101_00001_01011_00000_00000100100;//-- st	r1   ,r11    ,36     
30.	32'b100000_00000_00001_00000_00000000011;//-- Addi 	r0   ,r1     ,3      
31.	32'b100000_00000_00100_00000_10000000000;//-- Addi	r0   ,r4     ,1024   
32.	32'b100000_00000_00010_00000_00000000000;//-- Addi 	r0   ,r2     ,0      
33.	32'b100000_00000_00011_00000_00000000001;//-- Addi 	r0   ,r3     ,1      
34.	32'b100000_00000_01001_00000_00000000010;//-- Addi 	r0   ,r9     ,2      
35.	32'b001010_00011_01001_01000_00000000000;//-- sll	r3   ,r9     ,r8 
36.	32'b000001_00100_01000_01000_00000000000;//-- Add 	r4   ,r8     ,r8 
37.	32'b100100_01000_00101_00000_00000000000;//-- ld	r8   ,r5     ,0       
38.	32'b100100_01000_00110_11111_11111111100;//-- ld	r8   ,r6     ,-4      
39.	32'b000011_00101_00110_01001_00000000000;//-- sub 	r5   ,r6     ,r9 
40.	32'b100000_00000_01010_10000_00000000000;//-- Addi 	r0   ,r10    ,0x8000 
41.	32'b100000_00000_01011_00000_00000010000;//-- Addi	r0   ,r11    ,16     
42.	32'b001010_01010_01011_01010_00000000000;//-- sll	r10  ,r11    ,r10
43.	32'b000101_01001_01010_01001_00000000000;//-- And 	r9   ,r10    ,r9 
44.	32'b101000_01001_00000_00000_00000000010;//-- Bez	r9   ,2           
45.	32'b100101_01000_00101_11111_11111111100;//-- st	r8   ,r5     ,-4     
46.	32'b100101_01000_00110_00000_00000000000;//-- st	r8   ,r6     ,0      
47.	32'b100000_00011_00011_00000_00000000001;//-- Addi 	r3   ,r3     ,1      
48.	32'b101001_00001_00011_11111_11111110001;//-- BNE	r1   ,r3     ,-15    
49.	32'b100000_00010_00010_00000_00000000001;//-- Addi 	r2   ,r2     ,1      
50.	32'b101001_00001_00010_11111_11111101110;//-- BNE	r1   ,r2     ,-18    
51.	32'b100000_00000_00001_00000_10000000000;//-- Addi 	r0   ,r1     ,1024   
52.	32'b100100_00001_00010_00000_00000000000;//-- ld	r1   ,r2     ,0      
53.	32'b100100_00001_00011_00000_00000000100;//-- ld	r1   ,r3     ,4      
54.	32'b100100_00001_00100_00000_00000001000;//-- ld	r1   ,r4     ,8      
55.	32'b100100_00001_00101_00000_00000001100;//-- ld	r1   ,r5     ,12     
56.	32'b100100_00001_00110_00000_00000010000;//-- ld	r1   ,r6     ,16     
57.	32'b100100_00001_00111_00000_00000010100;//-- ld	r1   ,r7     ,20     
58.	32'b100100_00001_01000_00000_00000011000;//-- ld	r1   ,r8     ,24     
59.	32'b100100_00001_01001_00000_00000011100;//-- ld	r1   ,r9     ,28     
60.	32'b100100_00001_01010_00000_00000100000;//-- ld	r1   ,r10    ,32     
61.	32'b100100_00001_01011_00000_00000100100;//-- ld	r1   ,r11    ,36     
62.	32'b101010_00000_00000_11111_11111111111;//-- JMP 	-1
