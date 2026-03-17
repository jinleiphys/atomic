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

# 5.2 Fine Structure and the Zeeman Effect

## Fine Splitting of Spectral Lines

If one observes the emission spectrum of sodium with an ordinary spectrometer, the most conspicuous feature is undoubtedly the bright yellow D line at a wavelength of approximately 589 nm. But when a higher-resolution instrument is brought to bear on what appears to be a single line, it reveals itself to be not one line but two, separated by a very small interval: the $D_1$ line at 589.592 nm and the $D_2$ line at 588.995 nm. The wavelength difference is a mere 0.597 nm, yet these are unambiguously two independent spectral lines, each with its own well-defined frequency and intensity. This phenomenon is not unique to sodium. Similar doublet structures appear in the spectra of all alkali metal atoms, and an analogous splitting exists in the hydrogen spectrum as well, though the magnitude of the splitting is even smaller. This subtle splitting of spectral lines is what physicists call the fine structure.

The physical origin of the fine structure lies in spin-orbit coupling. To understand the nature of this coupling, it is helpful to adopt the electron's point of view. Inside an atom, the electron moves around the nucleus (or more precisely, the electron's probability distribution is spread around the nucleus). If we momentarily switch to the electron's rest frame, from the electron's perspective the positively charged nucleus appears to be orbiting around it. A moving charge is equivalent to a current, and a current generates a magnetic field in the surrounding space. Thus, in the electron's reference frame, it "experiences" an internal magnetic field $\mathbf{B}_{\text{int}}$ produced by the relative motion of the nucleus. The electron's own spin magnetic moment $\boldsymbol{\mu}_s$ acquires additional potential energy in this internal magnetic field, and this is the origin of spin-orbit coupling. The Hamiltonian for this interaction can be written as:

$$
H_{SO} = -\boldsymbol{\mu}_s \cdot \mathbf{B}_{\text{int}} \propto \mathbf{L} \cdot \mathbf{S}
$$

The spin-orbit coupling energy is proportional to $\mathbf{L} \cdot \mathbf{S}$, the dot product of the orbital angular momentum and the spin angular momentum. When the spin and orbital angular momenta are more nearly aligned (their angle is small), $\mathbf{L} \cdot \mathbf{S}$ is positive and the coupling energy takes one value; when they are more nearly anti-aligned, $\mathbf{L} \cdot \mathbf{S}$ is negative and the coupling energy takes a different value. This causes what was originally a single degenerate energy level to split into two.

It should be noted that the derivation from the "electron's rest frame" perspective, while intuitively very clear, is strictly speaking an approximation. The electron's frame is an accelerating reference frame (since the electron follows a curved trajectory), and directly applying electromagnetic laws in this frame introduces an additional correction factor known as the Thomas precession. In 1926 Thomas pointed out that, due to the nontrivial transformation properties of accelerating frames in special relativity, the naive frame transformation overestimates the spin-orbit coupling by exactly a factor of two, and the Thomas precession contributes a correction factor of $1/2$. Spin-orbit coupling is therefore essentially a relativistic effect, and its complete derivation requires either the Dirac equation or at least proper accounting of special-relativistic kinematic effects.

Because spin-orbit coupling means that $\mathbf{L}$ and $\mathbf{S}$ are no longer independently conserved, we must introduce a new quantity, the total angular momentum:

$$
\mathbf{J} = \mathbf{L} + \mathbf{S}
$$

Like $\mathbf{L}$ and $\mathbf{S}$, the magnitude of $\mathbf{J}$ is quantized. The possible values of the total angular momentum quantum number $j$ are determined by the rules of angular momentum coupling:

$$
j = l + s = l + \frac{1}{2} \quad \text{or} \quad j = l - s = l - \frac{1}{2} \quad (l \geq 1)
$$

For $l = 0$ (an $s$-state electron), the spin has no orbital "partner" to couple with, only $j = 1/2$ is possible, and no fine-structure splitting occurs. For any state with $l \geq 1$, however, each energy level is split into two sub-levels corresponding to $j = l + 1/2$ and $j = l - 1/2$.

Returning to the sodium D line: the $3p$ state ($l = 1$) of sodium is split by spin-orbit coupling into $3p_{3/2}$ ($j = 3/2$) and $3p_{1/2}$ ($j = 1/2$), while the $3s$ state ($l = 0$) remains unsplit at $3s_{1/2}$. The transition from $3p$ to $3s$ therefore produces two spectral lines rather than one: the transition from $3p_{3/2}$ to $3s_{1/2}$ gives the $D_2$ line, and the transition from $3p_{1/2}$ to $3s_{1/2}$ gives the $D_1$ line.

$$
3p_{3/2} \to 3s_{1/2}: \quad D_2 \text{ line}
$$
$$
3p_{1/2} \to 3s_{1/2}: \quad D_1 \text{ line}
$$

The story of fine structure does not end here. When an atom is placed in an external magnetic field $\mathbf{B}$, the energy levels undergo further splitting. This is the Zeeman effect, named after the Dutch physicist Pieter Zeeman. The discovery of the Zeeman effect has a winding history. In 1896, working at the University of Leiden, Zeeman observed that when a light source was placed between the poles of a strong magnet, the sodium D lines showed a noticeable broadening. His advisor Hendrik Lorentz quickly provided an explanation using classical electron theory: charged particles precessing in a magnetic field would shift their radiation frequencies. Lorentz's theory predicted that each spectral line should split into three components in a magnetic field, what later came to be called the "normal Zeeman effect." Zeeman and Lorentz shared the 1902 Nobel Prize in Physics for this discovery.

However, as experimental physicists examined more spectral lines in magnetic fields, the situation became more complicated. Most lines did not follow Lorentz's "three-line" prediction but instead displayed more complex multi-line patterns. These disobedient splitting patterns were termed the "anomalous Zeeman effect," and for over twenty years they remained one of theoretical physics' persistent puzzles. Only after the discovery of electron spin and the establishment of quantum mechanics was it finally understood that the so-called "anomalous" Zeeman effect is actually the general case, while the "normal" effect predicted by Lorentz is the special one, occurring only when the atom's total spin is zero ($S = 0$). The labels "normal" and "anomalous" in physics sometimes turn out to be the reverse of how common each phenomenon actually is.

In an external magnetic field, different values of the $z$-component $m_j$ of the total angular momentum $\mathbf{J}$ correspond to different energies. The Zeeman splitting energy is:

$$
\Delta E = g_j m_j \mu_B B
$$

where the Lande $g$-factor is:

$$
g_j = 1 + \frac{j(j+1) + s(s+1) - l(l+1)}{2j(j+1)}
$$

Each level with a definite value of $j$ splits into $2j+1$ sub-levels in the magnetic field, corresponding to the $2j+1$ values of $m_j$ ranging from $-j$ to $+j$. When the atom's total spin $S = 0$, we have $g_j = 1$, the splittings of all levels are perfectly uniform, and the transition selection rules cause each spectral line to split into exactly three components, which is the normal Zeeman effect. When $S \neq 0$ (the general case where spin participates in the coupling), the value of $g_j$ depends on the specific combination of $j$, $l$, and $s$, the splittings of the upper and lower levels are no longer simply equal, and the number and arrangement of transition lines become varied and complex, which is the anomalous Zeeman effect.

## Silicon Perspective: Perturbation Theory as Patching the System

From a software engineering perspective, the development of the hydrogen atom's energy level structure resembles the version history of a software product. The initial v1.0 release was the Bohr model (covered in Chapter 2), whose core code (the main program) was the Coulomb potential $V(r) = -e^2/r$, producing an output of $E_n = -13.6/n^2$ eV with a precision of roughly $10^{-1}$ eV. The upgrade to v2.0 (the Schrodinger equation from Chapter 4) did not change the physical core of the main program (still non-relativistic quantum mechanics with the same Coulomb potential), and the energy level formula remained the same as the Bohr model's, but the system gained a crucial new output: complete and exact wave functions, still at the $10^{-1}$ eV precision level. With the v2.1 release (the fine structure patch of this chapter), the system installed three patch packages: the spin-orbit coupling term $H_{SO} \sim \mathbf{L} \cdot \mathbf{S}$, the relativistic kinetic energy correction, and the Darwin term. These patches modified the energy formula to $E_{nj} = E_n + \Delta E(j)$, where the correction depends on the total angular momentum quantum number $j$, boosting system precision to $10^{-5}$ eV. After further installing the v2.2 patch (the Zeeman effect), the external field coupling term $-\boldsymbol{\mu} \cdot \mathbf{B}$ is added, expanding the energy formula to $E_{njm} = E_{nj} + g_j m_j \mu_B B$, with precision reaching $10^{-6}$ eV depending on the field strength.

This methodology of "progressively layering small corrections on top of existing results" is systematized in quantum mechanics as perturbation theory. The algorithmic logic of perturbation theory is very clear: first, solve the unperturbed system (the "main program") exactly, obtaining the zeroth-order wave functions $\psi_n^{(0)}$ and zeroth-order energies $E_n^{(0)}$. Then, treat the perturbation term $H'$ (the "patch") as a small quantity relative to the main Hamiltonian. Finally, compute corrections to the energy and wave function order by order.

The first-order energy correction takes a particularly elegant form:

$$
E_n^{(1)} = \langle \psi_n^{(0)} | H' | \psi_n^{(0)} \rangle
$$

Translating this formula into programming language: "evaluate" the effect of the patch $H'$ on the original wave function (the output of the main program) and take its expectation value. Conceptually, this is equivalent to running a test function on the old version's output to estimate how much change the new patch will introduce.

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

## Discussion Questions

1. Why is it called the "anomalous" Zeeman effect? Historically, which effect was discovered first? From the perspective of modern quantum mechanics, which one is truly "normal"?

2. The fine structure arises from spin-orbit coupling, a relativistic effect. Why do relativistic effects become important at the atomic scale?

3. The Lamb shift (the energy difference between $2s_{1/2}$ and $2p_{1/2}$) cannot be explained by the Dirac equation and requires quantum electrodynamics. What is the significance of this discovery for physics?

4. Fine structure, hyperfine structure, Lamb shift in atomic spectra... What do these increasingly smaller corrections reveal? What does the "precision" of a physical theory mean?
