# Single-Stage CMOS Operational Amplifier

## Objective

Design and simulate a single-stage CMOS operational amplifier and examine its DC and AC characteristics.

## Design Specifications

| Parameter | Value |
|---|---:|
| Supply voltage, V<sub>DD</sub> | 1.8 V |
| Mirror current, I<sub>mirror</sub> | 10 µA |
| Load capacitance, C<sub>L</sub> | 1.05 pF |
| NMOS dimensions (M1–M4) | W = 350 nm, L = 180 nm |
| PMOS dimensions (M5–M6) | W = 1300 nm, L = 180 nm |
| DC input values for NMOS devices | 1 V |
| AC input values | 1 V |

The circuit uses an NMOS differential pair with a PMOS current-mirror load and an NMOS current-mirror bias branch.

## Circuit Schematic and Device Setup

![Single-stage CMOS op-amp schematic](images/Schematic/Single_Stage_CMOS_OpAmp_Schematic.png)

![Device dimensions and bias parameters](images/Schematic/Device_Dimensions_and_Bias_Parameters.png)

## DC Characteristics

Two DC output-voltage sweeps are included:

1. **Complete input range (0–1.8 V):** the output rises from approximately 0 V and approaches 1.8 V, with a sharp transition near an input voltage of 1 V.
2. **Transition region (0.8–1.2 V):** a closer view of the steep transition around 1 V.

The assignment source also includes the drain-current characteristic of M2.

![Output voltage over the complete DC sweep](images/DC_Characteristics/Output_Voltage_DC_Sweep.png)

![Output voltage in the 0.8–1.2 V transition region](images/DC_Characteristics/Output_Voltage_Operating_Region.png)

![M2 NMOS drain current](images/DC_Characteristics/M2_Drain_Current.png)

## AC Characteristics

The AC analysis plots show the output magnitude and phase over the frequency range from 1 Hz to 1 GHz. The recorded magnitude is approximately 128.81 dB at the low-frequency end and −40.569 dB at 1 GHz. The phase at 1 GHz is approximately −83.519°.

![AC gain and phase at the low-frequency end](images/AC_Characteristics/Gain_and_Phase_Low_Frequency.png)

![AC gain and phase at 1 GHz](images/AC_Characteristics/Gain_and_Phase_Near_1GHz.png)

For an AC voltage gain expressed in decibels:

$$
A_v(\mathrm{dB}) = 20\log_{10}\left|\frac{V_{out}}{V_{in}}\right|
$$

## Conclusion

The DC sweep exhibits a sharp output-voltage transition near an input voltage of 1 V. The AC response shows decreasing output magnitude with increasing frequency, along with the corresponding phase variation.

## Reference

*Analog Assignments.pdf*, Assignment No. 4: Single Stage CMOS Op-Amp, pages 30–32.
