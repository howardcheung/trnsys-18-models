# Type 2901 Model

This directory contains files used to use the computing equipment model in Fang et al. (2017) to estimate the computing equipment power consumption based on utilization rate and percentage of active servers in TRNSYS 18.

# Important files
* .bmp: Icon file for the model in Simulation Studio in TRNSYS 18
* .dck: Input simulation file to TRNEXE in TRNSYS 18 to run the test project
* .f90: Fortran script file for the model
* .out: Result of the test project file
* .tmf: File for description of the model in Simulation Studio in TRNSYS 18
* .tpf: TRNSYS 18 Simulation Studio Project file for testing the correctness of the model
* .tsw: TRNSYS 18 TypeStudio workspace file to compile the *.f90 files used in the model into a .dll file for simulation use

# Correct test result
The value of the simulation result in the *Type2901_DataCenterModel_TestProject.out* file from running *Type2901_DataCenterModel_TestProject.tpf* should be around 894,936.

# References
* Fang, Q., Wang, J., Gong, Q., & Song, M. (2017). Thermal-aware Energy Management of HPC Data Center Via Two-time-scale Control. IEEE Transactions on Industrial Informatics, (99), 1–1. https://doi.org/10.1109/TII.2017.2698603

