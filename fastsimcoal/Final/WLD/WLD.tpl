//Parameters for the coalescence simulation program : simcoal.exe
9 samples to simulate :
//Population effective sizes (number of genes)
NBD
NBL
2811
15811
NCW
NIR
19396
NUK
NVW
//Samples sizes
10
10
0
0
10
10
0
10
10
//Growth rates: negative growth implies population expansion
0
0
0
0
0
0
0
0
0
//Number of migration matrices : 0 implies no migration between demes
0
//historical event: time, source, sink, migrants, new deme size, growth rate, migr mat index
8 historical event
1321  2 3 1 52311  0 0 absoluteResize
2519  3 6 1 513023 0 0 absoluteResize
TDIV1 7 5 1 NANC1  0 0 absoluteResize
TDIV2 4 1 1 NANC2  0 0 absoluteResize
TDIV3 1 5 1 NANC3  0 0 absoluteResize
TDIV4 0 8 1 NANC4  0 0 absoluteResize
TDIV5 5 8 1 NANC5  0 0 absoluteResize
9242  8 6 1 NANC6  0 0 absoluteResize
//Number of independent loci [chromosome] 
1 0
//Per chromosome: Number of contiguous linkage Block: a block is a set of contiguous loci
1
//per Block:data type, number of loci, per gen recomb and mut rates
FREQ 1 0 2.8e-9 OUTEXP
