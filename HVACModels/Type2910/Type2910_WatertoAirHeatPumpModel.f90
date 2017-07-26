      Subroutine Type2910

! Object: Water-to-air heat pump
! Simulation Studio Model: Type2910_WatertoAirHeatPumpModel
! 

! Author: Howard Cheung
! Editor: 
! Date:	 July 25, 2017
! last modified: July 25, 2017
! 
! 
! *** 
! *** Model Parameters 
! *** 
!			Rated total cooling capacity	kJ/hr [0;+Inf]
!			Rated sensible cooling capacity	kJ/hr [0;+Inf]
!			Rated cooling power consumption	kJ/hr [0;+Inf]
!			Rated heating capacity	kJ/hr [0;+Inf]
!			Rated heating power consumption	kJ/hr [0;+Inf]
!			Rated air volume flow rate	m^3/hr [0;+Inf]
!			Rated water volume flow rate	m^3/hr [0;+Inf]
!			A1	- [-Inf;+Inf]
!			A2	- [-Inf;+Inf]
!			A3	- [-Inf;+Inf]
!			A4	- [-Inf;+Inf]
!			A5	- [-Inf;+Inf]
!			B1	- [-Inf;+Inf]
!			B2	- [-Inf;+Inf]
!			B3	- [-Inf;+Inf]
!			B4	- [-Inf;+Inf]
!			B5	- [-Inf;+Inf]
!			B6	- [-Inf;+Inf]
!			C1	- [-Inf;+Inf]
!			C2	- [-Inf;+Inf]
!			C3	- [-Inf;+Inf]
!			C4	- [-Inf;+Inf]
!			C5	- [-Inf;+Inf]
!			E1	- [-Inf;+Inf]
!			E2	- [-Inf;+Inf]
!			E3	- [-Inf;+Inf]
!			E4	- [-Inf;+Inf]
!			E5	- [-Inf;+Inf]
!			F1	- [-Inf;+Inf]
!			F2	- [-Inf;+Inf]
!			F3	- [-Inf;+Inf]
!			F4	- [-Inf;+Inf]
!			F5	- [-Inf;+Inf]

! *** 
! *** Model Inputs 
! *** 
!			Entering Water Temperature	C [-Inf;+Inf]
!			Entering air dry-bulb temperature	C [-Inf;+Inf]
!			Entering air wet-bulb temperature	C [-Inf;+Inf]
!			Air volume flow rate	m^3/hr [-Inf;+Inf]
!			Water volumetric flow rate	m^3/hr [-Inf;+Inf]
!			Cooling mode	- [0;1]
!			Heating mode	- [0;1]

! *** 
! *** Model Outputs 
! *** 
!			Total cooling capacity	kJ/hr [0;+Inf]
!			Sensible cooling capacity	kJ/hr [0;+Inf]
!			Cooling power consumption	kJ/hr [0;+Inf]
!			Heat dissipation in cooling mode	kJ/hr [0;+Inf]
!			Total heating capacity	kJ/hr [0;+Inf]
!			Heating mode power consumption	kJ/hr [0;+Inf]
!			Heat absorption in heating mode	kJ/hr [0;+Inf]

! *** 
! *** Model Derivatives 
! *** 

! (Comments and routine interface generated by TRNSYS Simulation Studio)
!************************************************************************

!-----------------------------------------------------------------------------------------------------------------------
! This TRNSYS component skeleton was generated from the TRNSYS studio based on the user-supplied parameters, inputs, 
! outputs, and derivatives.  The user should check the component formulation carefully and add the content to transform
! the parameters, inputs and derivatives into outputs.  Remember, outputs should be the average value over the timestep
! and not the value at the end of the timestep; although in many models these are exactly the same values.  Refer to 
! existing types for examples of using advanced features inside the model (Formats, Labels etc.)
!-----------------------------------------------------------------------------------------------------------------------


      Use TrnsysConstants
      Use TrnsysFunctions

!-----------------------------------------------------------------------------------------------------------------------

!DEC$Attributes DLLexport :: Type2910

!-----------------------------------------------------------------------------------------------------------------------
!Trnsys Declarations
      Implicit None

      Double Precision Timestep,Time
      Integer CurrentUnit,CurrentType


!    PARAMETERS
      DOUBLE PRECISION Rated_total_cooling_capacity
      DOUBLE PRECISION Rated_sensible_cooling_capacity
      DOUBLE PRECISION Rated_cooling_power_consumption
      DOUBLE PRECISION Rated_heating_capacity
      DOUBLE PRECISION Rated_heating_power_consumption
      DOUBLE PRECISION Rated_air_volume_flow_rate
      DOUBLE PRECISION Rated_water_volume_flow_rate
      DOUBLE PRECISION A1
      DOUBLE PRECISION A2
      DOUBLE PRECISION A3
      DOUBLE PRECISION A4
      DOUBLE PRECISION A5
      DOUBLE PRECISION B1
      DOUBLE PRECISION B2
      DOUBLE PRECISION B3
      DOUBLE PRECISION B4
      DOUBLE PRECISION B5
      DOUBLE PRECISION B6
      DOUBLE PRECISION C1
      DOUBLE PRECISION C2
      DOUBLE PRECISION C3
      DOUBLE PRECISION C4
      DOUBLE PRECISION C5
      DOUBLE PRECISION E1
      DOUBLE PRECISION E2
      DOUBLE PRECISION E3
      DOUBLE PRECISION E4
      DOUBLE PRECISION E5
      DOUBLE PRECISION F1
      DOUBLE PRECISION F2
      DOUBLE PRECISION F3
      DOUBLE PRECISION F4
      DOUBLE PRECISION F5

!    INPUTS
      DOUBLE PRECISION Entering_Water_Temperature
      DOUBLE PRECISION Entering_air_dry_bulb_temperature
      DOUBLE PRECISION Entering_air_wet_bulb_temperature
      DOUBLE PRECISION Air_volume_flow_rate
      DOUBLE PRECISION Water_volumetric_flow_rate
      DOUBLE PRECISION Cooling_mode
      DOUBLE PRECISION Heating_mode

!    INTERNAL VARIABLES
      DOUBLE PRECISION Twb_ratio
      DOUBLE PRECISION Tw_ratio
      DOUBLE PRECISION Tdb_ratio
      DOUBLE PRECISION Va_ratio
      DOUBLE PRECISION Vw_ratio
      DOUBLE PRECISION Qc_ratio
      DOUBLE PRECISION Qsc_ratio
      DOUBLE PRECISION Pc_ratio
      DOUBLE PRECISION Qh_ratio
      DOUBLE PRECISION Ph_ratio
      DOUBLE PRECISION Total_cooling_capacity
      DOUBLE PRECISION Sensible_cooling_capacity
      DOUBLE PRECISION Cooling_power_consumption
      DOUBLE PRECISION Total_heating_capacity
      DOUBLE PRECISION Heating_power_consumption

!-----------------------------------------------------------------------------------------------------------------------

!-----------------------------------------------------------------------------------------------------------------------
!Get the Global Trnsys Simulation Variables
      Time=getSimulationTime()
      Timestep=getSimulationTimeStep()
      CurrentUnit = getCurrentUnit()
      CurrentType = getCurrentType()
!-----------------------------------------------------------------------------------------------------------------------

!-----------------------------------------------------------------------------------------------------------------------
!Set the Version Number for This Type
      If(getIsVersionSigningTime()) Then
		Call SetTypeVersion(17)
		Return
      EndIf
!-----------------------------------------------------------------------------------------------------------------------

!-----------------------------------------------------------------------------------------------------------------------
!Do Any Last Call Manipulations Here
      If(getIsLastCallofSimulation()) Then
		Return
      EndIf
!-----------------------------------------------------------------------------------------------------------------------

!-----------------------------------------------------------------------------------------------------------------------
!Perform Any "After Convergence" Manipulations That May Be Required at the End of Each Timestep
      If(getIsEndOfTimestep()) Then
		Return
      EndIf
!-----------------------------------------------------------------------------------------------------------------------

!-----------------------------------------------------------------------------------------------------------------------
!Do All of the "Very First Call of the Simulation Manipulations" Here
      If(getIsFirstCallofSimulation()) Then

		!Tell the TRNSYS Engine How This Type Works
		Call SetNumberofParameters(33)           !The number of parameters that the the model wants
		Call SetNumberofInputs(7)                   !The number of inputs that the the model wants
		Call SetNumberofDerivatives(0)         !The number of derivatives that the the model wants
		Call SetNumberofOutputs(7)                 !The number of outputs that the the model produces
		Call SetIterationMode(1)                             !An indicator for the iteration mode (default=1).  Refer to section 8.4.3.5 of the documentation for more details.
		Call SetNumberStoredVariables(0,0)                   !The number of static variables that the model wants stored in the global storage array and the number of dynamic variables that the model wants stored in the global storage array
		Call SetNumberofDiscreteControls(0)               !The number of discrete control functions set by this model (a value greater than zero requires the user to use Solver 1: Powell's method)

		Return

      EndIf
!-----------------------------------------------------------------------------------------------------------------------

!-----------------------------------------------------------------------------------------------------------------------
!Do All of the First Timestep Manipulations Here - There Are No Iterations at the Intial Time
      If (getIsStartTime()) Then
      Rated_total_cooling_capacity = getParameterValue(1)
      Rated_sensible_cooling_capacity = getParameterValue(2)
      Rated_cooling_power_consumption = getParameterValue(3)
      Rated_heating_capacity = getParameterValue(4)
      Rated_heating_power_consumption = getParameterValue(5)
      Rated_air_volume_flow_rate = getParameterValue(6)
      Rated_water_volume_flow_rate = getParameterValue(7)
      A1 = getParameterValue(8)
      A2 = getParameterValue(9)
      A3 = getParameterValue(10)
      A4 = getParameterValue(11)
      A5 = getParameterValue(12)
      B1 = getParameterValue(13)
      B2 = getParameterValue(14)
      B3 = getParameterValue(15)
      B4 = getParameterValue(16)
      B5 = getParameterValue(17)
      B6 = getParameterValue(18)
      C1 = getParameterValue(19)
      C2 = getParameterValue(20)
      C3 = getParameterValue(21)
      C4 = getParameterValue(22)
      C5 = getParameterValue(23)
      E1 = getParameterValue(24)
      E2 = getParameterValue(25)
      E3 = getParameterValue(26)
      E4 = getParameterValue(27)
      E5 = getParameterValue(28)
      F1 = getParameterValue(29)
      F2 = getParameterValue(30)
      F3 = getParameterValue(31)
      F4 = getParameterValue(32)
      F5 = getParameterValue(33)


      Entering_Water_Temperature = GetInputValue(1)
      Entering_air_dry_bulb_temperature = GetInputValue(2)
      Entering_air_wet_bulb_temperature = GetInputValue(3)
      Air_volume_flow_rate = GetInputValue(4)
      Water_volumetric_flow_rate = GetInputValue(5)
      Cooling_mode = GetInputValue(6)
      Heating_mode = GetInputValue(7)

	
   !Check the Parameters for Problems (#,ErrorType,Text)
   !Sample Code: If( PAR1 <= 0.) Call FoundBadParameter(1,'Fatal','The first parameter provided to this model is not acceptable.')

   !Set the Initial Values of the Outputs (#,Value)
		Call SetOutputValue(1, 0) ! Total cooling capacity
		Call SetOutputValue(2, 0) ! Sensible cooling capacity
		Call SetOutputValue(3, 0) ! Cooling power consumption
		Call SetOutputValue(4, 0) ! Heat dissipation in cooling mode
		Call SetOutputValue(5, 0) ! Total heating capacity
		Call SetOutputValue(6, 0) ! Heating mode power consumption
		Call SetOutputValue(7, 0) ! Heat absorption in heating mode


   !If Needed, Set the Initial Values of the Static Storage Variables (#,Value)
   !Sample Code: SetStaticArrayValue(1,0.d0)

   !If Needed, Set the Initial Values of the Dynamic Storage Variables (#,Value)
   !Sample Code: Call SetDynamicArrayValueThisIteration(1,20.d0)

   !If Needed, Set the Initial Values of the Discrete Controllers (#,Value)
   !Sample Code for Controller 1 Set to Off: Call SetDesiredDiscreteControlState(1,0) 

		Return

      EndIf
!-----------------------------------------------------------------------------------------------------------------------

!-----------------------------------------------------------------------------------------------------------------------
!ReRead the Parameters if Another Unit of This Type Has Been Called Last
      If(getIsReReadParameters()) Then
		!Read in the Values of the Parameters from the Input File
      Rated_total_cooling_capacity = getParameterValue(1)
      Rated_sensible_cooling_capacity = getParameterValue(2)
      Rated_cooling_power_consumption = getParameterValue(3)
      Rated_heating_capacity = getParameterValue(4)
      Rated_heating_power_consumption = getParameterValue(5)
      Rated_air_volume_flow_rate = getParameterValue(6)
      Rated_water_volume_flow_rate = getParameterValue(7)
      A1 = getParameterValue(8)
      A2 = getParameterValue(9)
      A3 = getParameterValue(10)
      A4 = getParameterValue(11)
      A5 = getParameterValue(12)
      B1 = getParameterValue(13)
      B2 = getParameterValue(14)
      B3 = getParameterValue(15)
      B4 = getParameterValue(16)
      B5 = getParameterValue(17)
      B6 = getParameterValue(18)
      C1 = getParameterValue(19)
      C2 = getParameterValue(20)
      C3 = getParameterValue(21)
      C4 = getParameterValue(22)
      C5 = getParameterValue(23)
      E1 = getParameterValue(24)
      E2 = getParameterValue(25)
      E3 = getParameterValue(26)
      E4 = getParameterValue(27)
      E5 = getParameterValue(28)
      F1 = getParameterValue(29)
      F2 = getParameterValue(30)
      F3 = getParameterValue(31)
      F4 = getParameterValue(32)
      F5 = getParameterValue(33)

		
      EndIf
!-----------------------------------------------------------------------------------------------------------------------

!Read the Inputs
      Entering_Water_Temperature = GetInputValue(1)
      Entering_air_dry_bulb_temperature = GetInputValue(2)
      Entering_air_wet_bulb_temperature = GetInputValue(3)
      Air_volume_flow_rate = GetInputValue(4)
      Water_volumetric_flow_rate = GetInputValue(5)
      Cooling_mode = GetInputValue(6)
      Heating_mode = GetInputValue(7)
		

	!Check the Inputs for Problems (#,ErrorType,Text)
	!Sample Code: If( IN1 <= 0.) Call FoundBadInput(1,'Fatal','The first input provided to this model is not acceptable.')
 
      If(ErrorFound()) Return
!-----------------------------------------------------------------------------------------------------------------------

!-----------------------------------------------------------------------------------------------------------------------
!    *** PERFORM ALL THE CALCULATION HERE FOR THIS MODEL. ***
!-----------------------------------------------------------------------------------------------------------------------

	!-----------------------------------------------------------------------------------------------------------------------
	!If Needed, Get the Previous Control States if Discrete Controllers are Being Used (#)
	!Sample Code: CONTROL_LAST=getPreviousControlState(1)
	!-----------------------------------------------------------------------------------------------------------------------

	!-----------------------------------------------------------------------------------------------------------------------
	!If Needed, Get the Values from the Global Storage Array for the Static Variables (#)
	!Sample Code: STATIC1=getStaticArrayValue(1)
	!-----------------------------------------------------------------------------------------------------------------------

	!-----------------------------------------------------------------------------------------------------------------------
	!If Needed, Get the Initial Values of the Dynamic Variables from the Global Storage Array (#)
	!Sample Code: T_INITIAL_1=getDynamicArrayValueLastTimestep(1)
	!-----------------------------------------------------------------------------------------------------------------------

	!-----------------------------------------------------------------------------------------------------------------------
	!Perform All of the Calculations Here to Set the Outputs from the Model Based on the Inputs

	!Sample Code: OUT1=IN1+PAR1

	!If the model requires the solution of numerical derivatives, set these derivatives and get the current solution
	!Sample Code: T1=getNumericalSolution(1)
	!Sample Code: T2=getNumericalSolution(2)
	!Sample Code: DTDT1=3.*T2+7.*T1-15.
	!Sample Code: DTDT2=-2.*T1+11.*T2+21.
	!Sample Code: Call SetNumericalDerivative(1,DTDT1)
	!Sample Code: Call SetNumericalDerivative(2,DTDT2)

      !Get all dimensionless values
      Twb_ratio = ( Entering_air_wet_bulb_temperature + 273.15 ) / 283.0
      Tw_ratio = ( Entering_Water_Temperature + 273.15 ) / 283.0
      Tdb_ratio = ( Entering_air_dry_bulb_temperature + 273.15 ) / 283.0
      Va_ratio = Air_volume_flow_rate / Rated_air_volume_flow_rate
      Vw_ratio = Water_volumetric_flow_rate / Rated_water_volume_flow_rate

      !Calculate the dimensionless outputs
      Qc_ratio = A1 + A2 * Twb_ratio + A3 * Tw_ratio + A4 * Va_ratio + A5 * Vw_ratio
      Qsc_ratio = B1 + B2 * Tdb_ratio + B3 * Twb_ratio + B4 * Tw_ratio + B5 * Va_ratio + B6 * Vw_ratio
      Pc_ratio = C1 + C2 * Twb_ratio + C3 * Tw_ratio + C4 * Va_ratio + C5 * Vw_ratio
      Qh_ratio = E1 + E2 * Twb_ratio + E3 * Tw_ratio + E4 * Va_ratio + E5 * Vw_ratio
      Ph_ratio = F1 + F2 * Twb_ratio + F3 * Tw_ratio + F4 * Va_ratio + F5 * Vw_ratio

      !Calculate the outputs
      If ( Cooling_mode.EQ.1 ) Then
        Total_cooling_capacity = Qc_ratio * Rated_total_cooling_capacity
        Sensible_cooling_capacity = Qsc_ratio * Rated_sensible_cooling_capacity
        Cooling_power_consumption = Pcratio * Rated_cooling_power_consumption
      Else
        Total_cooling_capacity = 0.0
        Sensible_cooling_capacity = 0.0
        Cooling_power_consumption = 0.0
      EndIf
      If ( Heating_mode.EQ.1 ) Then
        Total_heating_capacity = Qh_ratio * Rated_heating_capacity
        Heating_power_consumption = Ph_ratio * Rated_heating_power_consumption
      Else
        Total_heating_capacity = 0.0
        Heating_power_consumption = 0.0
      EndIf

!-----------------------------------------------------------------------------------------------------------------------

!-----------------------------------------------------------------------------------------------------------------------
!Set the Outputs from this Model (#,Value)
		Call SetOutputValue(1, Total_cooling_capacity) ! Total cooling capacity
		Call SetOutputValue(2, Sensible_cooling_capacity) ! Sensible cooling capacity
		Call SetOutputValue(3, Cooling_power_consumption) ! Cooling power consumption
		Call SetOutputValue(4, Total_cooling_capacity + Cooling_power_consumption) ! Heat dissipation in cooling mode
		Call SetOutputValue(5, Total_heating_capacity) ! Total heating capacity
		Call SetOutputValue(6, Heating_power_consumption) ! Heating mode power consumption
		Call SetOutputValue(7, Total_heating_capacity-Heating_power_consumption) ! Heat absorption in heating mode

!-----------------------------------------------------------------------------------------------------------------------

!-----------------------------------------------------------------------------------------------------------------------
!If Needed, Store the Desired Disceret Control Signal Values for this Iteration (#,State)
!Sample Code:  Call SetDesiredDiscreteControlState(1,1)
!-----------------------------------------------------------------------------------------------------------------------

!-----------------------------------------------------------------------------------------------------------------------
!If Needed, Store the Final value of the Dynamic Variables in the Global Storage Array (#,Value)
!Sample Code:  Call SetDynamicArrayValueThisIteration(1,T_FINAL_1)
!-----------------------------------------------------------------------------------------------------------------------
 
      Return
      End
!-----------------------------------------------------------------------------------------------------------------------

