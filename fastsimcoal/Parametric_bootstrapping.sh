#!/bin/bash
#$ -cwd
#PBS -l select=1:ncpus=12:mpiprocs=12:mem=45GB
#PBS -l walltime=720:00:00
#PBS -j oe
#PBS -q parallel12
#chmod +x ./fsc2702

cd /hpctmp/dbstq/BG/FSC/xxx/bestrun/xxx_boot/
for i in {76..100}
do
cd xxx_boot_$i
cp ../../fsc2702 fsc2702
cp ../../xxx.tpl xxx_boot.tpl
cp ../../xxx_boot.est xxx_boot.est
./fsc2702 -c 12 -t xxx_boot.tpl -n 500000 -m -e xxx_boot.est -M -L 50 -q --foldedSFS
cd ..
done