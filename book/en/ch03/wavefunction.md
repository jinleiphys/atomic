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

# 3.3 The State Database

> **Algorithm Goal:** Understand the role of the wave function $\psi$ as an "information carrier." It is not a physical entity but a complete database encoding the probability of a particle appearing at each point in space.

---

## Carbon Story: Does God Play Dice?

### Schrodinger's Wave and Born's Probability

In 1926, Schrodinger wrote down the wave equation (see Chapter 4 in detail), and the wave function $\psi(x,t)$ became the central object of quantum mechanics. But what is the physical meaning of $\psi$?

Schrodinger himself hoped that $\psi$ represented some real physical wave, analogous to the electric field in electromagnetism. But this interpretation quickly ran into difficulties: $\psi$ is a complex number, and for multi-particle systems, $\psi$ lives in a high-dimensional configuration space, not as a wave in three-dimensional physical space.

In 1926, Born (Max Born) proposed the **statistical interpretation**:

$$
|\psi(x,t)|^2 \, dx = \text{the probability of finding the particle between } x \text{ and } x+dx
$$

$\psi$ itself is not an observable, but $|\psi|^2$ is a **probability density function (PDF)**.

This means:

- Quantum mechanics does not predict the outcome of a single measurement; it only predicts **statistical distributions**.
- If one performs a large number of identical measurements on the same quantum state, the results follow the distribution given by $|\psi|^2$.
- The outcome of a single measurement is **intrinsically random**, not because we lack information.

### Einstein's Objection

Einstein opposed this interpretation for the rest of his life. His famous pronouncement was:

> "God does not play dice."

He believed that quantum mechanics was incomplete and that some "hidden variables" must underlie the seemingly random outcomes.

Bohr's reply was equally famous:

> "Einstein, stop telling God what to do."

Later Bell inequality experiments (1982, Aspect et al.) conclusively ruled out local hidden variable theories and confirmed the intrinsic randomness of quantum mechanics.

### Properties of the Wave Function

As the mathematical carrier of probability, the wave function must satisfy:

1. **Normalization condition**:

$$
\int_{-\infty}^{\infty} |\psi(x)|^2 \, dx = 1
$$

The particle must be somewhere; the total probability is 1.

2. **Superposition principle**: If $\psi_1$ and $\psi_2$ are valid wave functions, then $c_1\psi_1 + c_2\psi_2$ is also a valid wave function. This leads to interference effects, the most central feature of quantum mechanics.

3. **Continuity**: $\psi$ and $d\psi/dx$ are continuous in space (except at infinite potential barriers).

---

## Silicon Perspective: Probability Density Functions and Heatmaps

### From Clockwork to Cloud Databases

In classical mechanics, the state of a particle is a precise point $(x, p)$, like a pointer indicating a definite position (clockwork).

In quantum mechanics, the state of a particle is a **distribution** $|\psi(x)|^2$, like a heatmap that tells you the relative probability of each position being "sampled."

```
Classical state:  Particle at x = 3.0
            ↓ Deterministic
            |       |
            |   ^   |
            |   |   |
            +---*---+->  x
                3.0

Quantum state:  Particle "spread" across space
            ↓ Probability density
            |  .---.
            | /     \
            |/       \
            +---------->  x
              |ψ(x)|²
```

An atom is not a "clockwork" with an electron orbiting on a definite track. It is a "cloud database" of electron probability density distribution: the electron cloud.

### The Wave Function as an Information Carrier

$\psi(x)$ encodes **all information** about the particle. Any physical quantity you wish to know can be extracted by applying the corresponding operator to $\psi$ (see Chapter 4 for details):

```python
# Pseudocode: extracting physical information from the wave function
state = Wavefunction(psi)

# Expectation value of position
x_avg = state.query(operator="position")  # integral psi* x psi dx

# Expectation value of momentum
p_avg = state.query(operator="momentum")  # integral psi* (-i*hbar d/dx) psi dx

# Expectation value of energy
E_avg = state.query(operator="hamiltonian")  # integral psi* H psi dx
```

$\psi$ is like a database, and operators are like SQL queries. You use different queries to extract different information from the same database.

---

## AI Workshop: Visualizing the Hydrogen Atom Electron Cloud

```{code-cell} ipython3
import numpy as np
import matplotlib.pyplot as plt
from scipy.special import sph_harm_y, factorial

def hydrogen_radial(n, l, r):
    """Hydrogen atom radial wave function R_nl(r) (simplified)"""
    a0 = 1  # Bohr radius as unit
    rho = 2 * r / (n * a0)
    # Simplified normalization calculation
    from scipy.special import assoc_laguerre
    norm = np.sqrt((2/(n*a0))**3 * factorial(n-l-1) / (2*n*factorial(n+l)**3))
    return norm * np.exp(-rho/2) * rho**l * assoc_laguerre(rho, n-l-1, 2*l+1)

def prob_density_2d(n, l, m, N=500):
    """Compute the probability density on the xz plane"""
    x = np.linspace(-25, 25, N)
    z = np.linspace(-25, 25, N)
    X, Z = np.meshgrid(x, z)
    R = np.sqrt(X**2 + Z**2) + 1e-10
    Theta = np.arccos(Z / R)

    Rnl = hydrogen_radial(n, l, R)
    Ylm = sph_harm_y(l, m, Theta, 0).real  # phi=0 cross-section
    psi = Rnl * Ylm
    return X, Z, np.abs(psi)**2

# Plot several orbitals
orbitals = [(1,0,0), (2,0,0), (2,1,0), (3,2,0)]
names = ['1s', '2s', '2p', '3d']

fig, axes = plt.subplots(1, 4, figsize=(16, 4))

for ax, (n,l,m), name in zip(axes, orbitals, names):
    X, Z, prob = prob_density_2d(n, l, m)
    ax.pcolormesh(X, Z, prob, cmap='hot', shading='auto')
    ax.set_aspect('equal')
    ax.set_title(f'{name} (n={n}, l={l}, m={m})')
    ax.set_xlabel('x / a₀')
    ax.set_ylabel('z / a₀')

plt.suptitle('Hydrogen Atom Electron Cloud |ψ(r,θ)|² Cross-section', fontsize=13)
plt.tight_layout()
plt.savefig('electron_clouds.png', dpi=150)
plt.show()
```

---

## Exercises

1. How does the superposition principle of wave functions explain the double-slit interference experiment? Why do "superposition of probabilities" and "superposition of probability amplitudes" give different results?

2. The wave function $\psi$ is a complex number, yet all observables are real numbers. What role does the complex number play in quantum mechanics? Could quantum mechanics be constructed with real-valued wave functions?

3. What does the "collapse" of the wave function mean? How does measurement change the wave function? Is this process described by the Schrodinger equation?

4. Does the wave function describe a single particle or an ensemble of particles? Is the "probability interpretation" a statement about our knowledge, or a statement about physical reality?
