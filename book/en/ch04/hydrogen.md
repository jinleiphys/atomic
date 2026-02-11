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

# 4.3 The 3D Rendered Solution

> **Algorithm Goal:** Solve the time-independent Schrodinger equation for the hydrogen atom, and understand how the quantum numbers $(n, l, m)$ define the geometric topology of the wavefunction.

---

## Carbon Story: Separation of Variables and Quantum Numbers

### The Schrodinger Equation for the Hydrogen Atom

In the hydrogen atom, the electron resides in the Coulomb potential of the nucleus:

$$
V(r) = -\frac{e^2}{4\pi\epsilon_0 r}
$$

The time-independent Schrodinger equation (in spherical coordinates):

$$
-\frac{\hbar^2}{2m_e}\left[\frac{1}{r^2}\frac{\partial}{\partial r}\left(r^2 \frac{\partial \psi}{\partial r}\right) + \frac{1}{r^2\sin\theta}\frac{\partial}{\partial \theta}\left(\sin\theta\frac{\partial \psi}{\partial \theta}\right) + \frac{1}{r^2\sin^2\theta}\frac{\partial^2 \psi}{\partial \phi^2}\right] - \frac{e^2}{4\pi\epsilon_0 r}\psi = E\psi
$$

### Separation of Variables

Since the potential depends only on $r$ (spherical symmetry), the wavefunction can be separated as:

$$
\psi_{nlm}(r, \theta, \phi) = R_{nl}(r) \cdot Y_l^m(\theta, \phi)
$$

- $R_{nl}(r)$: the radial wavefunction, which determines the radial distribution of the electron from the nucleus.
- $Y_l^m(\theta, \phi)$: the spherical harmonics, which determine the angular shape of the electron cloud.

### Three Quantum Numbers

The separation of variables naturally introduces three quantum numbers:

| Quantum number | Name | Range of values | Physical meaning |
|--------|------|----------|----------|
| $n$ | Principal quantum number | $1, 2, 3, \ldots$ | Determines the energy and orbital size |
| $l$ | Angular momentum quantum number | $0, 1, \ldots, n-1$ | Determines the magnitude of angular momentum and orbital shape |
| $m$ | Magnetic quantum number | $-l, \ldots, 0, \ldots, +l$ | Determines the $z$-component of angular momentum |

### Energy Levels

The energy of the hydrogen atom depends only on the principal quantum number:

$$
E_n = -\frac{13.6 \text{ eV}}{n^2}
$$

This is completely consistent with the result from the Bohr model! But now it is rigorously derived from the Schrodinger equation, rather than being an ad hoc assumption.

### Degeneracy

For a given $n$, there are $n^2$ different $(l, m)$ combinations (not counting spin), all sharing the same energy. This **degeneracy** is a consequence of the special symmetry of the Coulomb potential ($O(4)$ symmetry).

| $n$ | Values of $l$ | Number of states | Orbital names |
|-----|---------|--------|----------|
| 1 | 0 | 1 | 1s |
| 2 | 0, 1 | 4 | 2s, 2p |
| 3 | 0, 1, 2 | 9 | 3s, 3p, 3d |

### Orbital Magnetic Moment

The orbital motion of the electron produces a magnetic moment:

$$
\boldsymbol{\mu}_l = -\frac{e}{2m_e}\mathbf{L}
$$

The $z$-component of the magnetic moment:

$$
\mu_z = -m_l \mu_B, \quad \mu_B = \frac{e\hbar}{2m_e} = 9.274 \times 10^{-24} \text{ J/T}
$$

where $\mu_B$ is the **Bohr magneton**. This explains why spectral lines split in a magnetic field (the normal Zeeman effect).

---

## Silicon Perspective: Spherical Harmonics as 3D Rendering Parameters

### Quantum Numbers = Geometric Parameters of the Wavefunction

$(n, l, m)$ are not abstract numbers, but three "rendering parameters" that define the geometric topology of the wavefunction:

- **$n$ (principal quantum number)**: controls the **radial extent** of the wavefunction (how large the electron cloud is) and the **number of radial nodes** ($n-l-1$ spherical nodes).
- **$l$ (angular momentum quantum number)**: controls the **angular complexity** of the wavefunction ($l$ angular nodal surfaces). $l=0$ is spherical, $l=1$ is dumbbell-shaped, $l=2$ is cloverleaf-shaped...
- **$m$ (magnetic quantum number)**: controls the **rotational symmetry** of the wavefunction about the $z$-axis. $m=0$ has rotational symmetry about the $z$-axis; $m \neq 0$ breaks this symmetry.

```
Rendering parameter mapping:

n -> scale (zoom level)
l -> angular complexity (polygon count)
m -> azimuthal orientation
```

### A CS Reading of Orbital Naming

The traditional s, p, d, f naming comes from spectroscopy history (sharp, principal, diffuse, fundamental). In modern language:

```
s orbital (l=0): spherical        -> 0 angular nodal surfaces -> isotropic
p orbital (l=1): dumbbell-shaped  -> 1 angular nodal surface  -> directional
d orbital (l=2): cloverleaf       -> 2 angular nodal surfaces -> more complex directionality
f orbital (l=3): more complex     -> 3 angular nodal surfaces
```

---

## AI Workshop: 3D Visualization of Hydrogen Orbitals

```{code-cell} ipython3
import numpy as np
import matplotlib.pyplot as plt
from matplotlib import cm
from scipy.special import sph_harm_y, assoc_laguerre, factorial

def hydrogen_wavefunction(n, l, m, r, theta, phi):
    """
    Hydrogen atom wavefunction psi_nlm(r, theta, phi)
    r is in units of Bohr radius a0
    """
    a0 = 1.0  # Bohr radius as unit
    rho = 2 * r / (n * a0)

    # Radial part
    norm_r = np.sqrt((2/(n*a0))**3 * factorial(n-l-1) / (2*n * factorial(n+l)**3))
    R = norm_r * np.exp(-rho/2) * rho**l * assoc_laguerre(rho, n-l-1, 2*l+1)

    # Angular part (spherical harmonics)
    Y = sph_harm_y(l, m, theta, phi)

    return R * Y

# Plot probability density cross-section in the xz plane
def plot_orbital_cross_section(n, l, m, ax, rmax=None):
    """Plot probability density in the xz plane (phi=0)"""
    if rmax is None:
        rmax = 2 * n**2 + 10

    N = 400
    x = np.linspace(-rmax, rmax, N)
    z = np.linspace(-rmax, rmax, N)
    X, Z = np.meshgrid(x, z)

    R = np.sqrt(X**2 + Z**2) + 1e-10
    Theta = np.arccos(np.clip(Z / R, -1, 1))
    Phi = np.zeros_like(R)

    psi = hydrogen_wavefunction(n, l, m, R, Theta, Phi)
    prob = np.abs(psi)**2

    # Log scale to enhance contrast
    prob_log = np.log10(prob + 1e-20)
    vmax = prob_log.max()

    ax.pcolormesh(X, Z, prob_log, cmap='inferno',
                  vmin=vmax-6, vmax=vmax, shading='auto')
    ax.set_aspect('equal')

    # Label the orbital name
    orbital_names = {0:'s', 1:'p', 2:'d', 3:'f'}
    name = f"{n}{orbital_names.get(l, '?')}"
    ax.set_title(f'{name}  (n={n}, l={l}, m={m})', fontsize=11)
    ax.set_xlabel('x / a\u2080')
    ax.set_ylabel('z / a\u2080')

# Plot a set of orbitals
orbitals = [
    (1, 0, 0), (2, 0, 0), (2, 1, 0), (2, 1, 1),
    (3, 0, 0), (3, 1, 0), (3, 2, 0), (3, 2, 1),
]

fig, axes = plt.subplots(2, 4, figsize=(18, 9))
for ax, (n, l, m) in zip(axes.flat, orbitals):
    plot_orbital_cross_section(n, l, m, ax)

plt.suptitle('Hydrogen Orbital Probability Density Cross-Section (xz plane, log scale)', fontsize=14)
plt.tight_layout()
plt.savefig('hydrogen_orbitals.png', dpi=150, bbox_inches='tight')
plt.show()
```

---

## Discussion Questions

1. The energy levels of the hydrogen atom depend only on the principal quantum number $n$ and not on the angular momentum quantum number $l$. Where does this "accidental degeneracy" come from? What is special about the Coulomb potential?

2. What is the relationship between the shape of electron clouds (s, p, d orbitals) and the directionality of chemical bonds? Why can a carbon atom form tetrahedral covalent bonds?

3. What is the fundamental difference between the quantum mechanical picture of the hydrogen atom and the Bohr model? Does the concept of "electron orbit" still have meaning?

4. The hydrogen atom problem can be solved exactly, but the helium atom (two electrons) cannot. Why does adding one more electron make the problem so much more difficult?
