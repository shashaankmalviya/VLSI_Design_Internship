# Assignment 1 — MOSFET Characterisation

## Objective

Simulate and analyse the electrical characteristics of MOSFET devices using the 45 nm GPDK technology library. The assignment covers:

1. PMOS drain-current characteristics.
2. NMOS threshold-voltage extraction for different channel lengths.
3. NMOS intrinsic voltage-gain estimation.

## Technology

| Parameter | Value |
|---|---|
| PDK | GPDK45 |
| Technology node | 45 nm |

---

## Q1. PMOS Current–Voltage Characteristics

Simulate the following characteristics of a PMOS transistor and record the corresponding observations:

- Drain current versus drain-to-source voltage, \(I_D\)–\(V_{DS}\), for different gate-to-source voltages, \(V_{GS}\).
- Drain current versus gate-to-source voltage, \(I_D\)–\(V_{GS}\), for different drain-to-source voltages, \(V_{DS}\).

### Observations

1. The drain current depends strongly on the applied gate-to-source voltage, \(V_{GS}\).
2. At \(V_{GS}=0\,\text{V}\), the drain current is approximately zero, indicating the cut-off condition for the simulated PMOS bias convention.
3. As the magnitude of the applied gate-to-source voltage increases, the magnitude of the drain current increases.
4. Near the threshold region, the drain current is comparatively small.
5. Higher gate-bias settings, including the 0.75 V and 1 V traces shown in the simulation, produce larger drain-current magnitudes.
6. The simulated curves demonstrate the voltage-controlled current behaviour of the PMOS transistor.

### Simulation plots

Add the generated plots in this section:

- `Images/ID_VDS_Different_VGS.png`
- `Images/ID_VGS_Different_VDS.png`

---

## Q2. NMOS Threshold-Voltage Extraction

### Objective

Estimate the threshold voltage, \(V_{TH}\), of an NMOS transistor using simulation. Keep the transistor width fixed at \(W=1\,\mu\text{m}\), use a drain voltage of \(V_D=1\,\text{V}\), and repeat the extraction for different channel lengths.

### Simulation conditions

| Parameter | Value |
|---|---:|
| Device | NMOS |
| Width, \(W\) | \(1\,\mu\text{m}\) |
| Drain voltage, \(V_D\) | \(1\,\text{V}\) |
| Channel lengths, \(L\) | \(1\,\mu\text{m}\), 800 nm, 600 nm, 400 nm, 200 nm |

### Extracted threshold voltages

| Channel length, \(L\) | Width, \(W\) | Extracted \(V_{TH}\) |
|---:|---:|---:|
| \(1\,\mu\text{m}\) | \(1\,\mu\text{m}\) | 384.969 mV |
| 800 nm | \(1\,\mu\text{m}\) | 392.1884 mV |
| 600 nm | \(1\,\mu\text{m}\) | 402.7294 mV |
| 400 nm | \(1\,\mu\text{m}\) | 421.7278 mV |
| 200 nm | \(1\,\mu\text{m}\) | 466.1553 mV |

### Observations

1. The extracted threshold voltage increases as the channel length is reduced.
2. The threshold voltage changes from approximately 392.19 mV at \(L=800\,\text{nm}\) to approximately 466.16 mV at \(L=200\,\text{nm}\).
3. The results show that the threshold voltage of the simulated NMOS device depends on channel length.

### Simulation plots

Add the threshold-voltage extraction schematic and simulation plots in this section:

- `Images/NMOS_VTH_Schematic.png`
- `Images/NMOS_VTH_Different_Lengths.png`

---

## Q3. NMOS Intrinsic Voltage Gain

### Objective

Estimate the intrinsic voltage gain, \(A_v\), of NMOS transistors with different device dimensions using DC operating-point analysis.

The intrinsic voltage gain is:

$$
A_v=\frac{g_m}{g_{ds}}
$$

where:

- \(g_m\) is the transconductance.
- \(g_{ds}\) is the output conductance.

The small-signal parameters are obtained from the DC operating point at the specified bias condition.

### Simulation conditions

| Parameter | Value |
|---|---:|
| Library | GPDK45 |
| Device | NMOS1V |
| Gate-to-source voltage, \(V_{GS}\) | 0.7 V |
| Drain-to-source voltage, \(V_{DS}\) | 1 V |

The same operating point was used for all five devices.

### Device-wise calculations

**Device 1**

$$
A_v=\frac{270.873\,\mu\text{S}}{10.7036\,\mu\text{S}}
=25.31
$$

| Parameter | Value |
|---|---:|
| \(W\) | 400 nm |
| \(L\) | 45 nm |
| \(I_D\) | 29.0908 µA |
| \(g_m\) | 270.873 µS |
| \(g_{ds}\) | 10.7036 µS |
| Intrinsic gain, \(A_v\) | 25.31 V/V |

**Device 2**

$$
A_v=\frac{92.5429\,\mu\text{S}}{2.1746\,\mu\text{S}}
=42.55
$$

| Parameter | Value |
|---|---:|
| \(W\) | 400 nm |
| \(L\) | 400 nm |
| \(I_D\) | 15.5434 µA |
| \(g_m\) | 92.5429 µS |
| \(g_{ds}\) | 2.1746 µS |
| Intrinsic gain, \(A_v\) | 42.55 V/V |

**Device 3**

$$
A_v=\frac{99.2098\,\mu\text{S}}{2.11332\,\mu\text{S}}
=46.94
$$

| Parameter | Value |
|---|---:|
| \(W\) | 500 nm |
| \(L\) | 500 nm |
| \(I_D\) | 16.603 µA |
| \(g_m\) | 99.2098 µS |
| \(g_{ds}\) | 2.11332 µS |
| Intrinsic gain, \(A_v\) | 46.94 V/V |

**Device 4**

$$
A_v=\frac{105.707\,\mu\text{S}}{1.91425\,\mu\text{S}}
=55.22
$$

| Parameter | Value |
|---|---:|
| \(W\) | 750 nm |
| \(L\) | 750 nm |
| \(I_D\) | 17.8576 µA |
| \(g_m\) | 105.707 µS |
| \(g_{ds}\) | 1.91425 µS |
| Intrinsic gain, \(A_v\) | 55.22 V/V |

**Device 5**

$$
A_v=\frac{109.62\,\mu\text{S}}{1.77815\,\mu\text{S}}
=61.65
$$

| Parameter | Value |
|---|---:|
| \(W\) | \(1\,\mu\text{m}\) |
| \(L\) | \(1\,\mu\text{m}\) |
| \(I_D\) | 18.6944 µA |
| \(g_m\) | 109.62 µS |
| \(g_{ds}\) | 1.77815 µS |
| Intrinsic gain, \(A_v\) | 61.65 V/V |

### Summary of intrinsic-gain results

| Sl. No. | \(W/L\) | Intrinsic gain, \(g_m/g_{ds}\) |
|---:|---:|---:|
| 1 | 400 nm / 45 nm | 25.31 V/V |
| 2 | 400 nm / 400 nm | 42.55 V/V |
| 3 | 500 nm / 500 nm | 46.94 V/V |
| 4 | 750 nm / 750 nm | 55.22 V/V |
| 5 | \(1\,\mu\text{m}/1\,\mu\text{m}\) | 61.65 V/V |

### Observations

1. The intrinsic gain increases across the simulated device set, from 25.31 V/V to 61.65 V/V.
2. The devices with longer channel lengths in this set exhibit lower output conductance, \(g_{ds}\), and higher intrinsic gain.
3. The maximum intrinsic gain among the simulated devices is 61.65 V/V for \(W=L=1\,\mu\text{m}\).

### Simulation plots

Add the DC operating-point schematics and supporting plots for the five devices in this section.

---

## Conclusion

The assignment demonstrates PMOS current–voltage characteristics, NMOS threshold-voltage extraction across different channel lengths, and NMOS intrinsic-gain estimation using DC operating-point parameters. The extracted results show channel-length dependence in the threshold voltage and an increase in intrinsic gain across the evaluated NMOS device set.
