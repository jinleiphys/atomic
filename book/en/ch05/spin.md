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

# 5.1 The Hidden Bit

> **Algorithm Goal:** Understand spin as an intrinsic quantum number of the electron, how it adds a binary degree of freedom to quantum states, and its fundamental difference from classical rotation.

---

## Carbon Story: The Stern-Gerlach Experiment

### Experimental Design

In 1922, Otto Stern and Walther Gerlach designed an ingenious experiment:

1. Silver atoms were evaporated to form an atomic beam.
2. The beam was passed through an **inhomogeneous magnetic field** (a magnetic field with a spatial gradient in its strength).
3. The deposition pattern of the beam on a screen was observed.

### Classical Expectation vs. Experimental Result

If a silver atom possesses a magnetic moment $\mu$, it will experience a force $F_z = \mu_z \frac{\partial B}{\partial z}$ in an inhomogeneous magnetic field.

- **Classical expectation**: The direction of the atomic magnetic moment is random, and $\mu_z$ can take continuous values ranging from $-\mu$ to $+\mu$. Therefore, the beam should produce a **continuously broadened streak** on the screen.
- **Experimental result**: The beam **splits into exactly two beams**, corresponding to only two discrete values of $\mu_z$.

Two beams! Not three, not five, exactly two.

### The Uhlenbeck-Goudsmit Hypothesis

For the outermost electron of silver (5s), $l=0$, and the orbital magnetic moment is zero. Yet the experiment clearly showed a nonzero magnetic moment with only two possible values.

In 1925, George Uhlenbeck and Samuel Goudsmit proposed that **the electron possesses an intrinsic angular momentum** called **spin**, with spin quantum number $s = 1/2$.

Spin angular momentum:

$$
|\mathbf{S}| = \sqrt{s(s+1)}\hbar = \frac{\sqrt{3}}{2}\hbar
$$

The $z$-component has only two possible values:

$$
S_z = m_s\hbar, \quad m_s = +\frac{1}{2} \text{ (spin up) or } -\frac{1}{2} \text{ (spin down)}
$$

### Spin Magnetic Moment

The magnetic moment produced by spin is:

$$
\mu_s = -g_s \frac{e}{2m_e} S_z = -g_s m_s \mu_B
$$

where $g_s \approx 2$ is the electron's **$g$-factor** (Lande $g$-factor). This value cannot be explained by classical theory; it emerges from the Dirac equation (relativistic quantum mechanics).

### Spin Is Not Classical Rotation

The name "spin" is misleading, as it suggests the electron is "rotating." However, if one treats the electron as a classical charged sphere, producing the experimentally observed angular momentum would require the surface velocity to exceed the speed of light.

**Spin is a purely quantum mechanical property with no classical counterpart.** It is an intrinsic attribute of the electron, just like mass and charge.

---

## Silicon Perspective: The Qubit

### Header Information

Spin adds a **binary metadata** to the electron: it does not affect the electron's orbital motion (in the non-relativistic approximation) but attaches an additional label to each quantum state.

A complete quantum state now requires **four** quantum numbers: $(n, l, m, m_s)$.

```
Quantum state = Orbital information + Spin information
|psi> = |n, l, m> (x) |m_s>

Spin states:
  |up>   = |m_s = +1/2>   ->  "spin up"    ->  bit 1
  |down> = |m_s = -1/2>   ->  "spin down"  ->  bit 0
```

### Qubit: The Fundamental Unit of Quantum Computing

Electron spin is one of the most natural implementations of a **quantum bit (qubit)**. The fundamental differences from a classical bit:

| | Classical Bit | Quantum Bit (Qubit)|
|---|---------|-----------------|
| State | 0 or 1 | $\alpha\|up\rangle + \beta\|down\rangle$ (superposition) |
| Readout | Non-destructive | Destructive (collapse)|
| Copying | Possible | Impossible (no-cloning theorem)|
| Information capacity | 1 bit | 1 qubit (infinitely many superposition states)|

Superposition of spin states:

$$
|\psi\rangle = \alpha|{\uparrow}\rangle + \beta|{\downarrow}\rangle, \quad |\alpha|^2 + |\beta|^2 = 1
$$

Before measurement, the spin is "both up and down" (superposition). After measurement, it collapses to either $|{\uparrow}\rangle$ or $|{\downarrow}\rangle$, with probabilities $|\alpha|^2$ and $|\beta|^2$, respectively.

```{code-cell} ipython3
import numpy as np

# Spin state representation
spin_up = np.array([1, 0])    # |up>
spin_down = np.array([0, 1])  # |down>

# Superposition state: |psi> = (|up> + |down>) / sqrt(2)
psi = (spin_up + spin_down) / np.sqrt(2)

# Pauli matrices (spin operators)
sigma_x = np.array([[0, 1], [1, 0]])
sigma_y = np.array([[0, -1j], [1j, 0]])
sigma_z = np.array([[1, 0], [0, -1]])

# Expectation value of S_z
Sz_expect = np.real(psi.conj() @ sigma_z @ psi)
print(f"<S_z> = {Sz_expect} hbar/2")  # Output: 0 (equal probability up and down)

# Probability of measuring S_z = +hbar/2
prob_up = abs(psi @ spin_up.conj())**2
print(f"P(up) = {prob_up}")  # Output: 0.5
```

---

## Discussion Questions

1. Why can spin not be explained by classical rotation? What difficulties arise if one treats the electron as a classical rotating charged sphere?

2. In the Stern-Gerlach experiment, the atomic beam splits into two beams, indicating that the orientation of spin in space is "quantized." But if we measure along different directions, each time obtaining only two values, what is the relationship between these measurement results?

3. Spin is a type of "intrinsic angular momentum" unrelated to spatial motion. How does this property connect to relativity? Why does the Dirac equation "naturally" give rise to spin?

4. Two spin-1/2 particles can combine into spin 0 (singlet) or spin 1 (triplet). What is the physical significance of this angular momentum coupling? How does it relate to chemical bond formation?
