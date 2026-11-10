# Two-Stage CMOS Operational Amplifier Design

## Project Overview

This mini project presents the design and simulation of a two-stage CMOS operational amplifier using a differential input stage, an active PMOS current-mirror load, a common-source second stage, and Miller frequency compensation. The design uses a 1.8 V supply and a 10 pF output load.

The project covers the design methodology, analytical calculations, transistor sizing, bias-current selection, DC operating-point verification, power estimation, AC frequency-response analysis, transient slew-rate evaluation, and pole-zero analysis.

## Design Specifications

| Parameter | Target specification |
|---|---:|
| DC open-loop gain | ≥ 60 dB |
| Gain-bandwidth product (GBW) | ≤ 1 MHz |
| Phase margin | ≥ 60° |
| Slew rate | Approximately 5 V/µs |
| Load capacitance, C<sub>L</sub> | 10 pF |
| Supply voltage, V<sub>DD</sub> | 1.8 V |

Typical first-order long-channel parameters for a 180 nm CMOS process are used:

| Parameter | Value used |
|---|---:|
| μ<sub>n</sub>C<sub>ox</sub> | 300 µA/V² |
| μ<sub>p</sub>C<sub>ox</sub> | 60 µA/V² |
| V<sub>tn</sub> | 0.5 V |
| V<sub>tp</sub> | −0.5 V |

## Circuit Architecture

The amplifier consists of the following functional blocks:

1. **Input differential pair (M1–M2):** NMOS differential pair driven by the two input sources.
2. **Active load (M3–M4):** PMOS current-mirror load that converts the differential signal into a single-ended first-stage output.
3. **Bias and current-mirror network (M5–M7):** Establishes the tail current and second-stage bias current from the reference branch.
4. **Second gain stage (M8):** PMOS common-source output driver.
5. **Frequency compensation:** Compensation capacitor C1 and series nulling resistor R1 connect the first-stage and output-stage nodes. C2 represents the output load capacitance.

### Schematic

![Two-stage CMOS operational amplifier schematic](images/Schematic/Two_Stage_CMOS_OpAmp_Schematic.png)

## Design Methodology and Analytical Calculations

### 1. Compensation capacitor selection

For the target phase margin, the design condition is:

$$
C_1 \geq 0.22 C_L
$$

For C<sub>L</sub> = 10 pF:

$$
C_1 \geq 0.22 \times 10 = 2.2\text{ pF}
$$

The selected compensation capacitor is increased to:

$$
C_1 = 4.7\text{ pF}
$$

A 4.7 pF compensation capacitor is used to target a unity-gain frequency near 1 MHz while providing frequency compensation.

### 2. Tail-current and bias-current selection

The slew-rate relation is:

$$
SR = \frac{I_{\text{tail}}}{C_1}
$$

Using the target slew rate and selected compensation capacitor:

$$
I_{\text{tail}} = SR \times C_1
$$

$$
I_{\text{tail}} = 5\text{ V}/\mu\text{s} \times 4.7\text{ pF}
= 23.5\ \mu\text{A}
$$

The implemented reference current is 10 µA. M5 mirrors the 10 µA reference current to establish the tail current. The nominal current in each differential branch is 5 µA:

$$
I_{D1}=I_{D2}=\frac{I_{D5}}{2}=5\ \mu\text{A}
$$

The second-stage branch is designed for a nominal current of 50 µA.

### 3. Input-stage transconductance

The gain-bandwidth relation used is:

$$
GBW = \frac{g_{m1}}{2\pi C_1}
$$

For a 1 MHz target and C1 = 4.7 pF:

$$
g_{m1}=2\pi \times GBW \times C_1
$$

$$
g_{m1}=2\pi \times 1\text{ MHz}\times4.7\text{ pF}
\approx 29.53\ \mu\text{A/V}
$$

Using the square-law expression:

$$
\left(\frac{W}{L}\right)_{1,2}
=
\frac{g_{m1}^{2}}
{2\mu_n C_{ox} I_{D1}}
$$

The analytical sizing gives a W/L ratio of approximately 0.29. The implemented input pair uses dimensions of 15 µm / 1.5 µm (W/L = 10).

### 4. Second-stage transconductance

The pole-separation condition is:

$$
\omega_{p2}\geq 3\omega_{GBW}
$$

With the approximation:

$$
\omega_{p2}\approx\frac{g_{m8}}{C_2}
$$

the required transconductance is estimated as:

$$
g_{m8}\geq 3g_{m1}\frac{C_2}{C_1}
$$

$$
g_{m8}\geq
3\times29.53\ \mu\text{A/V}
\times\frac{10\text{ pF}}{4.7\text{ pF}}
\approx188.5\ \mu\text{A/V}
$$

The selected M8 dimensions are 225 µm / 1.5 µm (W/L = 150), with a nominal second-stage current of 50 µA.

### 5. Nulling resistor

A series nulling resistor is connected with the compensation capacitor to shift the compensation zero toward the left half-plane. The selected resistance is:

$$
R_1=2.5\text{ k}\Omega
$$

The compensation-zero expression is:

$$
\omega_z =
\frac{1}{C_1\left(\frac{1}{g_{m8}}-R_1\right)}
$$

Choosing R1 greater than 1/gm8 moves the zero into the left half-plane and improves the high-frequency phase response.

## Transistor Sizing and Bias Currents

The transistor dimensions and nominal drain currents used in the design are listed below.

| Transistor | Type | Function | Width | Length | W/L | Drain current |
|---|---|---|---:|---:|---:|---:|
| M1 | NMOS | Positive input differential pair | 15 µm | 1.5 µm | 10 | 5 µA |
| M2 | NMOS | Negative input differential pair | 15 µm | 1.5 µm | 10 | 5 µA |
| M3 | PMOS | Left active-mirror load | 22.5 µm | 1.5 µm | 15 | 5 µA |
| M4 | PMOS | Right active-mirror load | 22.5 µm | 1.5 µm | 15 | 5 µA |
| M5 | NMOS | First-stage tail-current source | 30 µm | 1.5 µm | 20 | 10 µA |
| M6 | NMOS | Diode-connected reference device | 30 µm | 1.5 µm | 20 | 10 µA |
| M7 | NMOS | Second-stage active-load device | 150 µm | 1.5 µm | 100 | 50 µA |
| M8 | PMOS | Second-stage common-source driver | 225 µm | 1.5 µm | 150 | 50 µA |

## DC Operating-Point Analysis

The simulated DC operating-point values are:

| Node / parameter | Value |
|---|---:|
| Supply voltage | 1.800 V |
| Input common-mode voltage (Vin1 / Vin2) | 0.900 V |
| Tail node voltage | 0.224 V |
| First-stage output / M8 gate voltage | 1.618 V |
| PMOS load-mirror gate voltage | 1.617 V |
| NMOS mirror-bias gate voltage | 0.676 V |
| Output quiescent voltage | 1.618 V |

### Saturation-region checks

For an NMOS device, the saturation condition is:

$$
V_{DS}\geq V_{GS}-V_{th}
$$

For M1 and M2:

$$
V_{GS}=0.900-0.224=0.676\text{ V}
$$

$$
V_{DS1}=1.617-0.224=1.393\text{ V}
$$

$$
V_{DS2}=1.618-0.224=1.394\text{ V}
$$

With V<sub>tn</sub> ≈ 0.5 V, the overdrive voltage is approximately 0.176 V. The input pair operates in the saturation region under these bias conditions.

For M8, the operating-point values are:

$$
V_{SG8}=1.800-1.618=0.182\text{ V}
$$

$$
V_{SD8}=1.800-1.618=0.182\text{ V}
$$

M8 is biased close to the available saturation headroom.

### Total power consumption

The total supply current is:

$$
I_{\text{total}}=|I(V_3)|=70\ \mu\text{A}
$$

The corresponding static power is:

$$
P_{DC}=V_{DD}I_{\text{total}}
$$

$$
P_{DC}=1.8\text{ V}\times70\ \mu\text{A}
=126\ \mu\text{W}
$$

## AC Analysis: Open-Loop Gain and Phase Response

The small-signal stage gains are expressed as:

$$
A_1=-g_{m1}(r_{o2}\parallel r_{o4})
$$

$$
A_2=-g_{m8}(r_{o7}\parallel r_{o8})
$$

The total open-loop DC gain is:

$$
A_{DC}=A_1A_2
$$

The following relation is used:

$$
GBW=\frac{g_{m1}}{2\pi C_1}
$$

### Submitted AC response

![Open-loop gain and phase response](images/AC_Analysis/Open_Loop_Gain_and_Phase_Response.png)

The AC performance values are:

- **DC open-loop gain:** approximately 125 dB.
- **Gain-bandwidth product:** 1.0 MHz.
- **Phase margin:** 88°, using a phase of approximately −92° at the unity-gain crossover.

The phase margin is calculated as:

$$
PM=180^\circ-|{-92^\circ}|=88^\circ
$$

The Bode plot shows the gain and phase response from 1 Hz to 1 GHz. At 1 Hz, the cursor reads 125.664 dB and 91.416°. No additional crossover value is calculated from the displayed cursor readings.

## Transient Analysis and Slew-Rate Verification

The theoretical slew rate is:

$$
SR=\left.\frac{dV_{out}}{dt}\right|_{\max}
=\frac{I_{\text{tail}}}{C_1}
$$

Using the 10 µA tail current and 4.7 pF compensation capacitor stated in the transient-analysis section:

$$
SR=\frac{10\ \mu\text{A}}{4.7\text{ pF}}
\approx2.13\text{ V}/\mu\text{s}
$$

The input pulse is:

```text
PULSE(0.4 1.4 0.1u 1n 1n 2u 4u)
```

and the transient directive as:

```text
.tran 0 10u
```

The slew rates measured from the output waveform are:

| Measurement | Slew rate |
|---|---:|
| Rising slew rate | Approximately +5.1 V/µs |
| Falling slew rate | Approximately −4.9 V/µs |

## Pole-Zero Analysis

The small-signal transconductance values are:

| Device group | Transconductance |
|---|---:|
| Input differential pair (M1, M2) | 173.2 µA/V |
| Active PMOS load (M3, M4) | 94.9 µA/V |
| Second-stage driver (M8) | 948.7 µA/V |

### Dominant pole

The dominant pole is approximated as:

$$
\omega_{p1}\approx
\frac{1}{R_{out1}A_2C_1}
$$

where:

$$
R_{out1}=r_{o2}\parallel r_{o4}
$$

### Non-dominant pole

Using C2 = 10 pF:

$$
f_{p2}\approx\frac{g_{m8}}{2\pi C_2}
$$

$$
f_{p2}\approx
\frac{948.7\ \mu\text{A/V}}{2\pi\times10\text{ pF}}
\approx15.1\text{ MHz}
$$

### Compensation zero

The following relation is used:

$$
f_{z1}=
\frac{1}
{2\pi C_1\left(\frac{1}{g_{m8}}-R_1\right)}
$$

Substituting the design values gives:

$$
\frac{1}{g_{m8}}\approx1054\ \Omega
$$

and:

$$
f_{z1}\approx-14.7\text{ MHz}
$$

The negative sign indicates a left-half-plane zero under this sign convention.

## Performance Summary

The design performance is summarized below.

| Parameter | Target | Simulated performance |
|---|---:|---:|
| DC open-loop gain | ≥ 60 dB | 125 dB |
| Gain-bandwidth product | ≤ 1 MHz | 1.0 MHz |
| Phase margin | ≥ 60° | 88° |
| Slew rate | Approximately 5 V/µs | Approximately 5 V/µs |
| Load capacitance | 10 pF | 10 pF |
| Supply voltage | 1.8 V | 1.8 V |
| Total power consumption | Minimum | 126 µW |

## Repository Contents

```text
Analog_Mini_Project_Two_Stage_CMOS_OpAmp/
├── images/
│   ├── Schematic/
│   │   └── Two_Stage_CMOS_OpAmp_Schematic.png
│   └── AC_Analysis/
│       └── Open_Loop_Gain_and_Phase_Response.png
├── Two_Stage_CMOS_OpAmp_Project_Report.pdf
└── README.md
```

## Project Report

The complete submitted project report is included in this repository:

[Two-Stage CMOS Op-Amp Project Report](Two_Stage_CMOS_OpAmp_Project_Report.pdf)
