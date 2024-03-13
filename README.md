# Scripts used for the ddRADSeq data of the German cockroaches

Manuscript title: Global spread of the German cockroach.

Additional information:


## Step 1. Bioinformatic pipeline and variant calling (SNPs.txt)

Programs used: 

STACKS (process_radtags): https://catchenlab.life.illinois.edu/stacks/comp/process_radtags.php 

BWA (MEM): https://github.com/lh3/bwa

SAMTOOLS: http://www.htslib.org/

STACKS (ref_map.pl): https://catchenlab.life.illinois.edu/stacks/comp/ref_map.php 

PLINK: https://www.cog-genomics.org/plink/


## Step 2. Genetic divergence with principal component analysis (PCA.R)

Package used: 

SNPRelate: https://bioconductor.org/packages/release/bioc/html/SNPRelate.html

We also calculated inbreeding coefficient (FIS) per sampling site and pairwise fixation index (FST) per pair of sampling sites. 


## Step 3. Maximum likelihood ancestry estimation with ADMIXTURE (adm.sh)

Program used: 

ADMIXTURE: https://dalexander.github.io/admixture/


## Step 4. Nucleotide diversity calculation

Program and packages used:

VCFTools: https://vcftools.sourceforge.net

Nucleotide diversity at each sampling site (assuming site named "XX", sample names are listed in "XX.txt") is calculated with VCFTools:

`vcftools --vcf DATA1L.vcf --keep XX.txt --site-pi --out XX`


## Step 5. Folded site frequency spectrum (SFS) calculation from vcf file

Program used: 

easySFS: https://github.com/isaacovercast/easySFS

To generate multi-dimensional SFS file as the .obs file for the next step. 

`./easySFS.py -i DATA1L.vcf -p pops_file.txt --preview`

`./easySFS.py -i DATA1L.vcf -p pops_file.txt --proj 10,10,10`

"pops_file.txt" contains sample names and population names for the specific panel.

Different scenarios under the same panel share the same .obs file, but need to rename with the scenario name. 


## Step 6. Spread route reconstruction with coalescent simulation

Input files and scripts in the folder "fastsimcoal"

Program used: 

fastsimcoal2: http://cmpg.unibe.ch/software/fastsimcoal27/


## Step 7. Allele-frequency based tree reconstruction with migration

Program used: 

PLINK: https://www.cog-genomics.org/plink/

TREEMIX: https://bitbucket.org/nygcresearch/treemix/wiki/Home

OptM: https://cran.r-project.org/web/packages/OptM/

We performed two batches of TREEMIX runs with different composition of samples.

For batch 1, we used 49 populations for 0 to 24 migration edges, with 10 independant runs for each number of migration edges tested.

For batch 2, we used 18 populations for 0 to 19 migration edges, with 10 independant runs for each number of migration edges tested.

Please see input files adn scripts in the folder "TreeMix_BG". The analyses were parallelized jobs for qsub scheduler in Aspire2a NSCC. 

