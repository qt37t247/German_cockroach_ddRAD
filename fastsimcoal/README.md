# Scripts and input files for German cockroaches' spread route reconstruction 

For the spread route reconstruction, we adopted stepwise strategy, in which results of previous stage were used as prior in the next stage. 

The entire reconstruction comprises four stages of demographic model optimization/initial parameter estimation and a final stage of parameter estimation/parameteric bootstrapping.

Sample composition of panels used for demographic modelling (“⃝” means the individuals in the sampling site were included in the observed site frequency spectrum, whereas “×” means only demographic parameters were used to represent the individuals in the sampling site.):

|  | PRE | IRA | CHN | ETP | UKR | COH | NDL | WST | EST | WLD |
|  | Stage I | Stage II | Stage II | Stage III | Stage III | Stage III | Stage III | Stage IV | Final | Final |
| Addis Ababa, Ethiopia |  |  |  | ? |  |  |  |  |  | ? |
| Bandung, Indonesia | ? | ? | ? | ? | ? | ? | ? |  | × | ? |  | × |
| Biljmer, Netherlands |  |  |  |  |  |  | ? | ? |  | ? |
| Busan, Korea | ? | ? | ? | ? | ? | ? | ? |  | × | ? |  | × |
| Chongqing, China |  |  | ? |  |  |  |  |  | ? |  | × |
| Crimea, Ukraine |  |  |  |  | ? |  |  | ? |  | ? |
| Raleigh, USA |  |  |  |  |  | ? |  | ? |  | ? |
| Tehran, Iran |  | ? |  | ? | ? | ? | ? | ? | ? | ? |
| Vijaywasa, India | ? | ? | ? | ? | ? | ? | ? |  | × | ? | ? |

Attempt | #1 | #2 | #3 | #4 | #5 | #6 | #7 | #8 | #9 | #10 | #11
--- | --- | --- | --- |--- |--- |--- |--- |--- |--- |--- |---
Seconds | 301 | 283 | 290 | 286 | 289 | 285 | 287 | 287 | 272 | 276 | 269

## Initial simulations of 50 runs

Each demographic model are provided the files necessary to run the parameters estimate with the command (for batch submission to HPC, please refer to "Initial_simulations_50.sh"):

```
fsc -c 12 -t xxx.tpl -n500000 -m -e xxx.est -M -L50 -q --multiSFS --foldedSFS
```

xxx.tpl (i.e. template file for the tested model xxx)
xxx.est (i.e. a file where the distributions of the parameters described in the .tpl are fully specified)
xxx_jointMAFpopX_Y.obs (i.e. the 2D-SFS of a pair of populations [X and Y] included in the model xxx)

After the simulations, perform "bestrun.sh" to extract the best run for each demographic model into a new folder named "bestrun".

Run "AIC.R" to calculate AIC value for the bestrun of each demographic model. Compare the AIC values among models to determine the best model.

## Parametric bootstrapping 

Once the best demographic model is determined, modify the "xxx_maxL.par" in the subfolder "bestrun" of the folder of the best demographic model.

xxx_maxL.par (i.e. the .par file where the estimated parameters have been replaced by their ML values for the model xxx)

Modify the "xxx_maxL.par" to create "xxx_boot.par" by replacing "FREQ" with "DNA" for data type and corresponding change in the number of loci to simulate.

Use the "xxx_boot.par" as input to simulate 100 SFS with the command (for batch submission to HPC, please refer to "SFS_bootstrapping_100.sh"):

```
fsc -c 12 -i xxx_boot.par -n100 -j -m -s0 -x –I -q --foldedSFS
```

This will create 100 folders. For each folder, run the parameter estimate with "Bootstrapping_simulations.sh" and then "CI.R" to get confidence intervals for the estimated demographic parameters.

