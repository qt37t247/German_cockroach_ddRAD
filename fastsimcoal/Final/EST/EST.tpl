//Parameters for the coalescence simulation program : simcoal.exe
5 samples to simulate :
//Population effective sizes (number of genes)
NBS
NCQ
NIR
NPD
NVW
//Samples sizes
10
10
10
10
10
//Growth rates: negative growth implies population expansion
0
0
0
0
0
//Number of migration matrices : 0 implies no migration between demes
0
//historical event: time, source, sink, migrants, new deme size, growth rate, migr mat index
4 historical event
TDIV1 0 1 1 NANC1 0 0 absoluteResize
TDIV2 1 3 1 NANC2 0 0 absoluteResize
TDIV3 2 4 1 NANC3 0 0 absoluteResize
TDIV4 3 4 1 NANC4 0 0 absoluteResize
//Number of independent loci [chromosome] 
1 0
//Per chromosome: Number of contiguous linkage Block: a block is a set of contiguous loci
1
//per Block:data type, number of loci, per gen recomb and mut rates
FREQ 1 0 2.8e-9 OUTEXP
