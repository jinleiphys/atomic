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

# 1.3 Difficulties of the Planetary Model

## A Seemingly Perfect Picture

The Rutherford scattering experiment established the nuclear structure of the atom: an extremely small but extremely heavy nucleus occupies the center, carrying all the positive charge and the vast majority of the mass, while electrons move in the vast space outside the nucleus. This picture is strikingly similar to the solar system: the nucleus is like the Sun, the electrons are like planets, and the Coulomb attraction replaces gravitation to hold the system together. For this reason, this model is often called the "planetary model" or "solar system model."

Let us examine whether this analogy holds. In the solar system, the equation of motion for a planet orbiting the Sun is

$$
\frac{GMm}{r^2} = \frac{mv^2}{r}
$$

where $M$ is the mass of the Sun, $m$ is the mass of the planet, $r$ is the orbital radius, and $v$ is the orbital velocity. In the atom, the equation for an electron orbiting the nucleus is similar:

$$
\frac{Ze^2}{4\pi\varepsilon_0 r^2} = \frac{m_e v^2}{r}
$$

where $Z$ is the nuclear charge number, $e$ is the electron charge, and $m_e$ is the electron mass. The two equations are mathematically identical: both involve an inverse-square centripetal force. According to Newtonian mechanics, such a system should have stable circular orbits (or, more generally, elliptical orbits). Planets can orbit the Sun for billions of years without falling in, and it would seem that electrons should likewise be able to orbit the nucleus stably.

From an energy perspective, the total energy of the electron in its orbit is the sum of kinetic and potential energy:

$$
E = \frac{1}{2}m_e v^2 - \frac{Ze^2}{4\pi\varepsilon_0 r}
$$

Using the orbital condition, we obtain

$$
E = -\frac{Ze^2}{8\pi\varepsilon_0 r}
$$

The total energy is negative, indicating that the electron is bound near the nucleus. The smaller the orbital radius, the lower the energy (the greater the absolute value), which is entirely consistent with the planetary system.

Everything appears perfect. However, this beautiful picture conceals a fatal flaw.

## The Verdict of Classical Electrodynamics

There is a crucial difference between planets and electrons: planets are electrically neutral, while electrons are charged. According to Maxwell's electromagnetic theory, a charged particle undergoing accelerated motion must radiate electromagnetic waves. An electron in circular orbit around the nucleus has a centripetal acceleration directed toward the center, so it must continuously radiate energy outward.

The radiated power is given by the Larmor formula:

$$
P = \frac{e^2 a^2}{6\pi\varepsilon_0 c^3}
$$

where $a$ is the acceleration and $c$ is the speed of light. For the electron in a hydrogen atom ($Z = 1$) in an orbit at the Bohr radius $a_0 = 5.29 \times 10^{-11}$ meters, the centripetal acceleration is

$$
a = \frac{v^2}{r} = \frac{e^2}{4\pi\varepsilon_0 m_e r^2} \approx 9 \times 10^{22} \text{ m/s}^2
$$

This is an astonishing number, about $10^{22}$ times greater than the gravitational acceleration at the Earth's surface. Substituting into the Larmor formula, the radiated power is approximately

$$
P \approx 4.6 \times 10^{-8} \text{ W}
$$

Although this power appears small, it is catastrophic for an atom. The total energy of the electron in the ground-state orbit is approximately $-13.6$ eV $\approx 2.2 \times 10^{-18}$ J. Losing energy at a rate of $4.6 \times 10^{-8}$ W, the electron would exhaust all its energy in an extremely short time.

Let us analyze this collapse process more carefully. As the electron radiates energy, its total energy becomes more negative, meaning it must fall to a smaller orbit. But the smaller the orbit, the greater the acceleration, the stronger the radiation, and the faster the energy loss. This is a positive feedback process: radiation causes the orbit to shrink, and the shrinking orbit causes stronger radiation, forming a vicious cycle. The electron spirals into the nucleus at an ever-increasing rate.

By solving the energy loss equation, the time required for collapse can be estimated. Let the electron be in an orbit of radius $r$, with energy $E = -e^2/(8\pi\varepsilon_0 r)$. The rate of change of energy with time equals the negative of the radiated power:

$$
\frac{dE}{dt} = -P = -\frac{e^2 a^2}{6\pi\varepsilon_0 c^3}
$$

Expressing the acceleration in terms of the radius, $a = e^2/(4\pi\varepsilon_0 m_e r^2)$, after calculation we obtain

$$
\frac{dr}{dt} = -\frac{e^4}{12\pi^2\varepsilon_0^2 m_e^2 c^3 r^2}
$$

This is a separable differential equation, and upon integration we get

$$
r^3 - r_0^3 = -\frac{e^4 t}{4\pi^2\varepsilon_0^2 m_e^2 c^3}
$$

When $r \to 0$, the collapse time is

$$
\tau = \frac{4\pi^2\varepsilon_0^2 m_e^2 c^3 r_0^3}{e^4}
$$

Substituting the Bohr radius $r_0 = a_0$, we get

$$
\tau \approx 1.6 \times 10^{-11} \text{ s}
$$

That is, according to classical electromagnetic theory, the electron in a hydrogen atom would collapse onto the nucleus in about 16 picoseconds. This is far shorter than any timescale in our everyday experience. If this were true, atoms would be extremely unstable, and matter could not exist. The chair you are sitting on, the air you are breathing, every atom composing your body should all collapse into a clump of dense matter in a trillionth of a second.

But that is not the case. Atoms are stable. Matter has existed for 13.8 billion years and will continue to exist.

## The Puzzle of Spectra

The difficulties of the classical theory are not limited to the stability problem; they also manifest in atomic spectra.

According to the analysis above, an electron spiraling inward would continuously radiate electromagnetic waves. As the orbital radius continually decreases, the frequency of the electron's circular motion continually increases, and the frequency of the emitted electromagnetic waves should change continuously. If this radiation were analyzed with a prism or diffraction grating, one should see a continuous spectrum, just like the light emitted by an incandescent light bulb.

However, the experimental facts are entirely different. When hydrogen gas is heated or excited by electrical discharge, the light it emits is not a continuous spectrum but a series of discrete bright lines, called a line spectrum. Each spectral line corresponds to a definite wavelength (or frequency), with clear gaps between them. In 1885, the Swiss mathematics teacher Johann Balmer discovered that the wavelengths of the four visible spectral lines of hydrogen can be expressed by a simple formula:

$$
\frac{1}{\lambda} = R_H \left(\frac{1}{2^2} - \frac{1}{n^2}\right), \quad n = 3, 4, 5, 6
$$

where $R_H = 1.097 \times 10^7$ m$^{-1}$ is the Rydberg constant. It was later found that all the spectral lines of hydrogen can be described by a more general formula:

$$
\frac{1}{\lambda} = R_H \left(\frac{1}{n_1^2} - \frac{1}{n_2^2}\right), \quad n_2 > n_1 = 1, 2, 3, \ldots
$$

The regularity of this formula is remarkable. It shows that the frequencies of atomic radiation are not arbitrary but are determined by combinations of two integers. Yet from the standpoint of classical physics, there is absolutely no way to understand why this discreteness arises. In the classical picture, the electron can occupy an orbit of any radius, corresponding to continuously varying energy and radiation frequency. Where do the integers come from? Where does the discreteness come from?

This problem perplexed physicists for many years, until Bohr proposed his quantization postulate and provided an answer. That will be the subject of the next chapter.

## Silicon Perspective: System Stability Analysis

From the perspective of systems engineering, the problem with the planetary model can be precisely formulated as a stability analysis problem. We have a dynamical system (an electron orbiting a nucleus) and need to determine whether its equilibrium state is stable.

In control theory, the basic method for judging system stability is to analyze the system's energy dissipation. An isolated system with no energy dissipation can remain in any energy state (marginal stability). If energy is dissipated to the environment, the system tends toward its lowest energy state (asymptotic stability). The key question is: what is the lowest energy state?

For the classical planetary model atom, the electron can dissipate energy to the environment through electromagnetic radiation. Lower energy corresponds to smaller orbital radius, and the orbital radius can approach zero without limit. Therefore, the "lowest energy state" should be $r = 0$, i.e., the electron collapses onto the nucleus. This means that any orbit with a finite radius is not a stable equilibrium, and the system will inevitably evolve to the $r = 0$ state.

In more formal language, the classical atom is an open dissipative system (exchanging energy with the environment through electromagnetic radiation) whose phase space has no attractor (other than the singularity at $r = 0$) and therefore has no stable periodic orbits.

This analysis reveals the essence of the problem: classical physics allows energy and orbital radius to vary continuously, and there is no "ground state" to prevent the electron from approaching the nucleus indefinitely. To solve this problem, some mechanism must be introduced to forbid the electron from occupying certain states, thereby defining a finite minimum energy. This is precisely the core idea of the quantization postulate.

Let us use a numerical simulation to visually demonstrate the electron's spiral collapse.

```{code-cell} ipython3
:tags: [hide-input]

import numpy as np
import matplotlib.pyplot as plt

# Physical constants (SI)
e = 1.602e-19       # C
m_e = 9.109e-31     # kg
c = 3e8             # m/s
epsilon_0 = 8.854e-12
a0 = 5.29e-11       # Bohr radius (m)

def spiral_collapse():
    """
    Simulate the classical electron's spiral collapse

    Based on the energy loss rate equation:
    dr/dt = -e^4 / (12*pi^2*epsilon_0^2*m_e^2*c^3*r^2)
    """
    r = a0          # Initial radius = Bohr radius
    dt = 1e-14      # Time step (s)
    t = 0

    # Precompute constant
    coeff = e**4 / (12 * np.pi**2 * epsilon_0**2 * m_e**2 * c**3)

    radii = [r]
    times = [t]
    powers = []  # Radiated power
    frequencies = []  # Radiation frequency

    while r > 1e-14 and t < 2e-11:
        # Centripetal acceleration
        a = e**2 / (4 * np.pi * epsilon_0 * m_e * r**2)

        # Larmor radiated power
        P = e**2 * a**2 / (6 * np.pi * epsilon_0 * c**3)
        powers.append(P)

        # Orbital frequency
        v = np.sqrt(e**2 / (4 * np.pi * epsilon_0 * m_e * r))
        f = v / (2 * np.pi * r)
        frequencies.append(f)

        # Rate of change of radius
        dr_dt = -coeff / r**2
        dr = dr_dt * dt
        r += dr
        t += dt

        if r > 0:
            radii.append(r)
            times.append(t)

    return np.array(times), np.array(radii), np.array(powers), np.array(frequencies)

times, radii, powers, frequencies = spiral_collapse()

# Plotting
fig, axes = plt.subplots(2, 2, figsize=(12, 10))

# (1) Orbital radius vs. time
ax1 = axes[0, 0]
ax1.plot(times * 1e12, radii / a0, 'b-', linewidth=2)
ax1.set_xlabel('Time (ps)')
ax1.set_ylabel('Orbital radius / Bohr radius')
ax1.set_title('Spiral collapse of the electron')
ax1.axhline(y=0, color='r', linestyle='--', alpha=0.5, label='Nucleus')
ax1.set_xlim(0, 20)
ax1.legend()
ax1.grid(True, alpha=0.3)

# (2) Radiated power vs. time
ax2 = axes[0, 1]
ax2.plot(times[:-1] * 1e12, powers * 1e9, 'r-', linewidth=2)
ax2.set_xlabel('Time (ps)')
ax2.set_ylabel('Radiated power (nW)')
ax2.set_title('Evolution of radiated power')
ax2.set_yscale('log')
ax2.grid(True, alpha=0.3)

# (3) Radiation frequency vs. time
ax3 = axes[1, 0]
ax3.plot(times[:-1] * 1e12, frequencies / 1e15, 'g-', linewidth=2)
ax3.set_xlabel('Time (ps)')
ax3.set_ylabel('Radiation frequency (PHz)')
ax3.set_title('Evolution of radiation frequency')
ax3.set_yscale('log')
ax3.grid(True, alpha=0.3)

# (4) Spiral trajectory visualization (phase space)
ax4 = axes[1, 1]
# Take only the first portion of data for visualization
n_points = min(len(times), 2000)
theta = np.cumsum(np.ones(n_points) * 0.1)  # Assume uniform phase growth
r_vis = radii[:n_points]
x = r_vis * np.cos(theta)
y = r_vis * np.sin(theta)
ax4.plot(x / a0, y / a0, 'b-', linewidth=0.5, alpha=0.7)
ax4.plot(0, 0, 'ro', markersize=8, label='Nucleus')
ax4.set_xlabel('x / Bohr radius')
ax4.set_ylabel('y / Bohr radius')
ax4.set_title('Schematic of the spiral collapse trajectory')
ax4.set_aspect('equal')
ax4.legend()
ax4.grid(True, alpha=0.3)

plt.tight_layout()
plt.show()

# Output key data
collapse_time = times[-1]
print(f"Computed collapse time: tau ~ {collapse_time*1e12:.2f} ps = {collapse_time*1e11:.2f} x 10^-11 s")

# Theoretical value
tau_theory = 4 * np.pi**2 * epsilon_0**2 * m_e**2 * c**3 * a0**3 / e**4
print(f"Theoretical collapse time: tau = {tau_theory*1e12:.2f} ps = {tau_theory*1e11:.2f} x 10^-11 s")
```

The figures clearly show that the orbital radius decreases rapidly over time, the radiated power continually increases (because the acceleration grows), and the radiation frequency also continually rises (because the orbital period shortens). The entire collapse process takes only about 16 picoseconds. This stands in stark contrast to the actual stability of atoms.

## Simulation of the Radiation Spectrum

Let us further simulate what the spectrum emitted by an atom should look like if classical theory were correct.

```{code-cell} ipython3
:tags: [hide-input]

import numpy as np
import matplotlib.pyplot as plt

# Use the frequency data computed above
# Plot the "classical spectrum" -- a continuous spectrum
fig, axes = plt.subplots(1, 2, figsize=(12, 5))

# (1) Classical prediction: continuous spectrum
ax1 = axes[0]
# Frequency range from initial value to just before collapse
wavelengths_nm = c / frequencies * 1e9  # Convert to nanometers
ax1.hist(wavelengths_nm, bins=100, density=True, alpha=0.7, edgecolor='black')
ax1.set_xlabel('Wavelength (nm)')
ax1.set_ylabel('Relative intensity')
ax1.set_title('Classical prediction: continuous spectrum')
ax1.set_xlim(0, 1000)
ax1.axvline(x=656.3, color='r', linestyle='--', alpha=0.5)
ax1.axvline(x=486.1, color='g', linestyle='--', alpha=0.5)
ax1.axvline(x=434.0, color='b', linestyle='--', alpha=0.5)
ax1.axvline(x=410.2, color='purple', linestyle='--', alpha=0.5)

# (2) Experimental observation: line spectrum
ax2 = axes[1]
# Balmer series spectral lines
balmer_wavelengths = [656.3, 486.1, 434.0, 410.2]  # nm
balmer_names = ['H-alpha', 'H-beta', 'H-gamma', 'H-delta']
colors = ['red', 'cyan', 'blue', 'violet']

for wl, name, color in zip(balmer_wavelengths, balmer_names, colors):
    ax2.axvline(x=wl, color=color, linewidth=3, label=f'{name} ({wl:.1f} nm)')

ax2.set_xlabel('Wavelength (nm)')
ax2.set_ylabel('Intensity')
ax2.set_title('Experimental observation: discrete line spectrum (Balmer series)')
ax2.set_xlim(380, 700)
ax2.set_ylim(0, 1)
ax2.legend()
ax2.set_yticks([])

plt.tight_layout()
plt.show()

print("Comparison summary:")
print("Left panel: Classical theory predicts a continuous spectrum as the electron spirals inward")
print("Right panel: Experiment observes a discrete line spectrum")
print("\nThis contradiction cannot be resolved within the framework of classical physics")
```

The comparison clearly illustrates the contradiction between classical theory and experimental observation. Classical theory predicts that atoms should emit a continuous spectrum (left panel), while experiments observe a discrete line spectrum (right panel). This contradiction is profound and fundamental, and cannot be resolved by making small corrections to classical theory.

## Summary and Outlook

Let us summarize the difficulties faced by the planetary model. The nuclear structure of the atom established by Rutherford through scattering experiments is correct; there is no doubt about that. The problem arises when we attempt to describe the motion of electrons within this structure using classical physics: we encounter two insurmountable obstacles.

The first is the stability problem. According to classical electromagnetic theory, an electron orbiting the nucleus must radiate energy, causing its orbit to spiral inward and collapsing onto the nucleus in about $10^{-11}$ seconds. But atoms are in fact stable and can exist for billions of years.

The second is the spectral problem. Classical theory predicts that atoms should emit a continuous spectrum, but experiments observe a discrete line spectrum whose frequencies satisfy simple integer relationships.

The root cause of both problems is the same: classical physics allows energy and orbital radius to take any continuous values, with no mechanism to prevent the electron from falling to arbitrarily low energy states, and no mechanism to explain why only certain energies (corresponding to specific spectral line frequencies) are permitted.

Solving these problems required a revolutionary new idea: energy is not continuous but quantized. Electrons can only exist in specific "allowed orbits," corresponding to specific energy values. In the orbit of lowest energy, the electron no longer radiates, defining a stable ground state. When the electron transitions from one orbit to another, the energy of the emitted or absorbed photon equals the energy difference between the two orbits, explaining the discreteness of line spectra.

These ideas were formally proposed by Bohr in 1913, inaugurating the application of quantum theory to atomic structure. How was the Bohr model constructed? What experimental facts can it explain? What are its own limitations? These questions will be discussed in detail in the next chapter.

## Exercises

1. Gravitation is also an inverse-square force, and planets orbiting the Sun also undergo acceleration. Why doesn't the planetary system suffer from the "radiative collapse" problem? What is the fundamental difference between gravitational wave radiation and electromagnetic radiation?

2. Classical electromagnetic theory was established by Maxwell in 1865, and the planetary model was proposed by Rutherford in 1911. Why did it take physicists so long to realize the contradiction between the planetary model and classical electromagnetic theory?

3. Classical theory predicts that the frequency radiated by a collapsing electron should vary continuously, yet the experimentally observed atomic spectrum consists of discrete lines. What does this contradiction imply? Why is the stability problem of atoms considered one of the key driving forces behind the birth of quantum mechanics?
