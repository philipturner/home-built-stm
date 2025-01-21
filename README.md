## Members
Philip Turner, Nanoscience Student (2025)
philipturner@vt.edu

## Project Overview

Vacuum-compatible STM with no nonlinearities in the relationship between piezo voltage and position.

## Progress (Jan 2025)

This project is officially a NANO 4994 research project for Spring 2025, worth 3 credits. After months of research, I found a potential solution to my main goal of building an STM, solving piezo creep. I discovered a new material that could make better piezoelectric actuators: <b>lithium niobate</b>. I am listing some of the calculations and scripts I have done. Currently, I am speed-running the tutorials for FreeCAD and KiCad.

Small-scale studies and tests performed:
- [Charge Drives (Google Sheets)](https://docs.google.com/spreadsheets/d/1x5uQ4LPubufbuQAfBjDXJuyd1Wf3S6ZZu0C0zVwssfQ/edit?usp=sharing)
- [TemperatureSensor.swift](https://gist.github.com/philipturner/81bed277f2942c87ea8825910e91a766)
- [Accelerometer.swift](https://gist.github.com/philipturner/bb1920f50a6ece8943d76146afa0af87)
- [FourierTransformAcceleration.swift](https://gist.github.com/philipturner/d7ffa2e23931173a39b9624441069f12)
- [FourierTransformVelocityPosition.swift](https://gist.github.com/philipturner/a365d72c1ba5c4eedf1c331bb21d586d)
- [FrequencyResponse.swift](https://gist.github.com/philipturner/212ae83408707147ce6cd6f57adedc7e)
- [PiezoelectricCoefficients.swift](https://gist.github.com/philipturner/9fb9d81c1d2d1427b4287541a99e6cec)
- Ordered and received 10 lithium niobate piezo plates

I also read a few hundred pages of literature on:
- Nanopositioner design and control electronics
- Vibration isolation
- Ultra-high vacuum instrumentation and compatible technologies
- Ferroelectric materials (Landau Theory)
- A substantial portion of "Art of Electronics, 3rd Edition"

I have gotten through at least 50% of the tutorials I plan to take, for FreeCAD and KiCad.

## High-Level Overview

The current high-level plan is very rough. It will be split into different modules, which can be constructed once and recycled multiple times. I will conduct multiple experiments in sequence, some of which will reuse this equipment. For example, the very first capacitance measurement experiment can use the same vibration isolator as a late-stage STM iteration. It could even opt to only use the interior isolation stage.

Sequence of experiments:
- Measuring capacitance change between two parallel plates, to verify piezoelectricity of LiNbO3
  - Using glass cover slides to enforce a pre-determined distance of ~300 μm. Then, verify that capacitance behavior matches the simulations.
    - Use the FreeCAD finite element simulator to model the capacitance, which needs corrections to the parallel plate model.
  - Verify the predicted behavior, that it shears in both X and Y.
- 1DOF scanning tunneling spectroscopy machine, that can maintain tunneling current without crashing the tip
  - Verify the measurement of 100 fA currents (100x more sensitive than the Mech Panda STM)
- 3DOF scanning tunneling microscope with limited range
  - Prove there is an absence of hysteresis and creep distorting the images of HOPG
  - Resolve individual atoms on Au(111), which Dan Berard could not do. Or find the reason it cannot be imaged under ambient conditions.
- Complete, end-goal iteration with 100 nm range X/Y/Z and vacuum compatibility
  - Remove the stepper motor Z coarse stage
  - Add slip-stick/stick-slip inertial drive for X and Z axes, clamped by gravity
  - X coarse stage enables "tripod assembly line", reducing a sample swapping bottleneck during atom building
  - Coarse stage uses shear piezos, but potentially out of the inferior PZT just to increase their range
  - PZT has piezo creep, but it has a similar effect to thermal drift with stepper motors. Wait until the coarse stage settles.
- Ultra-high vacuum system at room temperature
  - Prove that evaporation of lithium atoms from LiNbO3 is not a concern
  - Prove that evaporation of atoms from the conductive epoxy is not a concern
  - Prove that the system can withstand bakeout, if STM modules are typically required to undergo bakeout
  - Verify that the previously designed system can function (take an image) while producing a vapor pressure of under 10^-10 torr

System modules:
- UHV compatible spare pre-amplifiers
  - Each time a pre-amplifier is used, it might be soldered irreversibly to the STM tip
  - A custom design that minimizes parasitic capacitance, might need to be discarded with the broken tip
  - This is similar to qPlus sensors, which have some MEMS circuitry on whatever the tuning fork is glued to
  - Minimize the magnitude of thermal drift caused by the op-amp's ~7 mW power consumption
- Two-stage spring suspension system
  - Viton high-frequency dampers are incompatible with UHV. They're compatible with HV, but not UHV (Viton has a vapor pressure of 10^-8 or 10^-7 torr).
  - Use a single-stage, compact spring for the high-frequency part. This is small enough to fit inside a UHV chamber.
  - Use a single-stage low-frequency isolator with ~1.7 Hz vertical resonance frequency. Copying the "Open STM" design.
  - The low-frequency isolator models a pessimistic outcome, where you need an air table, and you can't utilize Minus K technology.
  - This table would hold the entire UHV chamber in the far-term prototype. Near-term, it serves to conveniently hold the electronics.
- High-voltage amplification board (piezo driver board)
  - A large number (~5–10) high-power op amps, with bipolar -110V / +110 V output ([ADHV4702-1](https://www.analog.com/en/products/adhv4702-1.html))
    - ["The industry's first 220 Vpp op amp"](https://www.analog.com/en/resources/design-notes/adhv4702-1-24-v-to-220-v-precision-operational-amplifier.html), invented in 2018.
    - There are 350 Vpp (-175 V / +175 V) designs out there, but they have triple the cost ($10 -> $28)
    - Might be more economical to use custom, discrete components to reach even higher voltages (Art of Electronics mentioned 0 V / +1 kV piezo driver)
  - Each LiNbO3 stack needs 2 decidated op amps, so one electrode is +110 V while the other is -110 V. LiNbO3 can withstand extremely high electric fields.
  - Unused op amps should be turned off to reduce power consumption.
  - Might multiplex op-amps to the subset of piezoactuators in use at any moment.
  - Can be recycled for late-stage prototype with coarse piezoactuators under ambient conditions. Might keep one of the electrodes at GND for PZT plates, to avoid depoling them.
- Analog to digital board
  - Enough DACs to supply all the piezos that must be operated simultaneously, in the late-stage prototype (3 fine and 2 coarse, 5 total).
  - Analog Devices made some [open-source code](https://github.com/analogdevicesinc/no-OS/blob/main/drivers/dac/ad5761r/ad5761r.h) to operate this chip, which is nice.
