#!/bin/bash
#PBS -N BG_treemix_x
#PBS -l select=1:ncpus=20:mem=180G:mpiprocs=20:ompthreads=20
#PBS -l walltime=24:00:00
#PBS -j oe
#PBS -o out-run.txt
#PBS -q normal

module load miniforge3

cd /scratch/users/nus/dbstq/BG_treemix/

#################### Input data preparation, skip as input file included in this repository ###############

#conda activate pixy

#plink --file populations.plink --allow-extra-chr --allow-no-sex --keep keep.txt --out keep --recode vcf

#plink --vcf keep.vcf --allow-extra-chr --allow-no-sex --geno 0.2 --out g2 --recode vcf

#plink --vcf g2.vcf --allow-extra-chr --allow-no-sex --indep-pairwise 50 10 0.1

#plink --vcf g2.vcf --extract plink.prune.in --allow-extra-chr --allow-no-sex --out g2L --recode vcf

#plink --vcf g2L.vcf --allow-extra-chr --allow-no-sex --freq --within clst.txt

#gzip plink.frq.strat

#conda deactivate

#conda activate py27

#cd /scratch/users/nus/dbstq/BG_treemix/

#python plink2treemix.py plink.frq.strat.gz BG.treemix.frq.gz

#conda deactivate

##############################################################################################################

conda activate treemix

mkdir results

m_values=$(seq 0 24)  # Modify the range for 'm' as needed

# Define a function to run treemix for a specific 'm' value and 'i' value
run_treemix() {
    m=$1
    i=$2
    s=$RANDOM
    treemix -i BG.treemix.frq.gz -o results/BG.${i}.${m} -global -m ${m} -k 500 -seed ${s}
}

export -f run_treemix

# Use GNU Parallel to run the for loop in parallel
parallel -j 20 run_treemix ::: $m_values ::: {1..10}

tar -zcvf resultx.tar.gz resultx

conda deactivate