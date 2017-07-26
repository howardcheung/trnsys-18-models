# Type 2901 Model

This directory contains files used to use the water-to-air single speed heat pump model in Tang (2014) to estimate its power consumption under both heaitng and cooling operation in TRNSYS 18.
It is also the [Coil:Cooling:WaterToAirHeatPump:EquationFit](http://bigladdersoftware.com/epx/docs/8-7/input-output-reference/group-heating-and-cooling-coils.html#coilheatingwatertoairheatpumpequationfit) and [Coil:Cooling:WaterToAirHeatPump:EquationFit](http://bigladdersoftware.com/epx/docs/8-7/input-output-reference/group-heating-and-cooling-coils.html#coilcoolingwatertoairheatpumpequationfit) models that are being used in [EnergyPlus](https://energyplus.net/).

# Important files
* .bmp: Icon file for the model in Simulation Studio in TRNSYS 18
* .dck: Input simulation file to TRNEXE in TRNSYS 18 to run the test project
* .f90: Fortran script file for the model
* .out: Result of the test project file
* .tmf: File for description of the model in Simulation Studio in TRNSYS 18
* .tpf: TRNSYS 18 Simulation Studio Project file for testing the correctness of the model
* .tsw: TRNSYS 18 TypeStudio workspace file to compile the *.f90 files used in the model into a .dll file for simulation use

# Correct test result
TBD

# References
* Tang, C. C. (2005, May 1). Modeling Packaged Heat Pumps in a Quasi-steady State Energy Simulation Program (Master Dissertation). Oklahoma State University, Stillwater, OK. Retrieved from https://shareok.org/handle/11244/10075

