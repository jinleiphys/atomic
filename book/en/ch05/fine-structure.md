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

# 5.2 Parameter Coupling and Debugging

> **Algorithm Goal:** Understand how spin-orbit coupling modifies the energy level structure, and how an external magnetic field causes further splitting of energy levels.

---

## Carbon Story: Fine Splitting of Spectral Lines

### Alkali Metal Doublets

When observing the emission spectrum of sodium with a high-resolution spectrometer, the famous yellow D line ($\lambda \approx 589$ nm) is actually **two** very closely spaced spectral lines:

- $D_1$: 589.592 nm
- $D_2$: 588.995 nm

The wavelength difference is only 0.597 nm, yet they are indeed two independent spectral lines. This is the **fine structure**.

A similar doublet structure also exists in the hydrogen atom spectrum, though the splitting is even smaller.

### Spin-Orbit Coupling

The physical origin of the fine structure is **spin-orbit coupling (Spin-Orbit Coupling)**.

From the electron's reference frame, the positively charged nucleus orbits around it, generating a magnetic field $\mathbf{B}_{\text{int}}$. The electron's spin magnetic moment acquires additional potential energy in this internal magnetic field:

$$
H_{SO} = -\boldsymbol{\mu}_s \cdot \mathbf{B}_{\text{int}} \propto \mathbf{L} \cdot \mathbf{S}
$$

The spin-orbit coupling energy is proportional to $\mathbf{L} \cdot \mathbf{S}$, the dot product of the orbital angular momentum and spin angular momentum.

### Total Angular Momentum

Define the total angular momentum:

$$
\mathbf{J} = \mathbf{L} + \mathbf{S}
$$

The new quantum number $j$ can take:

$$
j = l + s = l + \frac{1}{2} \quad \text{or} \quad j = l - s = l - \frac{1}{2} \quad (l \geq 1)
$$

For $l = 0$, only $j = 1/2$ is possible (no splitting). For $l \geq 1$, each energy level splits into two.

The splitting of the sodium D line corresponds to the $3p$ state splitting into the $j = 3/2$ and $j = 1/2$ sub-levels:

$$
3p_{3/2} \to 3s_{1/2}: \quad D_2 \text{ line}
$$
$$
3p_{1/2} \to 3s_{1/2}: \quad D_1 \text{ line}
$$

### The Zeeman Effect

When an atom is placed in an external magnetic field $\mathbf{B}$, the energy levels undergo further splitting, the **Zeeman effect**.

In an external magnetic field, different values of the $z$-component $m_j$ of the total angular momentum $\mathbf{J}$ correspond to different energies:

$$
\Delta E = g_j m_j \mu_B B
$$

where the **Lande $g$-factor** is:

$$
g_j = 1 + \frac{j(j+1) + s(s+1) - l(l+1)}{2j(j+1)}
$$

Each $j$ level splits into $2j+1$ sub-levels.

- **Normal Zeeman effect** ($S=0$, purely orbital): each spectral line splits into three.
- **Anomalous Zeeman effect** ($S \neq 0$, spin participates): the splitting pattern is more complex, determined by the specific value of $g_j$.

---

## Silicon Perspective: Perturbation Theory, Patching the System

### The Main Program and Patch Packages

From a software engineering perspective, the energy level structure of the hydrogen atom is like a software version iteration:

```
v1.0 -- Bohr Model (Chapter 2)
  Main program: Coulomb potential V(r) = -e^2/r
  Output:       E_n = -13.6/n^2 eV
  Precision:    ~10^-1 eV

v2.0 -- Schrodinger Equation (Chapter 4)
  Main program: Same as above (non-relativistic quantum mechanics)
  Output:       Same as above, but wave functions are exact
  Precision:    ~10^-1 eV

v2.1 -- Fine Structure Patch (Chapter 5)
  Patch 1: Spin-orbit coupling H_SO ~ L*S
  Patch 2: Relativistic kinetic energy correction
  Patch 3: Darwin term
  Output:   E_nj = E_n + Delta_E(j)
  Precision:    ~10^-5 eV

v2.2 -- External Field Patch (Zeeman Effect)
  Patch:    -mu*B (external magnetic field coupling)
  Output:   E_njm = E_nj + g_j * m_j * mu_B * B
  Precision:    ~10^-6 eV (depends on field strength)
```

### Algorithmic Logic of Perturbation Theory

**Perturbation theory** is the standard method in quantum mechanics for handling "patches":

1. First solve the **unperturbed system** (main program) for exact solutions $\psi_n^{(0)}$, $E_n^{(0)}$.
2. Treat the perturbation term $H'$ (patch) as a small quantity.
3. Correct the energy and wave function order by order.

First-order energy correction:

$$
E_n^{(1)} = \langle \psi_n^{(0)} | H' | \psi_n^{(0)} \rangle
$$

In programming terms: evaluate the effect of the patch on the original wave function and take the expectation value.

```python
def perturbation_correction(psi_0, H_prime, order=1):
    """
    Perturbation theory: compute energy corrections
    psi_0:   unperturbed wave function (output of the main program)
    H_prime: perturbation Hamiltonian (the patch)
    """
    if order == 1:
        # First-order correction: <psi_0|H'|psi_0>
        return expectation_value(psi_0, H_prime)
    elif order == 2:
        # Second-order correction: sum |<psi_m|H'|psi_0>|^2 / (E_0 - E_m)
        ...
```

---

## AI Workshop: Zeeman Effect Energy Level Splitting

```{code-cell} ipython3
import numpy as np
import matplotlib.pyplot as plt

def lande_g(j, l, s=0.5):
    """Compute the Lande g-factor"""
    if j == 0:
        return 0
    return 1 + (j*(j+1) + s*(s+1) - l*(l+1)) / (2*j*(j+1))

def zeeman_splitting(n, l, B_range):
    """
    Compute the Zeeman splitting for a given (n, l) state in an external magnetic field.
    Returns the energy of each sub-level (relative to the field-free energy).
    """
    s = 0.5
    mu_B = 5.788e-5  # eV/T

    levels = {}
    for j in [l + s, abs(l - s)]:
        if j < 0:
            continue
        g = lande_g(j, l)
        for mj in np.arange(-j, j+1, 1):
            label = f"j={j:.0f}/2, mj={mj:+.0f}/2" if j % 1 else f"j={j:.0f}, mj={mj:+.0f}"
            # Using half-integers in practice
            levels[(j, mj)] = g * mj * mu_B * B_range

    return levels

# Sodium D line: 3p -> 3s transition splitting in a magnetic field
fig, axes = plt.subplots(1, 2, figsize=(14, 8))
B = np.linspace(0, 2, 100)  # Magnetic field 0-2 T

# 3p state (l=1): j=3/2 and j=1/2
ax = axes[0]
ax.set_title('Zeeman Splitting of the 3p State')
s = 0.5
mu_B = 5.788e-5  # eV/T

for j in [1.5, 0.5]:
    g = lande_g(j, l=1)
    for mj in np.arange(-j, j+1, 1):
        E_offset = 0 if j == 1.5 else -0.002  # Spin-orbit splitting (schematic)
        E = E_offset + g * mj * mu_B * B
        label = f'j={j}, $m_j$={mj:+.1f}'
        color = 'blue' if j == 1.5 else 'red'
        ax.plot(B, E * 1000, color=color, label=label)  # meV

ax.set_xlabel('Magnetic Field B (T)')
ax.set_ylabel('Energy Shift (meV)')
ax.legend(fontsize=7, ncol=2)
ax.grid(True, alpha=0.3)

# 3s state (l=0): only j=1/2
ax = axes[1]
ax.set_title('Zeeman Splitting of the 3s State')
g = lande_g(0.5, l=0)
for mj in [-0.5, 0.5]:
    E = g * mj * mu_B * B
    ax.plot(B, E * 1000, 'green', label=f'j=1/2, $m_j$={mj:+.1f}')

ax.set_xlabel('Magnetic Field B (T)')
ax.set_ylabel('Energy Shift (meV)')
ax.legend(fontsize=9)
ax.grid(True, alpha=0.3)

plt.suptitle('Zeeman Effect of the Sodium D Line', fontsize=14)
plt.tight_layout()
plt.savefig('zeeman_effect.png', dpi=150)
plt.show()

# Print Lande g-factors
print("Lande g-factors:")
print(f"  3s (l=0, j=1/2): g = {lande_g(0.5, 0):.3f}")
print(f"  3p (l=1, j=1/2): g = {lande_g(0.5, 1):.3f}")
print(f"  3p (l=1, j=3/2): g = {lande_g(1.5, 1):.3f}")
```

---

## Discussion Questions

1. Why is it called the "anomalous" Zeeman effect? Historically, which effect was discovered first? From the perspective of modern quantum mechanics, which one is truly "normal"?

2. The fine structure arises from spin-orbit coupling, a relativistic effect. Why do relativistic effects become important at the atomic scale?

3. The Lamb shift (the energy difference between $2s_{1/2}$ and $2p_{1/2}$) cannot be explained by the Dirac equation and requires quantum electrodynamics. What is the significance of this discovery for physics?

4. Fine structure, hyperfine structure, Lamb shift in atomic spectra... What do these increasingly smaller corrections reveal? What does the "precision" of a physical theory mean?
