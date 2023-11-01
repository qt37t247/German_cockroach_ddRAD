# Scripts and input files for German cockroaches' spread route reconstruction 

For the spread route reconstruction, we adopted stepwise strategy, in which results of previous stage were used as prior in the next stage. 

The entire reconstruction comprises four stages of initial simulation and a final stage of parameter estimation/parameteric bootstrapping.

Based on the sample composition in the simulation, each stage may contain one to four panels. Each panel include one to six scenarios. Different scenarios describe different orders of demographic events.

Sample composition of panels used for demographic modelling (“O” means the individuals in the sampling site were included in the observed site frequency spectrum, whereas “×” means only demographic parameters were used to represent the individuals in the sampling site.):

| Panel | PRE | IRA | CHN | ETP | UKR | COH | NDL | WST | EST | WLD |
|--- | --- | --- | --- |--- |--- |--- |--- |--- |--- |--- |
|  | Stage I | Stage II | Stage II | Stage III | Stage III | Stage III | Stage III | Stage IV | Final | Final |
| Addis Ababa, Ethiopia |  |  |  | O |  |  |  |  |  | O |
| Bandung, Indonesia | O | O | O | O | O | O | O |  | × | O |  | × |
| Biljmer, Netherlands |  |  |  |  |  |  | O | O |  | O |
| Busan, Korea | O | O | O | O | O | O | O |  | × | O |  | × |
| Chongqing, China |  |  | O |  |  |  |  |  | O |  | × |
| Crimea, Ukraine |  |  |  |  | O |  |  | O |  | O |
| Raleigh, USA |  |  |  |  |  | O |  | O |  | O |
| Tehran, Iran |  | O |  | O | O | O | O | O | O | O |
| Vijaywasa, India | O | O | O | O | O | O | O |  | × | O | O | 


## Initial simulations of 50 runs

Simulations are run on the scenario-bases (a folder per scenario). Three input files (.tpl, .est, and .obs) are require for each scenario.

xxx.tpl (i.e. template file for the tested scenario named "xxx")
xxx.est (i.e. a file where the distributions of the parameters described in the .tpl are fully specified)
xxx_MSFS.obs (i.e. the multi-SFS of populations included in the scenario named "xxx")

Following is the command to run initial simulations (for batch submission to HPC, please refer to "Initial_simulations_50.sh"):

```
fsc -c 12 -t xxx.tpl -n500000 -m -e xxx.est -M -L50 -q -0 --multiSFS --foldedSFS
```

After the simulations, perform "bestrun.sh" to extract the best run for each demographic model into a new folder named "bestrun".


## Parametric bootstrapping 

For the panels (EST and WLD) in the final stage, modify the "xxx_maxL.par" in the subfolder "bestrun" of the folder of the best demographic model.

xxx_maxL.par (i.e. the .par file where the estimated parameters have been replaced by their ML values for the scenario named "xxx")

Modify the "xxx_maxL.par" to create "xxx_boot.par" by replacing "FREQ" with "DNA" for data type and corresponding change in the number of loci to simulate.

Use the "xxx_boot.par" as input to simulate 100 SFS with the command:

```
fsc -c 12 -i xxx_boot.par -n100 -j -m -s0 -x –I -q --foldedSFS
```

This will create 100 folders. For each folder, run the parameter estimate with "Bootstrapping_simulations.sh" and then "CI.R" to get confidence intervals for the estimated demographic parameters.

