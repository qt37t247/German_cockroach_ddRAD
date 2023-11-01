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


## Step 3. Maximum likelihood ancestry estimation with ADMIXTURE (adm.sh)

Program used: 

ADMIXTURE: https://dalexander.github.io/admixture/


## Step 4. Regression between nucleotide diversity and number of private alleles (pi_pa.R)

Program and packages used:

VCFTools: https://vcftools.sourceforge.net

PopGenReport: https://cran.r-project.org/web/packages/PopGenReport/index.html

Nucleotide diversity at each sampling site (assuming site named "XX", sample names are listed in "XX.txt") is calculated with VCFTools:

`vcftools --vcf DATA1L.vcf --keep XX.txt --site-pi --out XX`

Number of private alleles at each sampling site is calculated with R package PopGenReport.

Generalized lineage model is used to compute the correlation between nucleotide diversity and number of private alleles.


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
