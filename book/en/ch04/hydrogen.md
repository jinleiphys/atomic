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

# 4.3 The Quantum Mechanical Solution of the Hydrogen Atom

## Separation of Variables and Quantum Numbers

The hydrogen atom is one of the most important exactly solvable problems in quantum mechanics. In the hydrogen atom, the electron resides in the Coulomb potential of the nucleus:

$$
V(r) = -\frac{e^2}{4\pi\epsilon_0 r}
$$

This potential depends only on the electron-nucleus distance $r$ and possesses perfect spherical symmetry. The time-independent Schrodinger equation in spherical coordinates reads:

$$
-\frac{\hbar^2}{2m_e}\left[\frac{1}{r^2}\frac{\partial}{\partial r}\left(r^2 \frac{\partial \psi}{\partial r}\right) + \frac{1}{r^2\sin\theta}\frac{\partial}{\partial \theta}\left(\sin\theta\frac{\partial \psi}{\partial \theta}\right) + \frac{1}{r^2\sin^2\theta}\frac{\partial^2 \psi}{\partial \phi^2}\right] - \frac{e^2}{4\pi\epsilon_0 r}\psi = E\psi
$$

Since the potential depends only on $r$ (spherical symmetry), the wavefunction can be separated into a product of radial and angular parts:

$$
\psi_{nlm}(r, \theta, \phi) = R_{nl}(r) \cdot Y_l^m(\theta, \phi)
$$

Here $R_{nl}(r)$ is the radial wavefunction, which determines the radial distribution of the electron from the nucleus, and $Y_l^m(\theta, \phi)$ are the spherical harmonics, which determine the angular shape of the electron cloud. This method of separation of variables reduces a single three-dimensional partial differential equation into several more tractable ordinary differential equations. The spherical harmonics $Y_l^m$ are eigenfunctions of the Laplace equation on the sphere, and they appear ubiquitously in mathematical physics, from multipole expansions in electromagnetism to gravitational field analysis in geophysics.

The process of separation of variables naturally introduces three quantum numbers, which mathematically constrain the form of the wavefunction while physically determining all characteristics of the electron's state. The principal quantum number $n$ can take any positive integer value 1, 2, 3, ..., and it determines the electron's energy as well as the overall size of the orbital. The larger $n$ is, the farther the electron is from the nucleus and the higher the energy (smaller in absolute value). The angular momentum quantum number $l$ ranges from $0, 1, 2, \ldots, n-1$, and it determines the magnitude of the electron's orbital angular momentum $|\mathbf{L}| = \hbar\sqrt{l(l+1)}$ as well as the angular shape of the electron cloud. The magnetic quantum number $m$ ranges from $-l, -l+1, \ldots, 0, \ldots, l-1, l$, giving $2l+1$ values in total, and it determines the $z$-component of angular momentum $L_z = m\hbar$. These three quantum numbers are not introduced by hand; they are the inevitable result of the mathematical requirements that the wavefunction be single-valued, finite, and normalizable.

The energy of the hydrogen atom depends only on the principal quantum number:

$$
E_n = -\frac{13.6 \text{ eV}}{n^2}
$$

This is completely consistent with the result from the Bohr model! But now it is rigorously derived from the Schrodinger equation, rather than being an ad hoc assumption. The seemingly arbitrary quantization conditions of the Bohr model -- that angular momentum must be an integer multiple of $\hbar$ -- emerge naturally within the framework of the Schrodinger equation as mathematical consequences of the boundary conditions.

For a given $n$, there are $n^2$ different $(l, m)$ combinations (not counting spin), all sharing the same energy. This **degeneracy** is a consequence of the special symmetry of the Coulomb potential ($O(4)$ symmetry). Specifically, when $n = 1$, $l$ can only be 0, so there is just one state, called the 1s state. When $n = 2$, $l$ can be 0 or 1, yielding one state with $l=0$ (the 2s) plus three states with $l=1, m=-1,0,+1$ (the 2p), for a total of 4 states. When $n = 3$, $l$ can be 0, 1, or 2, giving 1 + 3 + 5 = 9 states, named 3s, 3p, and 3d respectively. The letters s, p, d, f originate from early spectroscopists' descriptive naming of spectral line series. When $l = 0$, the orbital is called an s orbital, the letter coming from the word "sharp" in early spectroscopy, because the s series of spectral lines appeared sharp in the spectrum. When $l = 1$, the orbital is called a p orbital, from "principal." When $l = 2$, the orbital is called a d orbital, from "diffuse." When $l = 3$, the orbital is called an f orbital, from "fundamental." Beyond that, the naming continues alphabetically: g, h, i, and so on. Although this naming convention is somewhat archaic, it remains in widespread use throughout atomic physics and chemistry to this day.

The orbital motion of the electron produces a magnetic moment:

$$
\boldsymbol{\mu}_l = -\frac{e}{2m_e}\mathbf{L}
$$

The $z$-component of the magnetic moment:

$$
\mu_z = -m_l \mu_B, \quad \mu_B = \frac{e\hbar}{2m_e} = 9.274 \times 10^{-24} \text{ J/T}
$$

where $\mu_B$ is the **Bohr magneton**, the natural unit of atomic magnetic moments. The existence of the orbital magnetic moment explains why spectral lines split in a magnetic field -- this is the normal Zeeman effect. When an atom is placed in an external magnetic field, states with different values of $m$ acquire different energies, so the originally degenerate energy level is split into $2l+1$ sub-levels, and the corresponding spectral lines split accordingly.

## Silicon Perspective: Spherical Harmonics as 3D Rendering Parameters

$(n, l, m)$ are not abstract numbers, but three "rendering parameters" that define the geometric topology of the wavefunction. The principal quantum number $n$ controls the radial extent of the wavefunction -- how large the electron cloud is -- and simultaneously determines the number of radial nodes (there are $n-l-1$ spherical nodes in total). Nodes are surfaces where the wavefunction vanishes, much like the stationary points on a vibrating string; the larger $n$ is, the more radial oscillations there are, and the more nodes appear. The angular momentum quantum number $l$ controls the angular complexity of the wavefunction -- how many angular nodal surfaces the electron cloud possesses. When $l=0$ the electron cloud is spherical (isotropic), when $l=1$ it is dumbbell-shaped (with one angular nodal surface), when $l=2$ it is cloverleaf-shaped (two angular nodal surfaces), and as $l$ increases, the angular structure becomes progressively more intricate. The magnetic quantum number $m$ controls the rotational symmetry of the wavefunction about the $z$-axis. When $m=0$, the wavefunction has rotational symmetry about the $z$-axis; when $m \neq 0$, this symmetry is broken and the wavefunction exhibits oscillatory structure in the azimuthal direction.

In the language of computer graphics, $n$ is analogous to the zoom level, setting the overall scale of the rendered scene; $l$ is analogous to the polygon count, determining how complex the shape is; and $m$ is analogous to the azimuthal orientation, determining how the shape is oriented in space. The traditional s, p, d, f naming comes from spectroscopy history (sharp, principal, diffuse, fundamental), but from a geometric viewpoint, their meaning is more intuitive: s orbitals ($l=0$) are spherical, with no angular nodal surfaces, completely isotropic; p orbitals ($l=1$) are dumbbell-shaped, with one angular nodal surface, possessing clear directionality; d orbitals ($l=2$) are cloverleaf-shaped, with two angular nodal surfaces, exhibiting more complex directionality; and f orbitals ($l=3$) are even more intricate, with three angular nodal surfaces. As $l$ increases, the shape of the electron cloud is like a 3D model with an ever-increasing polygon count, revealing finer and finer angular detail.

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

## Discussion Questions

1. The energy levels of the hydrogen atom depend only on the principal quantum number $n$ and not on the angular momentum quantum number $l$. Where does this "accidental degeneracy" come from? What is special about the Coulomb potential?

2. What is the relationship between the shape of electron clouds (s, p, d orbitals) and the directionality of chemical bonds? Why can a carbon atom form tetrahedral covalent bonds?

3. What is the fundamental difference between the quantum mechanical picture of the hydrogen atom and the Bohr model? Does the concept of "electron orbit" still have meaning?

4. The hydrogen atom problem can be solved exactly, but the helium atom (two electrons) cannot. Why does adding one more electron make the problem so much more difficult?
