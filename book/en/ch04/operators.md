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

# 4.2 Data Extraction Tools

> **Algorithm Goal:** Understand how physical observables are extracted from the wavefunction through operators, and master the methods for calculating expectation values.

---

## Carbon Story: Why Does Momentum Become a Derivative?

### Operator Representation of Observables

In classical mechanics, position $x$, momentum $p$, and energy $E$ are all definite numerical values. In quantum mechanics, they become **operators**: rules of operation that act on wavefunctions:

| Classical quantity | Quantum mechanical operator |
|-----------|------------|
| Position $x$ | $\hat{x} = x$ (multiply by $x$)|
| Momentum $p$ | $\hat{p} = -i\hbar \dfrac{\partial}{\partial x}$ |
| Kinetic energy $T$ | $\hat{T} = -\dfrac{\hbar^2}{2m}\dfrac{\partial^2}{\partial x^2}$ |
| Angular momentum $L_z$ | $\hat{L}_z = -i\hbar \dfrac{\partial}{\partial \phi}$ |

Why does momentum become a differential operator? Recall the de Broglie relation $p = \hbar k$ ($k$ is the wave vector), and the spatial derivative of a plane wave $e^{ikx}$ gives $ik \cdot e^{ikx}$. Therefore $-i\hbar \frac{d}{dx} e^{ikx} = \hbar k \cdot e^{ikx} = p \cdot e^{ikx}$. The momentum operator acting on a plane wave returns exactly the momentum value.

### Expectation Values

The **expectation value (average)** of a physical quantity $A$ in quantum state $\psi$:

$$
\langle A \rangle = \int_{-\infty}^{\infty} \psi^*(x) \, \hat{A} \, \psi(x) \, dx
$$

This is the "weighted average" of $\hat{A}$ over the state $\psi$, with the weight given by $|\psi|^2$.

For example, the expectation value of position:

$$
\langle x \rangle = \int_{-\infty}^{\infty} \psi^*(x) \, x \, \psi(x) \, dx = \int_{-\infty}^{\infty} x \, |\psi(x)|^2 \, dx
$$

This is precisely the mathematical expectation of a random variable in probability theory.

### Eigenvalues and Eigenstates

When the wavefunction happens to be an **eigenstate** of a given operator, the measurement outcome is definite:

$$
\hat{A}\psi_a = a\psi_a \quad \Longrightarrow \quad \text{measuring } A \text{ always yields } a
$$

If the wavefunction is not an eigenstate, but a superposition of multiple eigenstates:

$$
\psi = c_1\psi_1 + c_2\psi_2 + \cdots
$$

then the measurement outcome is random, and the probability of obtaining $a_n$ is $|c_n|^2$.

---

## Silicon Perspective: The Query Interface

### Physical Quantities Are Not Prestored -- They Are Results of Operations

In classical mechanics, a particle's position, momentum, and other properties are scalar values "prestored" on the particle, which you can read at any time.

In quantum mechanics, physical quantities are not prestored data, but **operations**. Observing a physical quantity is equivalent to executing an operator function call on the wavefunction:

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

### The Irreversibility of Measurement

Note that the `measure()` method has a **side effect**: it modifies `self.psi` (wavefunction collapse). This means:

- `query()` (computing the expectation value) is non-destructive; the database remains unchanged.
- `measure()` (actual measurement) is destructive; the database is modified.

This is the precise formulation of the "observer effect" in quantum mechanics: measurement is not passively reading information, but actively altering the state of the system.

### Commutation Relations = Query Order Dependence

The **commutator** of two operators $\hat{A}$ and $\hat{B}$:

$$
[\hat{A}, \hat{B}] = \hat{A}\hat{B} - \hat{B}\hat{A}
$$

If $[\hat{A}, \hat{B}] = 0$ (they commute), then query order does not matter, and both physical quantities can be measured precisely at the same time.

If $[\hat{A}, \hat{B}] \neq 0$ (they do not commute), then query order affects the result. For example:

$$
[\hat{x}, \hat{p}] = i\hbar
$$

This is precisely the operator formulation of the uncertainty relation.

---

## Discussion Questions

1. Why must physical quantities be represented by operators in quantum mechanics? In classical mechanics, position and momentum are just numbers; in quantum mechanics they become operators. What does this imply?

2. The position and momentum operators do not commute ($[\hat{x}, \hat{p}] = i\hbar$). What is the connection to the uncertainty relation? Is the commutation relation the "cause" of the uncertainty relation or an "equivalent statement"?

3. Why does quantum measurement lead to wavefunction collapse? Is this a process described by the Schrodinger equation itself? Why is the "measurement problem" still debated today?

4. The formal framework of quantum mechanics (Hilbert space, operators, eigenvalues) appears very abstract. Is this mathematical formalism "necessary" or "accidental"? Are there other equivalent formulations?
