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
plt.rcParams['font.sans-serif'] = ['DejaVu Sans']
plt.rcParams['axes.unicode_minus'] = False
```

# 2.2 The Forced Quantization Patch

> **Algorithm Goal:** Discretize the continuous orbit space by imposing an angular momentum quantization constraint on the classical planetary model, eliminating the energy leakage bug of the classical model.

---

## Carbon Story: Bohr's Three Postulates

### Physics' Darkest Hour

In 1913, physics faced an embarrassing situation:

- Rutherford scattering had proven the existence of the atomic nucleus (Chapter 1).
- Spectral data hinted at some kind of discrete structure (Section 2.1).
- But classical theory predicted that the atom would collapse within $10^{-11}$ seconds.

The young Danish physicist Niels Bohr did something bold: rather than patching classical theory, he directly **imposed new rules by force**.

### Three Postulates

**Postulate 1: Stationary States**

An electron in an atom can only occupy a series of specific stable orbits, called **stationary states**. An electron moving in a stationary state does not radiate electromagnetic waves.

$$
E_n = -\frac{me^4}{2\hbar^2} \cdot \frac{1}{n^2} = -\frac{13.6 \text{ eV}}{n^2}, \quad n = 1, 2, 3, \ldots
$$

**Postulate 2: Transition Rule**

When an electron transitions from a higher energy level $E_{n_2}$ to a lower energy level $E_{n_1}$, it emits a photon of frequency $\nu$:

$$
h\nu = E_{n_2} - E_{n_1}
$$

**Postulate 3: Angular Momentum Quantization**

The orbital angular momentum of the electron can only take integer multiples of $\hbar$:

$$
L = m_e v r = n\hbar, \quad n = 1, 2, 3, \ldots
$$

### Deriving the Bohr Radius

Combining the angular momentum quantization condition with the Coulomb force providing the centripetal force:

$$
\begin{cases}
m_e v r = n\hbar \\
\displaystyle\frac{e^2}{4\pi\epsilon_0 r^2} = \frac{m_e v^2}{r}
\end{cases}
$$

Eliminating $v$, we obtain the radius of the $n$-th allowed orbit:

$$
r_n = \frac{4\pi\epsilon_0 \hbar^2}{m_e e^2} \cdot n^2 = a_0 n^2
$$

where $a_0 = 0.529 \text{ \AA}$ is the **Bohr radius**: the orbital radius of the hydrogen atom's ground state.

Substituting $r_n$ into the energy expression immediately yields the Rydberg formula, and the theoretically calculated $R_\infty$ agrees perfectly with the experimental value.

---

## Silicon Perspective: Analog-to-Digital Conversion (ADC)

### From Analog to Digital

What Bohr did was essentially an **Analog-to-Digital Conversion (ADC)**.

In the classical model:
- The orbital radius $r$ is a continuous variable (analog signal) that can take any positive real value.
- The energy $E$ is also continuous.

Bohr's quantization condition "sampled" this continuous space into discrete grid points:

```
Classical (Analog):  r in (0, infinity)     -> infinitely many orbits
Bohr (Digital):      r in {a0, 4a0, 9a0, 16a0, ...}  -> countably many orbits
```

The angular momentum quantization $L = n\hbar$ is the **sampling frequency**: it determines the "pixel size." Planck's constant $\hbar$ is the universe's minimum resolution unit.

### Energy Levels as Memory Addresses

Electrons can only reside at specific energy levels, just as data can only be stored at specific memory addresses:

```
Level number n:    1      2      3      4     ...
Energy (eV):    -13.6  -3.40  -1.51  -0.85  ...
Memory address: 0x001  0x002  0x003  0x004  ...
```

Photon emission = the electron "jumping" from one address to another, releasing the energy difference in the form of a photon.

This explains why spectra are discrete: because the addresses are discrete, and the differences between any two addresses can only take discrete values.

---

## AI Workshop: Bohr Model Energy Level Diagram

```{code-cell} ipython3
import numpy as np
import matplotlib.pyplot as plt

# Bohr model energy levels
def E_n(n):
    """Energy of the n-th level of hydrogen (eV)"""
    return -13.6 / n**2

# Plot energy level diagram
fig, ax = plt.subplots(figsize=(8, 10))

n_max = 7
for n in range(1, n_max + 1):
    E = E_n(n)
    ax.hlines(E, 0.2, 0.8, colors='blue', linewidth=2)
    ax.text(0.85, E, f'n={n}, E={E:.2f} eV', va='center', fontsize=10)

# Annotate several transitions (Balmer series)
transitions = [(3, 2, 'red'), (4, 2, 'cyan'), (5, 2, 'blue'), (6, 2, 'violet')]
for n2, n1, color in transitions:
    E_upper = E_n(n2)
    E_lower = E_n(n1)
    dE = E_upper - E_lower
    lam = 1240 / dE  # nm (from E = hc/lambda, with E in eV, lambda in nm)
    ax.annotate('', xy=(0.5, E_lower), xytext=(0.5, E_upper),
                arrowprops=dict(arrowstyle='->', color=color, lw=1.5))
    ax.text(0.52, (E_upper + E_lower)/2, f'{lam:.0f} nm',
            fontsize=8, color=color)

ax.set_xlim(0, 1.2)
ax.set_ylim(-15, 1)
ax.set_ylabel('Energy (eV)')
ax.set_title('Hydrogen Atom Bohr Model Energy Level Diagram')
ax.axhline(y=0, color='gray', linestyle='--', alpha=0.5, label='Ionization limit')
ax.get_xaxis().set_visible(False)
ax.legend()
plt.tight_layout()
plt.savefig('bohr_energy_levels.png', dpi=150)
plt.show()
```

---

## Discussion Questions

1. Bohr's quantization condition $L = n\hbar$ appears highly "artificial." How did Bohr himself defend this postulate? How did de Broglie later provide a more natural explanation using the concept of matter waves?

2. The Bohr model successfully explained the hydrogen atom spectrum, but what are its fundamental limitations? Why can it not be extended to multi-electron atoms?

3. In the Bohr model, the electron moves in a fixed orbit without radiating, which clearly violates classical electromagnetic theory. How did Bohr handle this contradiction? What role did the "correspondence principle" play?

4. The Bohr model is "semi-classical": it retains the concept of classical orbits while introducing quantization conditions. Why was this "hybrid" theory able to succeed? Was its success merely a coincidence?
