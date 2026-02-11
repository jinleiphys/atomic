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

# 4.1 The Schrodinger Equation

## The Birth of Wave Mechanics

The months spanning the end of 1925 and the beginning of 1926 were among the most dramatic in the history of quantum mechanics. Just a few months earlier, the young Werner Heisenberg, during a sleepless night on the island of Helgoland, had constructed a theoretical framework called "matrix mechanics," built around the algebra of infinite-dimensional matrices, which dispensed entirely with the concept of classical orbits and dealt directly with the relationships between observable quantities. Heisenberg's theory was powerful, but its mathematical formalism -- the multiplication of infinite-dimensional matrices -- was both unfamiliar and intimidating to the majority of physicists. The physics community urgently needed a more intuitive theoretical language for describing quantum phenomena. It was against this backdrop that the 38-year-old Austrian physicist Erwin Schrodinger (1887-1961) stepped onto the stage of history, bringing with him a framework of "wave mechanics" built around partial differential equations that would fundamentally transform the way people understood the quantum world.

Schrodinger's inspiration can be traced back to the 1924 doctoral thesis of Louis de Broglie. De Broglie had proposed a bold hypothesis: if light, traditionally regarded as a wave, possesses particle-like properties (photons), then the electron, traditionally regarded as a particle, should also possess wave-like properties, with a wavelength given by $\lambda = h/p$. By late 1925 this hypothesis had begun to attract the attention of physicists, but a crucial question remained unanswered: if particles really are some kind of wave, what is the equation of motion that governs this wave? Classical string vibrations have their wave equation, the electromagnetic field has Maxwell's equations, and sound waves have their own wave equation. De Broglie's matter waves should also obey some equation, but what that equation was, no one knew.

It is said that in November 1925, during a physics colloquium at the Swiss Federal Institute of Technology (ETH) in Zurich, Schrodinger presented de Broglie's matter wave theory. Peter Debye, who was in the audience, made a seemingly offhand remark afterwards: "If particles have wave properties, then there ought to be a wave equation." This comment struck Schrodinger deeply. He began to think seriously about how to construct such an equation, and during the Christmas holiday at the end of 1925 he achieved his decisive breakthrough. Schrodinger traveled with his mistress (whose identity historians have never been able to establish) to the Alpine resort of Arosa for a skiing holiday, and it was during this trip that he found the equation that would bear his name. By the time he returned to Zurich in January 1926, the basic framework of wave mechanics had taken shape.

Schrodinger's line of reasoning was profoundly influenced by the analogy between optics and mechanics, an analogy that can be traced back to William Rowan Hamilton in the nineteenth century. Hamilton had discovered, while studying classical mechanics, that the trajectory of a particle moving in a potential field is mathematically equivalent to the path of a light ray propagating through a medium with a varying refractive index. The "principle of least action" in classical mechanics corresponds to "Fermat's principle" in geometrical optics (light travels along the path that minimizes travel time). This correspondence hinted at some deep connection between mechanics and optics. Yet in Hamilton's day, the wave theory of light had already been established, and it was known that geometrical optics is merely the approximation of wave optics in the limit of vanishing wavelength. If classical mechanics is a "geometrical optics"-like approximation, then what does the full "wave mechanics" look like? This question could not be answered in Hamilton's era, because at the time there was no indication whatsoever that particles possess wave properties. But after de Broglie, this analogy suddenly took on a new life. It was precisely along this thread that Schrodinger, starting from the classical Hamilton-Jacobi equation and "wave-ifying" it, arrived at his equation.

The general form of the Schrodinger equation, the time-dependent Schrodinger equation, is:

$$
i\hbar \frac{\partial \Psi(\mathbf{r}, t)}{\partial t} = \hat{H} \Psi(\mathbf{r}, t)
$$

Here $\Psi(\mathbf{r}, t)$ is the wave function, which completely describes the state of a quantum system at time $t$; $\hat{H}$ is the Hamiltonian operator, representing the total energy of the system. For a single particle moving in a potential $V(\mathbf{r}, t)$, the Hamiltonian takes the explicit form:

$$
\hat{H} = -\frac{\hbar^2}{2m}\nabla^2 + V(\mathbf{r}, t)
$$

The first term $-\frac{\hbar^2}{2m}\nabla^2$ is the kinetic energy operator, where $\nabla^2 = \frac{\partial^2}{\partial x^2} + \frac{\partial^2}{\partial y^2} + \frac{\partial^2}{\partial z^2}$ is the Laplacian; the second term $V(\mathbf{r}, t)$ is the potential energy. The physical content of this equation is that the rate of change of the wave function with time is determined by the Hamiltonian operator acting on the wave function. In other words, if you know the wave function at some initial time $\Psi(\mathbf{r}, t_0)$ and the Hamiltonian $\hat{H}$, the Schrodinger equation uniquely determines the evolution of the wave function at all future (and past) times. In this sense, the Schrodinger equation plays in quantum mechanics exactly the role that Newton's second law $F = ma$ plays in classical mechanics -- it is the "equation of motion" of the quantum world.

This equation has several noteworthy features. First, the imaginary unit $i = \sqrt{-1}$ appears on the left-hand side, which means the wave function $\Psi$ is inherently a complex-valued function. This initially troubled Schrodinger himself, who had hoped the wave function would represent some real physical oscillation (like water waves or sound waves). But Born's probability interpretation later showed that the physical meaning resides not in the wave function itself, but in its modulus squared $|\Psi|^2$, which gives the probability density of finding the particle at a given position. Second, the equation is first-order in time (containing only $\partial \Psi / \partial t$), unlike the classical wave equation which is second-order ($\partial^2 \Psi / \partial t^2$). This means that given the wave function at the initial time $\Psi(\mathbf{r}, t_0)$, the future evolution is completely determined, with no need to additionally specify an initial velocity as in the classical wave equation. Third, the equation is linear: if $\Psi_1$ and $\Psi_2$ are both solutions, then any linear combination $c_1 \Psi_1 + c_2 \Psi_2$ is also a solution. This linear superposition principle is the mathematical root of many of the most exotic phenomena in quantum mechanics (such as quantum interference and quantum entanglement).

In atomic physics, the most important situation is when the potential energy does not explicitly depend on time, that is, $V = V(\mathbf{r})$. In this case, one can apply the method of separation of variables, writing the wave function as the product of a spatial part and a temporal part:

$$
\Psi(\mathbf{r}, t) = \psi(\mathbf{r}) \cdot e^{-iEt/\hbar}
$$

Substituting this form into the time-dependent Schrodinger equation, the time factor cancels out, yielding the time-independent Schrodinger equation:

$$
\hat{H}\psi(\mathbf{r}) = E\psi(\mathbf{r})
$$

Written out explicitly:

$$
-\frac{\hbar^2}{2m}\nabla^2\psi(\mathbf{r}) + V(\mathbf{r})\psi(\mathbf{r}) = E\psi(\mathbf{r})
$$

Mathematically, this equation is an eigenvalue equation: given the operator $\hat{H}$ and boundary conditions, one seeks the energy values $E$ (eigenvalues) and corresponding wave functions $\psi$ (eigenfunctions) that satisfy the equation. Not every value of $E$ yields a physically acceptable solution -- the wave function must satisfy the normalization condition (its integral over all space must be finite), single-valuedness (it must have only one value at each point), and continuity (both the wave function and its derivative must be continuous). These constraints restrict the allowed energy values to a discrete set of eigenvalues $E_1, E_2, E_3, \ldots$, and energy quantization thus emerges naturally from the boundary conditions of the equation, without the need for ad hoc assumptions like those of Bohr.

The simplest and most pedagogically valuable application of the time-independent Schrodinger equation is the one-dimensional infinite square well (particle in a box). Consider a particle of mass $m$ confined to a one-dimensional "box" of width $L$, with potential energy:

$$
V(x) = \begin{cases} 0, & 0 < x < L \\ \infty, & x \leq 0 \text{ or } x \geq L \end{cases}
$$

Inside the box ($V = 0$), the time-independent Schrodinger equation reduces to:

$$
-\frac{\hbar^2}{2m}\frac{d^2\psi}{dx^2} = E\psi
$$

This is a simple second-order ordinary differential equation with general solution $\psi(x) = A\sin(kx) + B\cos(kx)$, where $k = \sqrt{2mE}/\hbar$. Outside the box, the infinite potential energy forces the wave function to be zero (the particle cannot exist in a region of infinite potential). The continuity of the wave function requires $\psi(0) = 0$ and $\psi(L) = 0$ at the boundaries. The first condition $\psi(0) = 0$ requires $B = 0$, so $\psi(x) = A\sin(kx)$. The second condition $\psi(L) = 0$ requires $\sin(kL) = 0$, meaning $kL = n\pi$ with $n = 1, 2, 3, \ldots$ (excluding $n = 0$ because it would give the trivial zero solution). This yields allowed wave vectors $k_n = n\pi/L$ and corresponding energies:

$$
E_n = \frac{\hbar^2 k_n^2}{2m} = \frac{n^2 \pi^2 \hbar^2}{2mL^2}, \quad n = 1, 2, 3, \ldots
$$

The normalized wave functions are:

$$
\psi_n(x) = \sqrt{\frac{2}{L}} \sin\left(\frac{n\pi x}{L}\right)
$$

This result has several physically profound implications. First, the energy is quantized, taking only the discrete values $E_1, 4E_1, 9E_1, \ldots$, where $E_1 = \pi^2\hbar^2/(2mL^2)$ is the ground state energy. Quantization is not imposed by fiat but is a mathematical consequence of the boundary conditions -- just as a string fixed at both ends can only vibrate in specific standing wave modes, a quantum particle confined to a box can only occupy specific energy states. Second, the ground state energy $E_1 > 0$, meaning the particle's minimum energy is not zero. This "zero-point energy" is a phenomenon unique to quantum mechanics with no classical counterpart. Its origin can be understood from the uncertainty principle: the particle is confined to a region of width $L$, so the position uncertainty is $\Delta x \sim L$; by the uncertainty relation $\Delta x \cdot \Delta p \geq \hbar/2$, the momentum cannot be zero, and therefore neither can the kinetic energy. Third, the wave function for each energy level has a different number of nodes (points where the wave function crosses zero): $\psi_1$ has no interior nodes, $\psi_2$ has one node (at $x = L/2$), and $\psi_n$ has $n-1$ interior nodes. More nodes mean more rapid spatial oscillation of the wave function, corresponding to higher kinetic energy, in complete analogy with the harmonic series of a standing wave.

Another astonishing prediction of the Schrodinger equation is the phenomenon of quantum tunneling. Consider a particle encountering a potential barrier of height $V_0$, where the particle's energy $E$ is less than $V_0$. In classical mechanics, the particle absolutely cannot cross such a barrier, just as a ball without sufficient velocity cannot roll over a hill. The Schrodinger equation, however, gives a dramatically different answer. Inside the barrier, even though $E < V_0$, the wave function does not vanish but decays exponentially as $\psi \sim e^{-\kappa x}$, where $\kappa = \sqrt{2m(V_0 - E)}/\hbar$. If the barrier has finite width, the wave function retains a nonzero value on the far side, meaning there is a nonzero probability for the particle to appear beyond the barrier -- the particle has "tunneled" through a barrier that it classically could never surmount. The tunneling probability decays exponentially with the width and height of the barrier, so for macroscopic-scale barriers the tunneling probability is so vanishingly small that classical intuition remains valid. But at atomic scales, tunneling is a real and important phenomenon: radioactive $\alpha$ decay is precisely the result of $\alpha$ particles tunneling through the nuclear potential barrier, and in 1928 Gamow successfully used tunneling theory to explain the relationship between the half-life of $\alpha$ decay and the energy of the $\alpha$ particle (the Geiger-Nuttall law). In modern technology, tunneling is equally ubiquitous: the scanning tunneling microscope (STM) uses the electron tunneling current to image atomic surface structures, flash memory uses electron tunneling to write and erase data, and tunnel diodes exploit this effect to achieve ultrafast electronic switching.

Between January and June of 1926, Schrodinger published four papers in rapid succession, systematically laying out the theoretical framework of wave mechanics and applying it to specific problems such as the hydrogen atom and the harmonic oscillator. He successfully derived the energy level formula of the hydrogen atom from his wave equation, obtaining results in perfect agreement with the Bohr model and experimental data. This achievement created an enormous stir in the physics community. Compared to Heisenberg's matrix mechanics, Schrodinger's wave mechanics employed the partial differential equations that physicists were far more familiar with, and it was therefore rapidly and widely accepted. Schrodinger himself even proved in his fourth 1926 paper that wave mechanics and matrix mechanics are mathematically equivalent -- they are two different formulations of the same theory. After receiving Schrodinger's papers, Bohr invited him to Copenhagen to give lectures, and the two engaged in an intense debate over the physical interpretation of the wave function. Schrodinger was inclined to view the wave function as a real physical oscillation (analogous to a classical electromagnetic wave), while Bohr and Heisenberg insisted on the probabilistic interpretation. Legend has it that the debate was so intense that Schrodinger fell ill from exhaustion during his stay in Copenhagen, and Bohr sat at his bedside continuing the argument. Schrodinger shared the 1933 Nobel Prize in Physics with Dirac "for the discovery of new productive forms of atomic theory."

## Silicon Perspective: Eigenvalue Problems and Numerical Methods

Viewed from the perspective of computer science and numerical analysis, the time-independent Schrodinger equation $\hat{H}\psi = E\psi$ immediately brings to mind one of the most central problems in linear algebra: the matrix eigenvalue problem $A\mathbf{v} = \lambda\mathbf{v}$. The correspondence between these two is not merely a formal analogy but is precise down to the operational level. In linear algebra, given an $N \times N$ matrix $A$, solving $A\mathbf{v} = \lambda\mathbf{v}$ means finding all scalars $\lambda$ (eigenvalues) and nonzero vectors $\mathbf{v}$ (eigenvectors) that satisfy the equation. In quantum mechanics, the operator $\hat{H}$ replaces the matrix $A$, the wave function $\psi$ replaces the vector $\mathbf{v}$, and the energy $E$ replaces the eigenvalue $\lambda$. The only difference is that a matrix acts on finite-dimensional vectors, while a differential operator acts on functions in an infinite-dimensional space. But when we solve the problem numerically on a computer, we must discretize the continuous space into a finite number of grid points, at which point the differential operator becomes a finite-dimensional matrix and the problem returns entirely to the domain of linear algebra.

As a one-dimensional example, divide the spatial interval $[0, L]$ uniformly into $N+1$ segments, with grid spacing $\Delta x = L/(N+1)$ and grid point coordinates $x_j = j\Delta x$ ($j = 1, 2, \ldots, N$). The values of the wave function at the grid points $\psi_j = \psi(x_j)$ form an $N$-dimensional vector. The second derivative $d^2\psi/dx^2$ is approximated by the central difference formula:

$$
\frac{d^2\psi}{dx^2}\bigg|_{x_j} \approx \frac{\psi_{j+1} - 2\psi_j + \psi_{j-1}}{(\Delta x)^2}
$$

In this way, the differential operator $-\frac{\hbar^2}{2m}\frac{d^2}{dx^2} + V(x)$ becomes an $N \times N$ tridiagonal matrix, with diagonal elements $\frac{\hbar^2}{m(\Delta x)^2} + V(x_j)$ and adjacent off-diagonal elements $-\frac{\hbar^2}{2m(\Delta x)^2}$. Finding the eigenvalues and eigenvectors of this matrix yields the energy eigenvalues and discretized wave functions. The larger $N$ (i.e., the smaller $\Delta x$), the closer the discrete approximation approaches the continuous limit and the more accurate the numerical results become.

This strategy of "discretizing a differential equation into a matrix problem" is one of the most fundamental and powerful methods in numerical analysis. In practical scientific computing, a suite of efficient algorithms exists for large sparse matrix eigenvalue problems, such as the Lanczos algorithm and the Jacobi-Davidson method, which can iteratively extract the lowest few eigenvalues and eigenvectors without explicitly constructing the full matrix. These algorithms play a central role in first-principles calculations across condensed matter physics, quantum chemistry, and materials science. The core engines of modern density functional theory (DFT) codes -- such as VASP, Gaussian, and Quantum ESPRESSO -- are essentially solving giant matrix eigenvalue problems.

It is worth noting that the mathematical structure of the eigenvalue problem extends far beyond quantum mechanics. Google's PageRank algorithm treats the internet as a vast directed graph and ranks web pages by finding the principal eigenvector of the corresponding transition matrix. Principal component analysis (PCA) extracts the dominant patterns in data by performing an eigenvalue decomposition of the data covariance matrix. Image compression, latent semantic analysis in natural language processing, and collaborative filtering in recommendation systems all reduce, at their mathematical core, to some form of eigenvalue problem. From this perspective, the Schrodinger equation is not an isolated mathematical construct within quantum physics, but rather a profound instance of the universal mathematical structure of eigenvalue problems as manifested in the physical world.

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

## Section Summary

This section traced the historical background and physical motivation behind the birth of the Schrodinger equation. Inspired by de Broglie's matter wave hypothesis and the optics-mechanics analogy, Schrodinger established wave mechanics in 1926, providing the fundamental equation describing the time evolution of quantum systems. The time-dependent Schrodinger equation $i\hbar\partial\Psi/\partial t = \hat{H}\Psi$ is the "equation of motion" of quantum mechanics; when the potential energy does not explicitly depend on time, separation of variables yields the time-independent Schrodinger equation $\hat{H}\psi = E\psi$, which is an eigenvalue problem whose boundary conditions naturally give rise to energy quantization. The one-dimensional infinite square well, as the simplest example, clearly demonstrates quantization, zero-point energy, and standing wave structure. Quantum tunneling is one of the most dramatic predictions of the Schrodinger equation, allowing particles to penetrate classically insurmountable barriers. From a computational perspective, the numerical solution of the time-independent Schrodinger equation reduces to a matrix eigenvalue problem, a mathematical structure with broad applications across science and engineering.

## Discussion Questions

1. The Schrodinger equation cannot be "derived" from more fundamental principles; it is itself a basic postulate of quantum mechanics, much like Newton's second law $F = ma$. If a fundamental equation cannot be derived, on what grounds do we believe it is correct?

2. The time-dependent Schrodinger equation is first-order in time, whereas the classical wave equation $\partial^2 u/\partial t^2 = c^2 \nabla^2 u$ is second-order in time. What physical consequences does this difference entail? Why is the quantum mechanical "wave" so different from a classical vibrating string?

3. The ground state energy (zero-point energy) of the one-dimensional infinite square well is nonzero. What are the physical consequences of this fact? Can zero-point energy be extracted and utilized? (Hint: consider the Casimir effect.)

4. Why is quantum tunneling unobservable at macroscopic scales? Estimate the probability that a 1 kg object tunnels through a barrier 1 m wide and 1 J high. What does this number tell us?
