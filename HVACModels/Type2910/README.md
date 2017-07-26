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
* Cooling: +9.6666757773198460E+03
* Sensible: +4.6248980129450765E+03
* CoolingPower: +2.9673426531285359E+03
* CoolingHeatRejection: +1.2634018430448381E+04
* Heating: +1.7142208795307881E+04
* HeatingPower: +4.1158432408244107E+03
* HeatingHeatAbsorption: +1.3026365554483469E+04
* CoolingAirDB: +1.6657908216707987E+01
* CoolingAirWB: +1.5084127228301346E+01 
* CoolingWater: +3.3317846353536694E+01
* HeatingAirDB: +4.1800491274958155E+01
* HeatingAirWB: +2.4835716298542472E+01
* HeatingWater: +2.4548063720272225E+01	

# References
* Tang, C. C. (2005, May 1). Modeling Packaged Heat Pumps in a Quasi-steady State Energy Simulation Program (Master Dissertation). Oklahoma State University, Stillwater, OK. Retrieved from https://shareok.org/handle/11244/10075

