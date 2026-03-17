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

# 4.2 Operators and Expectation Values

## Why Does Momentum Become a Derivative?

In classical mechanics, position $x$, momentum $p$, and energy $E$ are all definite numerical values that can be precisely measured and recorded at any instant. However, as physicists in the early twentieth century attempted to describe phenomena at the atomic scale, they gradually realized that this simple picture was no longer adequate. The construction of quantum mechanics forced a profound rethinking of what "physical quantity" means, culminating in a deep conceptual shift: physical quantities are no longer numbers, but **operators** -- rules of operation that act on wavefunctions.

This transformation did not happen overnight. Between 1925 and 1926, Heisenberg and Schrodinger arrived at the same destination by entirely different paths. Heisenberg, starting from the matrix representation of observables, built matrix mechanics; Schrodinger, starting from a wave equation, built wave mechanics. In 1926, Schrodinger proved that these two seemingly disparate theories were in fact mathematically equivalent. Within Schrodinger's wave mechanics framework, every classical physical quantity corresponds to an operator: the position operator $\hat{x}$ simply multiplies by $x$; the momentum operator $\hat{p} = -i\hbar \dfrac{\partial}{\partial x}$ is a differential operation; the kinetic energy operator $\hat{T} = -\dfrac{\hbar^2}{2m}\dfrac{\partial^2}{\partial x^2}$ is a second-order differential; and the $z$-component of angular momentum $\hat{L}_z = -i\hbar \dfrac{\partial}{\partial \phi}$ involves differentiation with respect to the azimuthal angle.

Why does momentum, in particular, become a differential operator? The answer lies deep within the de Broglie relation. Recall that $p = \hbar k$ ($k$ is the wave vector), and the spatial derivative of a plane wave $e^{ikx}$ gives $ik \cdot e^{ikx}$. Therefore $-i\hbar \frac{d}{dx} e^{ikx} = \hbar k \cdot e^{ikx} = p \cdot e^{ikx}$. The momentum operator acting on a plane wave returns exactly the momentum value times the plane wave itself. This is no coincidence -- the de Broglie relation connects a particle's momentum to the spatial oscillation frequency of its wave, and differentiation is precisely the mathematical tool that extracts spatial oscillation frequency. From this perspective, the differential form of the momentum operator is a natural consequence of wave-particle duality.

With the concept of operators in hand, we can define the **expectation value (average)** of a physical quantity $A$ in a quantum state $\psi$:

$$
\langle A \rangle = \int_{-\infty}^{\infty} \psi^*(x) \, \hat{A} \, \psi(x) \, dx
$$

This is the "weighted average" of $\hat{A}$ over the state $\psi$, with the weight given by $|\psi|^2$. For example, the expectation value of position is

$$
\langle x \rangle = \int_{-\infty}^{\infty} \psi^*(x) \, x \, \psi(x) \, dx = \int_{-\infty}^{\infty} x \, |\psi(x)|^2 \, dx
$$

This is precisely the mathematical expectation of a random variable in probability theory. The reason quantum mechanics uses this integral formula to compute expectation values is that $|\psi(x)|^2$ plays the role of a probability density -- the modulus squared of the wavefunction tells us how likely the particle is to be found at a given position. The expectation value of momentum can be calculated similarly, except that the momentum operator is sandwiched between $\psi^*$ and $\psi$: $\langle p \rangle = \int \psi^* (-i\hbar \frac{d}{dx}) \psi \, dx$.

An extremely important concept in operator theory is that of **eigenvalues and eigenstates**. When the wavefunction happens to be an eigenstate of a given operator, the measurement outcome is definite:

$$
\hat{A}\psi_a = a\psi_a \quad \Longrightarrow \quad \text{measuring } A \text{ always yields } a
$$

Here $a$ is called the eigenvalue, and $\psi_a$ is the corresponding eigenstate. The eigenvalue equation says: the operator acting on an eigenstate merely multiplies it by a constant (the eigenvalue), without changing its functional form. If the wavefunction is not an eigenstate, but a superposition of multiple eigenstates $\psi = c_1\psi_1 + c_2\psi_2 + \cdots$, then the measurement outcome is random, and the probability of obtaining $a_n$ is $|c_n|^2$. This is the mathematical root of probability in quantum mechanics -- a superposition state harbors multiple possible measurement outcomes, each corresponding to an eigenvalue, and the probability of each is determined by the modulus squared of the superposition coefficient.

It is worth emphasizing that quantum mechanics requires the operators corresponding to physical observables to be **Hermitian operators**, satisfying $\int \psi_1^* (\hat{A} \psi_2) dx = \int (\hat{A} \psi_1)^* \psi_2 dx$. The eigenvalues of a Hermitian operator are always real, which guarantees that measurement outcomes are always real numbers -- a physically sensible requirement. Furthermore, eigenstates corresponding to different eigenvalues of a Hermitian operator are mutually orthogonal, and together they form a complete basis in which any wavefunction can be expanded. This mathematical structure gives quantum mechanics its elegant linear algebra framework.

## Silicon Perspective: The Query Interface

In classical mechanics, a particle's position, momentum, and other properties are scalar values "prestored" on the particle, which you can read at any time, much like accessing an object's attribute fields. In quantum mechanics, however, physical quantities are not prestored data, but **operations**. Observing a physical quantity is equivalent to executing an operator function call on the wavefunction. The wavefunction is a "database" containing all information, and the operator is a "query" that extracts specific information from the database. This analogy is remarkably deep: you cannot directly "see" the data in the database; you can only obtain information through queries, and different queries may affect the state of the database itself.

```python
class QuantumState:
    def __init__(self, psi):
        self.psi = psi  # Wavefunction: the database containing all information

    def query(self, operator):
        """
        Execute an operator query on the wavefunction
        Returns: expectation value <A>
        """
        return integrate(conj(self.psi) * operator(self.psi))

    def measure(self, operator):
        """
        Perform a single quantum measurement
        Returns: an eigenvalue (probabilistic)
        Side effect: wavefunction collapses to the corresponding eigenstate!
        """
        eigenvalues, eigenstates = operator.eigen_decompose()
        probabilities = [abs(overlap(self.psi, es))**2
                         for es in eigenstates]
        result_index = random_choice(probabilities)
        self.psi = eigenstates[result_index]  # Collapse!
        return eigenvalues[result_index]
```

Note that the `measure()` method has a **side effect**: it modifies `self.psi` (wavefunction collapse). This is crucial. `query()` (computing the expectation value) is non-destructive -- it performs a mathematical integration over the wavefunction without changing it, like executing a read-only query on a database. But `measure()` (actual measurement) is destructive -- it not only returns a result but also irreversibly collapses the wavefunction to some eigenstate, much like a transaction with a write operation. This is the precise formulation of the "observer effect" in quantum mechanics: measurement is not passively reading information, but actively altering the state of the system. In database language, a quantum measurement is a query operation with an irreversible side effect.

The **commutator** of two operators $\hat{A}$ and $\hat{B}$ is defined as $[\hat{A}, \hat{B}] = \hat{A}\hat{B} - \hat{B}\hat{A}$. Commutation relations play a central role in quantum mechanics, and they can be understood as the order-dependence of queries. If $[\hat{A}, \hat{B}] = 0$ (they commute), then the order of queries does not matter, and both physical quantities can be measured precisely at the same time, just as two read-only queries can be executed in any order without affecting the result. If $[\hat{A}, \hat{B}] \neq 0$ (they do not commute), then the order of queries affects the result. The most famous example is the commutation relation between position and momentum: $[\hat{x}, \hat{p}] = i\hbar$. This is precisely the operator formulation of the uncertainty relation: position and momentum cannot be simultaneously determined with arbitrary precision, because measuring one necessarily disturbs the other -- there is an irreducible conflict between the two query operations.

## Discussion Questions

1. Why must physical quantities be represented by operators in quantum mechanics? In classical mechanics, position and momentum are just numbers; in quantum mechanics they become operators. What does this imply?

2. The position and momentum operators do not commute ($[\hat{x}, \hat{p}] = i\hbar$). What is the connection to the uncertainty relation? Is the commutation relation the "cause" of the uncertainty relation or an "equivalent statement"?

3. Why does quantum measurement lead to wavefunction collapse? Is this a process described by the Schrodinger equation itself? Why is the "measurement problem" still debated today?

4. The formal framework of quantum mechanics (Hilbert space, operators, eigenvalues) appears very abstract. Is this mathematical formalism "necessary" or "accidental"? Are there other equivalent formulations?
