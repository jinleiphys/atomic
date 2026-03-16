---
jupytext:
  text_representation:
    extension: .md
    format_name: myst
kernelspec:
  display_name: Python 3
  language: python
  name: python3
---

```{code-cell} ipython3
:tags: [remove-cell]

import matplotlib.pyplot as plt
import numpy as np
plt.rcParams['font.sans-serif'] = ['DejaVu Sans']
plt.rcParams['axes.unicode_minus'] = False
```

# 2.2 The Photoelectric Effect

## From Sparks to Quanta: The Return of Light's Particle Nature

In 1887, Heinrich Hertz, while conducting experiments to verify Maxwell's electromagnetic wave theory, noticed an unexpected side effect: when ultraviolet light illuminated the electrodes of a spark gap, the discharge occurred more easily. Hertz faithfully recorded this observation but did not pursue its cause. The following year, his student Wilhelm Hallwachs investigated the effect more systematically: he connected a zinc plate to an electroscope and illuminated it with ultraviolet light, observing that the electroscope's leaves deflected, indicating that the zinc plate had lost negative charge. This was the earliest discovery of the photoelectric effect. Light striking a metal surface causes the metal to release negatively charged particles, which J.J. Thomson confirmed in 1897 to be electrons.

The experimental apparatus for studying the photoelectric effect is straightforward. Two metal electrodes are sealed inside an evacuated glass tube, one serving as the cathode and the other as the anode. Monochromatic light illuminates the cathode surface; if the light frequency is sufficiently high, the cathode emits electrons. These photoelectrons travel toward the anode under the influence of the electric field, forming a photocurrent. An adjustable voltage is applied between the cathode and anode: when the anode is at positive potential, the field accelerates the electrons and the photocurrent increases toward saturation; when the anode is at negative potential (reverse voltage), the field decelerates the electrons and the photocurrent decreases. Gradually increasing the reverse voltage until the photocurrent just drops to zero yields the stopping voltage $V_s$. Its physical meaning is clear: it is just sufficient to decelerate the fastest photoelectrons to zero, so the maximum kinetic energy of the photoelectrons is $K_{\max} = eV_s$, where $e$ is the electron charge. By measuring the stopping voltage at different light frequencies and intensities, physicists obtained a series of puzzling experimental results.

Classical electromagnetic theory treats light as a continuous electromagnetic wave. In this picture, the wave's energy is uniformly distributed across the wavefront, and electrons at the metal surface continuously absorb energy from the incident wave until they accumulate enough to overcome the binding potential and escape. This picture is intuitive and reasonable, but it clashed sharply with experimental results on three key predictions.

The first contradiction concerned the response time. According to classical theory, the wave's energy is spread uniformly across the wavefront. An atom's cross-section is approximately $10^{-20}$ m$^2$; at typical light intensities, a classical estimate shows that a single electron would need seconds or even minutes to accumulate enough energy (typically a few electron volts) to escape. Yet experiments demonstrated that the photoelectric effect occurs almost instantaneously, with a delay of no more than $10^{-9}$ seconds between illumination and electron emission. This timescale differs from the classical expectation by more than ten orders of magnitude. No adjustment of classical parameters could account for such a short response time.

The second contradiction concerned the relationship between light intensity and kinetic energy. Classical theory predicted that greater light intensity (greater energy flux per unit area) would produce larger wave amplitudes, giving electrons more energy, so the maximum kinetic energy of photoelectrons should increase with intensity. However, Philipp Lenard's precise experiments in 1902 showed that increasing light intensity only increased the photocurrent (the number of emitted electrons) while the stopping voltage $V_s$ remained completely unchanged. That is, the maximum kinetic energy $K_{\max} = eV_s$ of each photoelectron was independent of light intensity. This result was devastating for classical theory: if light energy is continuously spread across the wavefront, a stronger wave should give electrons more energy, but experiments said otherwise.

The third contradiction concerned the cutoff frequency. Experiments revealed that for each metal there exists a specific cutoff frequency $\nu_0$: when the incident light frequency falls below $\nu_0$, no photoelectrons are produced regardless of how intense the light is or how long the illumination lasts. Classical theory could not explain why such a frequency threshold should exist — in the classical picture, given sufficient illumination time, light of any frequency should allow electrons to accumulate enough energy to escape. Even more puzzling, when the stopping voltage $V_s$ was plotted against frequency $\nu$ for different metals, the data yielded a set of parallel straight lines: different metals had different intercepts with the frequency axis (corresponding to different cutoff frequencies), but all lines had exactly the same slope. This universal slope pointed to some fundamental constant independent of the metal.

## Einstein's Light Quantum Hypothesis

In 1905, Albert Einstein, working at the patent office in Bern, published a paper titled "On a Heuristic Point of View Concerning the Production and Transformation of Light." In this paper, Einstein proposed a bold hypothesis: light is not merely exchanged in discrete energy units when interacting with matter (as Planck had implied in 1900), but light itself consists of indivisible energy quanta, each carrying energy $E = h\nu$, where $h$ is Planck's constant and $\nu$ is the light frequency. This was a more revolutionary step than Planck had taken. Planck only assumed that the oscillators in the cavity walls absorbed and emitted energy in discrete units, but he never questioned the continuity of light itself. Einstein declared that light, even while propagating freely through space, is already quantized — light is not a uniformly spread wave but a stream of "energy bullets."

Einstein's light quantum hypothesis explained all the experimental facts of the photoelectric effect in an elegant way. In Einstein's picture, the energy exchange between light and electrons is "all or nothing": a single photon transfers its entire energy $h\nu$ to a single electron in one instantaneous event, rather than slowly and continuously transferring energy as a classical wave would. If the photon energy $h\nu$ exceeds the minimum energy needed to extract an electron from the metal (called the work function $\phi$), the electron escapes, with the excess energy converted to kinetic energy. If $h\nu < \phi$, no matter how many photons arrive, each individual photon lacks sufficient energy to free an electron, and no photoelectric effect occurs. Einstein thus wrote down the photoelectric equation:

$$
K_{\max} = h\nu - \phi
$$

This equation simultaneously explained the three experimental facts that classical theory could not understand. The response time problem was immediately resolved: the energy exchange between photon and electron is an instantaneous single event requiring no accumulation, so the response time can be extremely short. The independence of kinetic energy from intensity was also explained: increasing intensity means increasing the number of photons, but each photon's energy $h\nu$ remains unchanged, so the maximum kinetic energy of individual electrons stays the same, while the photocurrent (proportional to the number of emitted electrons) naturally increases with intensity. The existence of a cutoff frequency became self-evident: setting $K_{\max} = 0$ gives the cutoff frequency $\nu_0 = \phi/h$. Photons with frequency below $\nu_0$ simply lack the energy to overcome the work function, regardless of intensity or illumination duration. Different metals have different work functions $\phi$ and hence different cutoff frequencies, but the slope of $K_{\max}$ versus $\nu$ in the photoelectric equation is always $h$ — this is the universal slope observed in experiments, independent of the metal.

Einstein's light quantum hypothesis was not immediately accepted by the physics community. Even Planck himself, while acknowledging Einstein's genius in relativity and other areas, remained skeptical of the photon concept. The wave nature of light had been incontrovertibly established by Young's double-slit experiment, diffraction, polarization, and numerous other experiments; the light quantum seemed to negate all this evidence. The American experimentalist Robert Millikan spent a full decade from 1905 conducting extremely precise photoelectric experiments, with the explicit goal of disproving Einstein's theory. However, Millikan's results, published in 1916, perfectly confirmed Einstein's photoelectric equation: the stopping voltage and frequency were indeed in a precise linear relationship, and the slope yielded a value of $h$ consistent with what Planck had obtained from blackbody radiation data. Millikan himself wrote in his paper: "despite the fact that [Einstein's theory] is so unreasonable that it seems to contradict everything we know about the interference of light..." — but the experimental facts were indisputable. In 1921, Einstein was awarded the Nobel Prize in Physics for his theoretical explanation of the photoelectric effect. Millikan himself later received the 1923 Nobel Prize for his precision measurement work, including the photoelectric effect experiments.

From a broader historical perspective, Einstein's light quantum hypothesis was a critical extension of Planck's quantization idea. Planck in 1900 assumed that oscillators in the cavity walls could only absorb and emit energy in units of $h\nu$, but he viewed quantization as a property of matter (oscillators), while light itself remained a classical electromagnetic wave. Einstein extended quantization from matter to light itself, asserting that light exists in the form of discrete photons even in free space. The logic of this extension is actually quite natural: if oscillators can only release energy in units of $h\nu$, and this energy is radiated as light, then light itself should also exist in units of $h\nu$. Planck's hesitation lay in viewing quantization as an approximation method (a "mathematical device") rather than physical reality. Einstein's courage lay in treating quantization as a true statement about nature. This shift from "mathematical tool" to "physical reality" was the key step in quantum theory's evolution from a vague intuition to a clear physical theory.

## Silicon Perspective: Packet Switching and the Energy Transfer Paradigm Shift

In classical electromagnetic theory, a light wave's energy is uniformly and continuously spread across the wavefront, like water waves spreading across a lake. This continuous mode of energy transmission has a precise analogy in communication technology: circuit switching. In traditional telephone networks, when you place a call, the switch establishes a dedicated physical circuit between you and the other party, with signals flowing continuously along this circuit until the call ends. The circuit's capacity is evenly allocated to both parties, and the line remains occupied whether or not you are actually speaking.

The energy transfer mechanism described by Einstein's light quantum hypothesis is fundamentally different. Photons carry discrete energy packets of $h\nu$, transferring energy to electrons in an "all or nothing" fashion. This more closely resembles packet switching in the internet: data is not transmitted along a dedicated continuous channel but is chopped into fixed-size packets, each carrying a complete information unit and traveling independently through the network. In a packet-switched network, a router either receives a complete packet (and forwards or processes it) or does not receive it at all — there is no state of "receiving half a packet." This is precisely how photons interact with electrons in the photoelectric effect: an electron either absorbs a complete photon (gaining the full energy $h\nu$) or absorbs nothing at all — there is no process of "absorbing half a photon."

The analogy can be pushed further. In a circuit-switched network, even if you only want to send a single byte of data, you must occupy the entire circuit's bandwidth. This is analogous to how, in classical theory, even if you only want to give one electron a tiny bit of energy, the entire wavefront is "working," with vast amounts of energy wasted on empty space devoid of electrons. The revolution of packet switching is that it makes energy (bandwidth) allocation discrete and on-demand: each packet occupies only the network resources it actually needs, releasing them immediately after transmission. Similarly, the photon's "packet switching" makes energy transfer efficient and precise: each photon carries exactly $h\nu$ of energy and delivers it precisely to one electron, with no "diffuse waste."

The existence of the cutoff frequency also finds a natural counterpart in the packet-switching framework. In network communications, every protocol specifies a minimum packet size and minimum transmission unit. If your data is smaller than the minimum packet size, you still must send a complete minimum-size packet — the protocol does not permit sending smaller units. In the photoelectric effect, the work function $\phi$ plays the role of "minimum protocol overhead": the photon energy $h\nu$ must at least reach $\phi$ to complete "one valid transmission" (freeing an electron from the metal). If $h\nu < \phi$, the "packet" has zero or negative effective payload and cannot be accepted or processed, no matter how many such packets you send. Increasing light intensity is like increasing the sending rate (more packets per second), but if every packet falls below the protocol's minimum size, no amount of throughput can accomplish any effective communication.

## AI Workshop: Visualizing the Photoelectric Equation

The code below plots the stopping voltage versus incident light frequency for several typical metals, visually demonstrating the linear relationship of Einstein's photoelectric equation $eV_s = h\nu - \phi$.

```{code-cell} ipython3
:tags: [hide-input]

import numpy as np
import matplotlib.pyplot as plt

plt.rcParams['font.sans-serif'] = ['DejaVu Sans']
plt.rcParams['axes.unicode_minus'] = False

h = 6.626e-34
e_charge = 1.602e-19
c = 3.0e8

metals = {
    'Cs (cesium)':   {'phi': 2.14, 'color': '#e41a1c'},
    'K (potassium)': {'phi': 2.30, 'color': '#ff7f00'},
    'Na (sodium)':   {'phi': 2.75, 'color': '#4daf4a'},
    'Zn (zinc)':     {'phi': 4.33, 'color': '#377eb8'},
    'Ag (silver)':   {'phi': 4.73, 'color': '#984ea3'},
}

fig, axes = plt.subplots(1, 2, figsize=(14, 5.5))

ax = axes[0]
nu = np.linspace(0, 2.5e15, 1000)

for name, info in metals.items():
    phi_J = info['phi'] * e_charge
    nu_0 = phi_J / h
    V_s = (h * nu - phi_J) / e_charge
    V_s_plot = np.where(nu >= nu_0, V_s, np.nan)
    ax.plot(nu * 1e-14, V_s_plot, color=info['color'], linewidth=2,
            label=f"{name}, $\\phi$ = {info['phi']:.2f} eV")
    ax.plot(nu_0 * 1e-14, 0, 'o', color=info['color'], markersize=7, zorder=5)

ax.axhline(y=0, color='gray', linestyle='-', alpha=0.3)
ax.set_xlabel('Frequency $\\nu$ ($\\times 10^{14}$ Hz)')
ax.set_ylabel('Stopping voltage $V_s$ (V)')
ax.set_title('Einstein photoelectric equation: $eV_s = h\\nu - \\phi$')
ax.legend(fontsize=8.5, loc='upper left')
ax.set_xlim(0, 25)
ax.set_ylim(-1, 8)
ax.annotate('Slope $= h/e$\n(universal, metal-independent)',
            xy=(18, 4.5), fontsize=10, color='black',
            bbox=dict(boxstyle='round,pad=0.3', facecolor='lightyellow', alpha=0.8))

ax2 = axes[1]
V = np.linspace(-3, 5, 500)
V_s_val = 1.5

def photocurrent(V, V_s, I_sat):
    I = np.zeros_like(V)
    mask = V >= -V_s
    I[mask] = I_sat * (1 - np.exp(-(V[mask] + V_s) / 0.3))
    I[V > 1] = I_sat
    return I

intensities = [1.0, 2.0, 3.0]
colors_I = ['#66c2a5', '#fc8d62', '#8da0cb']
labels_I = ['Low intensity $I_0$', 'Medium $2I_0$', 'High $3I_0$']

for I_sat, col, lab in zip(intensities, colors_I, labels_I):
    I = photocurrent(V, V_s_val, I_sat)
    ax2.plot(V, I, color=col, linewidth=2, label=lab)

ax2.axvline(x=-V_s_val, color='red', linestyle='--', alpha=0.7, linewidth=1.5)
ax2.annotate(f'$-V_s = -{V_s_val}$ V', xy=(-V_s_val, -0.15), fontsize=10,
            color='red', ha='center')
ax2.axhline(y=0, color='gray', linestyle='-', alpha=0.3)
ax2.set_xlabel('Applied voltage $V$ (V)')
ax2.set_ylabel('Photocurrent $I$ (a.u.)')
ax2.set_title('Photocurrent at different intensities')
ax2.legend(fontsize=9)
ax2.set_xlim(-3, 5)
ax2.set_ylim(-0.3, 3.5)
ax2.annotate('Stopping voltage\nunchanged by intensity!',
            xy=(-1.5, 2.5), fontsize=10, color='red',
            bbox=dict(boxstyle='round,pad=0.3', facecolor='mistyrose', alpha=0.8))

plt.tight_layout()
plt.show()
```

The left panel shows the linear relationship between stopping voltage and incident light frequency for different metals. The slope of every line equals $h/e$, a universal constant independent of the metal. Each line's intercept with the horizontal axis marks that metal's cutoff frequency $\nu_0 = \phi/h$; the larger the work function $\phi$, the higher the cutoff frequency, requiring shorter-wavelength (higher-energy) light to produce photoelectrons. The right panel shows the photocurrent versus applied voltage at a fixed light frequency for three different intensities. Increasing intensity proportionally increases the saturation photocurrent (more photons produce more photoelectrons), but the stopping voltage remains unchanged (each photon's energy does not depend on intensity).

```{code-cell} ipython3
import numpy as np
from scipy import stats

# Simulating Millikan's experiment: sodium metal (phi = 2.75 eV)
wavelengths_nm = np.array([200, 250, 300, 350, 400, 450])
phi_Na = 2.75

hc_eVnm = 1240.0
photon_energy_eV = hc_eVnm / wavelengths_nm
V_s_theory = photon_energy_eV - phi_Na

mask = V_s_theory > 0
wavelengths_valid = wavelengths_nm[mask]
nu_valid = 3e8 / (wavelengths_valid * 1e-9)
V_s_valid = V_s_theory[mask]

np.random.seed(42)
V_s_exp = V_s_valid + np.random.normal(0, 0.02, len(V_s_valid))

slope, intercept, r_value, p_value, std_err = stats.linregress(nu_valid, V_s_exp)
h_measured = slope * 1.602e-19
phi_measured = -intercept

print("=" * 55)
print("Simulated Millikan experiment: extracting h from data")
print("=" * 55)
print(f"\nData (sodium metal):")
print(f"{'λ (nm)':>10} {'ν (10¹⁴ Hz)':>18} {'V_s (V)':>15}")
print("-" * 45)
for lam, nu, vs in zip(wavelengths_valid, nu_valid, V_s_exp):
    print(f"{lam:>10.0f} {nu*1e-14:>18.2f} {vs:>15.3f}")

print(f"\nLinear fit: V_s = ({slope:.4e}) × ν + ({intercept:.4f})")
print(f"R² = {r_value**2:.6f}")
print(f"\nExtracted Planck constant: h = {h_measured:.4e} J·s")
print(f"Standard value:           h = 6.6261e-34 J·s")
print(f"Relative error: {abs(h_measured - 6.6261e-34)/6.6261e-34 * 100:.2f}%")
print(f"\nExtracted work function:  φ = {phi_measured:.3f} eV")
print(f"Standard value:           φ = {phi_Na:.2f} eV")
```

## Discussion Questions

1. Einstein's light quantum hypothesis successfully explained the photoelectric effect, but interference and diffraction experiments clearly demonstrated that light has wave properties. How can a single entity simultaneously exhibit both particle and wave behavior? Does "wave-particle duality" mean that light is "sometimes a wave and sometimes a particle," or do we need an entirely new conceptual framework?

2. Planck hypothesized the quantization of oscillator energy, while Einstein hypothesized the quantization of light itself. What is the essential difference between these two hypotheses? Why could Planck accept the former but hesitate to accept the latter for so long?

3. Imagine yourself back in 1905. You already know about the three classical difficulties of the photoelectric effect, and you know that Planck has just proposed his energy quantization hypothesis. Would you have thought to extend "quantization" from oscillators to light itself? This extension seems "natural" in hindsight, but why did almost no one (except Einstein) dare to take this step at the time? What kind of intellectual courage is required to make the leap from "mathematical tool" to "physical reality"?
