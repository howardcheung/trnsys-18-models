# Type 2910 Model

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
A successful run of the .tpf file should give you the following values in the .out file at the last time step in each column:
* TIME: does not matter
* Cooling: -1.2737342799999998E+00
* Sensible: +4.2761596800000019E+00
* CoolingPower: -7.6630874500000008E+00
* CoolingHeatRejection: -8.9368217300000001E+00
* Heating: -5.1265015000000007E+00
* HeatingPower: -7.7323524900000029E+00
* HeatingHeatAbsorption: +2.6058509900000022E+00

# References
* Tang, C. C. (2005, May 1). Modeling Packaged Heat Pumps in a Quasi-steady State Energy Simulation Program (Master Dissertation). Oklahoma State University, Stillwater, OK. Retrieved from https://shareok.org/handle/11244/10075

