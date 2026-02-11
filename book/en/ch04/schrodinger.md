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

# 4.1 The State Evolution Engine

> **Algorithm Goal:** Understand the role of the Schrodinger equation as the "equation of motion" in quantum mechanics, and master the eigenvalue problem structure of the time-independent Schrodinger equation.

---

## Carbon Story: Schrodinger's Inspiration

### From de Broglie to the Wave Equation

In 1926, Austrian physicist Erwin Schrodinger was inspired by de Broglie's matter wave hypothesis: if particles are waves, then there should exist a **wave equation** to describe the behavior of such waves.

Classical wave equations describe waves on strings, water waves, and sound waves. Schrodinger's goal was to find an equation describing "matter waves."

### The Time-Dependent Schrodinger Equation

The general form (time-dependent) of the Schrodinger equation is:

$$
i\hbar \frac{\partial \psi}{\partial t} = \hat{H} \psi
$$

where $\hat{H}$ is the **Hamiltonian operator**: the total energy operator of the system:

$$
\hat{H} = -\frac{\hbar^2}{2m}\nabla^2 + V(\mathbf{r}, t)
$$

The first term is the kinetic energy operator, and the second is the potential energy.

### The Time-Independent Schrodinger Equation

When the potential energy does not explicitly depend on time $V(\mathbf{r})$, one can perform separation of variables $\psi(\mathbf{r}, t) = \psi(\mathbf{r}) e^{-iEt/\hbar}$, yielding the **time-independent (stationary) Schrodinger equation**:

$$
\hat{H}\psi = E\psi
$$

Written out explicitly:

$$
-\frac{\hbar^2}{2m}\nabla^2\psi + V(\mathbf{r})\psi = E\psi
$$

This is an **eigenvalue equation**: given a potential $V(\mathbf{r})$, find all allowed energies $E$ (eigenvalues) and the corresponding wavefunctions $\psi$ (eigenfunctions).

### One-Dimensional Potential Well Example

The simplest example is the one-dimensional infinite square well (a particle confined in a box of width $L$):

$$
V(x) = \begin{cases} 0, & 0 < x < L \\ \infty, & \text{otherwise} \end{cases}
$$

The boundary conditions $\psi(0) = \psi(L) = 0$ yield:

$$
\psi_n(x) = \sqrt{\frac{2}{L}} \sin\left(\frac{n\pi x}{L}\right), \quad E_n = \frac{n^2 \pi^2 \hbar^2}{2mL^2}, \quad n = 1, 2, 3, \ldots
$$

Energy is naturally quantized; the boundary conditions force the wavefunction into specific "standing wave" modes.

---

## Silicon Perspective: Eigenvalue Problems and Recursive Algorithms

### Schrodinger Equation = Eigenvalue Problem

The structure of the equation $\hat{H}\psi = E\psi$ appears ubiquitously in mathematics and engineering: it is the **Eigenvalue Problem**.

In linear algebra, $A\mathbf{v} = \lambda\mathbf{v}$ (matrix $A$ acts on vector $\mathbf{v}$, and the result is a scalar multiple of $\mathbf{v}$). Solving this equation means finding all "eigenvectors" and "eigenvalues."

The Schrodinger equation is its continuous counterpart: the operator $\hat{H}$ replaces matrix $A$, the wavefunction $\psi$ replaces vector $\mathbf{v}$, and energy $E$ replaces eigenvalue $\lambda$.

```
Linear algebra:       A*v = lambda*v     ->  find (lambda, v)
Quantum mechanics:    H*psi = E*psi      ->  find (E, psi)
```

### The Hamiltonian = Core Algorithm

$\hat{H}$ is the "core algorithm" of the entire system; it encodes all the physical rules (how kinetic energy is computed, how potential energy is distributed). Different $V(\mathbf{r})$ define different "game rules," and the Schrodinger equation is responsible for finding all legitimate "game states" under those rules.

```python
# Pseudocode: Schrodinger equation solver
def solve_schrodinger(H, boundary_conditions):
    """
    Input: Hamiltonian H (defines physical rules)
           Boundary conditions (defines constraints)
    Output: All allowed (energy, wavefunction) pairs
    """
    eigenvalues, eigenfunctions = eigensolve(H, boundary_conditions)
    return [(E, psi) for E, psi in zip(eigenvalues, eigenfunctions)]
```

---

## AI Workshop: Numerical Solution of the 1D Potential Well

```{code-cell} ipython3
import numpy as np
import matplotlib.pyplot as plt

# Numerical solution of the 1D infinite square well
L = 1.0        # Well width (nm)
N = 1000       # Number of grid points
dx = L / (N+1)
x = np.linspace(dx, L-dx, N)

# Build the Hamiltonian matrix (finite difference)
# H = -hbar^2/(2m) d^2/dx^2  -> tridiagonal matrix
hbar2_over_2m = 0.0762  # eV*nm^2 (electron)

diag = 2 * hbar2_over_2m / dx**2 * np.ones(N)
off_diag = -hbar2_over_2m / dx**2 * np.ones(N-1)

H = np.diag(diag) + np.diag(off_diag, 1) + np.diag(off_diag, -1)

# Solve the eigenvalue problem
energies, wavefunctions = np.linalg.eigh(H)

# Plot the first 4 eigenstates
fig, axes = plt.subplots(1, 2, figsize=(14, 6))

# Energy levels
n_show = 6
for n in range(n_show):
    axes[0].hlines(energies[n], 0, 1, colors='blue', linewidth=2)
    axes[0].text(1.05, energies[n], f'n={n+1}, E={energies[n]:.3f} eV', va='center')

# Comparison with analytical values
n_arr = np.arange(1, n_show+1)
E_exact = n_arr**2 * np.pi**2 * hbar2_over_2m / L**2
for E in E_exact:
    axes[0].hlines(E, 0, 1, colors='red', linewidth=1, linestyles='--')

axes[0].set_ylabel('Energy (eV)')
axes[0].set_title('Energy Levels (blue=numerical, red dashed=analytical)')
axes[0].get_xaxis().set_visible(False)

# Wavefunctions
for n in range(4):
    psi = wavefunctions[:, n]
    psi = psi / np.sqrt(np.trapezoid(psi**2, x))  # Normalize
    axes[1].plot(x, psi + energies[n]*5, label=f'n={n+1}')

axes[1].set_xlabel('Position x (nm)')
axes[1].set_ylabel('psi(x) + offset')
axes[1].set_title('Wavefunctions')
axes[1].legend()

plt.suptitle('Numerical Solution of the 1D Infinite Square Well', fontsize=13)
plt.tight_layout()
plt.savefig('particle_in_box.png', dpi=150)
plt.show()
```

---

## Discussion Questions

1. How was the Schrodinger equation "discovered"? What physical intuition did Schrodinger himself start from? Can this equation be "derived"?

2. Why is the Schrodinger equation a linear equation? What is its relationship to the superposition principle? If the equation were nonlinear, what would quantum mechanics look like?

3. The wavefunction in the Schrodinger equation is complex-valued, but Schrodinger originally hoped the wavefunction represented some kind of "real wave." Why did Born's probability interpretation ultimately prevail?

4. In classical mechanics, the ground state energy can be zero, but in quantum mechanics the ground state energy (zero-point energy) is nonzero. What are the physical consequences? Is zero-point energy "real"?
