//Parameters for the coalescence simulation program : simcoal.exe
7 samples to simulate :
//Population effective sizes (number of genes)
NBL
710
NCW
NIR
3093
NUK
8632
//Samples sizes
10
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
//Number of migration matrices : 0 implies no migration between demes
0
//historical event: time, source, sink, migrants, new deme size, growth rate, migr mat index
6 historical event
349   1 4 1 952607 0 0 absoluteResize
TDIV1 0 5 1 NANC1  0 0 absoluteResize
TDIV2 3 2 1 NANC2  0 0 absoluteResize
TDIV3 2 5 1 NANC3  0 0 absoluteResize
3842  5 6 1 NANC4  0 0 absoluteResize
6743  6 4 1 NANC5  0 0 absoluteResize
//Number of independent loci [chromosome] 
1 0
//Per chromosome: Number of contiguous linkage Block: a block is a set of contiguous loci
1
//per Block:data type, number of loci, per gen recomb and mut rates
FREQ 1 0 2.8e-9 OUTEXP
