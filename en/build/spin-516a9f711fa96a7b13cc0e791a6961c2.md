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

# 5.1 Electron Spin

## The Stern-Gerlach Experiment

By the early twentieth century, physicists already knew that atoms could possess magnetic moments arising from the angular momentum of their charged constituents. What remained an open question, however, was whether the orientation of this angular momentum in space was continuously distributed or quantized into discrete values. To settle this fundamental issue, Otto Stern proposed an elegant experimental scheme in 1921, which he and Walther Gerlach carried out the following year in their laboratory at the University of Frankfurt.

The design of the Stern-Gerlach experiment was remarkably ingenious. They first heated silver in a small electric furnace, causing silver atoms to evaporate and stream out through a narrow opening. After passing through a series of collimating slits, these atoms formed a well-directed beam. The beam then entered a region between two specially shaped magnetic pole pieces: one pole had a sharp wedge-shaped cross section while the other had a groove cut into it. This asymmetric geometry produced a magnetic field with a strong gradient in the vertical direction, meaning the field strength varied systematically from one side to the other. After traversing this region of inhomogeneous field, the atomic beam struck a cold glass plate where the silver atoms deposited themselves in an observable pattern.

If a silver atom possesses a magnetic moment $\mu$, it experiences a force $F_z = \mu_z \frac{\partial B}{\partial z}$ in the inhomogeneous field, the magnitude and direction of which depend on the component of the magnetic moment along the field gradient. According to classical physics, the orientation of the atomic magnetic moment should be completely random, with $\mu_z$ taking any continuous value from $-\mu$ to $+\mu$. One would therefore expect to see a continuously broadened streak on the collection plate, with atoms whose magnetic moments point more upward deflected further in one direction, those pointing more downward deflected the other way, and all intermediate orientations filling in the space between. But when Gerlach removed the collection plate in February 1922 and examined it carefully, what he found defied all classical expectations: the beam of silver atoms had split cleanly into exactly two discrete beams, depositing two sharply separated bands on the plate with virtually no atoms in between. Two beams! Not three, not five, but exactly two. This meant that $\mu_z$ did not vary continuously but took only two discrete values.

The result caused an enormous stir. Physicists initially attempted to explain the splitting in terms of the quantization of orbital angular momentum, but this approach quickly proved untenable. The ground-state electron configuration of silver is $[\text{Kr}]4d^{10}5s^1$, and the single valence electron occupies the $5s$ orbital with orbital quantum number $l=0$. Since $l=0$ implies zero orbital angular momentum, the magnetic quantum number $m_l$ can only take the value zero. If the magnetic moment were entirely due to orbital motion, the beam should not have been deflected at all, let alone split into two. This puzzle remained unresolved for three years.

In the autumn of 1925, two young Dutch physicists, George Uhlenbeck and Samuel Goudsmit, encouraged by their advisor Paul Ehrenfest, put forward a bold hypothesis. They proposed that the electron, in addition to whatever orbital angular momentum it might carry from its motion around the nucleus, possesses an intrinsic angular momentum entirely unrelated to spatial motion. They called this quantity "spin." The spin quantum number they assigned was $s = 1/2$, which gives exactly two possible values of the magnetic quantum number, $m_s = +1/2$ and $m_s = -1/2$, perfectly explaining the two-beam splitting observed in the Stern-Gerlach experiment. It is said that Uhlenbeck and Goudsmit, initially uneasy about the boldness of their idea, tried to withdraw the paper they had given to Ehrenfest, but Ehrenfest told them it had already been sent off and reassured them: "You are both young enough to be able to afford a stupidity." As it turned out, it was no stupidity at all.

The magnitude of the spin angular momentum is determined by the quantum number $s = 1/2$:

$$
|\mathbf{S}| = \sqrt{s(s+1)}\hbar = \frac{\sqrt{3}}{2}\hbar
$$

The $z$-component of spin can take only two values:

$$
S_z = m_s\hbar, \quad m_s = +\frac{1}{2} \text{ (spin up) or } -\frac{1}{2} \text{ (spin down)}
$$

The magnetic moment produced by spin is:

$$
\mu_s = -g_s \frac{e}{2m_e} S_z = -g_s m_s \mu_B
$$

where $g_s \approx 2$ is the electron's spin $g$-factor (Lande $g$-factor). The fact that this value is approximately 2 cannot be explained by any classical argument. For orbital motion, the corresponding $g$-factor is exactly 1. The origin of $g_s \approx 2$ must be traced to the relativistic quantum mechanical equation that Paul Dirac formulated in 1928. The Dirac equation, as a relativistic generalization of the Schrodinger equation, yields spin and its anomalous $g$-factor as natural consequences of the theory, requiring no additional assumptions whatsoever. Quantum electrodynamics (QED) further predicts the tiny deviation of $g_s$ from the exact value of 2: $g_s = 2.002\,319\,304\,362...$, a theoretical prediction that agrees with experimental measurements to twelve decimal places, making it one of the most precise predictions in the history of physics.

The name "spin" readily evokes an intuitive picture of the electron as a tiny top rotating about its own axis. But this picture is seriously misleading. If one models the electron as a classical charged sphere with the classical electron radius (about $10^{-15}$ m), producing the experimentally observed angular momentum of order $\hbar/2$ would require the surface of the sphere to move at velocities far exceeding the speed of light, which is physically impossible. More fundamentally, the electron in modern physics is treated as a point particle (at least down to the smallest scales currently accessible to experiment), and a mathematical point with no spatial extent cannot meaningfully "rotate about its own axis." Spin is a purely quantum mechanical property with no classical counterpart. It is an intrinsic attribute of the electron, just like mass and charge. An electron is "born" with spin $s = 1/2$, a value that never changes and can be neither "sped up" nor "slowed down."

## Silicon Perspective: The Qubit

The discovery of spin added a binary piece of metadata to the electron: it does not affect the electron's orbital motion in space (at least in the non-relativistic approximation) but attaches an additional label to every quantum state. Before spin was incorporated into the description, an electron's quantum state was uniquely specified by three quantum numbers $(n, l, m)$; now four quantum numbers $(n, l, m, m_s)$ are needed for a complete specification. In the notation of quantum mechanics, the full state can be written as a direct product of the orbital and spin parts, $|\psi\rangle = |n, l, m\rangle \otimes |m_s\rangle$. The spin-up state $|m_s = +1/2\rangle$ is commonly abbreviated as $|\!\uparrow\rangle$, and the spin-down state $|m_s = -1/2\rangle$ as $|\!\downarrow\rangle$.

From the perspective of computer science, electron spin is one of the most natural physical realizations of a quantum bit, or qubit. A classical bit can only be in one of two states, 0 or 1; at any given moment its state is entirely definite, can be read without disturbance, and can be copied at will. A qubit, by contrast, is fundamentally different. The spin state of an electron can be any superposition of $|\!\uparrow\rangle$ and $|\!\downarrow\rangle$:

$$
|\psi\rangle = \alpha|{\uparrow}\rangle + \beta|{\downarrow}\rangle, \quad |\alpha|^2 + |\beta|^2 = 1
$$

The complex coefficients $\alpha$ and $\beta$ encode infinitely many possible superpositions, so that a single qubit carries, in a certain sense, far richer information than a classical bit. However, when we perform a measurement on the spin, the superposition irreversibly collapses into either $|\!\uparrow\rangle$ or $|\!\downarrow\rangle$, with probabilities $|\alpha|^2$ and $|\beta|^2$ respectively. This destructiveness of measurement is a fundamental feature of quantum mechanics: reading the "value" of a qubit inevitably alters its state. Furthermore, the no-cloning theorem of quantum mechanics rigorously proves that no physical process can perfectly duplicate an unknown quantum state. Classical bits can be copied and broadcast freely, but once a quantum state is created, it cannot be faithfully replicated onto another system. These seemingly restrictive features actually form the foundation of quantum computing and quantum cryptography. It is precisely because quantum states cannot be cloned that quantum key distribution can achieve theoretically unconditional communication security.

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

## Discussion Questions

1. Why can spin not be explained by classical rotation? What difficulties arise if one treats the electron as a classical rotating charged sphere?

2. In the Stern-Gerlach experiment, the atomic beam splits into two beams, indicating that the orientation of spin in space is "quantized." But if we measure along different directions, each time obtaining only two values, what is the relationship between these measurement results?

3. Spin is a type of "intrinsic angular momentum" unrelated to spatial motion. How does this property connect to relativity? Why does the Dirac equation "naturally" give rise to spin?

4. Two spin-1/2 particles can combine into spin 0 (singlet) or spin 1 (triplet). What is the physical significance of this angular momentum coupling? How does it relate to chemical bond formation?
