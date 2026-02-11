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

# 3.2 Resolution Limits

> **Algorithm Goal:** Understand why position and momentum, as conjugate variables, cannot simultaneously possess arbitrarily high precision. This is not a technical limitation but a fundamental limit on information encoding.

---

## Carbon Story: Heisenberg's Microscope

### A Thought Experiment

In 1927, Heisenberg (Werner Heisenberg) proposed a famous thought experiment:

Suppose you want to use a microscope to "see" an electron and determine its position. You need to illuminate it with light. For precise localization, you need light of short wavelength (resolution $\Delta x \sim \lambda$).

But according to the particle nature of photons ($p = h/\lambda$), the shorter the wavelength of the photon, the greater its momentum. When the photon collides with the electron (Compton effect), it delivers an uncontrollable momentum "kick" to the electron.

The result:

- To measure **position** precisely -> use short-wavelength light -> large photon momentum -> large momentum disturbance
- To measure **momentum** precisely -> use long-wavelength light -> poor position resolution

You cannot have both. This is the **Heisenberg uncertainty relation**:

$$
\Delta x \cdot \Delta p \geq \frac{\hbar}{2}
$$

### Generalization of the Uncertainty Relation

Similar uncertainty relations exist between all **conjugate variable pairs**:

$$
\Delta E \cdot \Delta t \geq \frac{\hbar}{2}
$$

The energy-time uncertainty relation implies that a particle's energy is "blurred" over extremely short time intervals. This leads to effects such as the creation of virtual particle pairs and quantum tunneling.

### Deeper Meaning

Heisenberg originally understood the uncertainty relation from the perspective of "measurement disturbance," but later recognized that it is not merely a measurement problem. It is an **intrinsic property of microscopic particles themselves**.

An electron is not "at a definite position that we simply do not know." Rather, **it inherently does not have simultaneously definite position and momentum**. This is not ignorance; it is ontology.

---

## Silicon Perspective: Information Encoding Limits

### Conjugate Variables and Bandwidth

In signal processing, there is a theorem that is mathematically fully equivalent to the uncertainty relation: the **time-frequency uncertainty principle (Gabor Limit)**:

$$
\Delta t \cdot \Delta \omega \geq \frac{1}{2}
$$

A signal cannot simultaneously have an extremely short duration in the time domain and an extremely narrow frequency bandwidth. This is not a flaw of recording equipment; it is a **mathematical property of the Fourier transform**.

The position-momentum uncertainty relation in quantum mechanics is completely isomorphic to this:

- Position $x$ <-> Time $t$
- Momentum $p$ <-> Frequency $\omega$
- Planck's constant $\hbar$ <-> Normalization constant

The wave function $\psi(x)$ and its Fourier transform $\tilde{\psi}(p)$ are a conjugate pair of representations that mathematically cannot both be $\delta$ functions simultaneously.

### The Pixel Resolution of the Universe

```python
# The uncertainty relation in one line of code
assert delta_x * delta_p >= hbar / 2
```

This assertion will never be violated. It is not a bug; it is a feature. It is the low-level specification of the universe simulator.

You can think of it this way: the "phase space" (position-momentum space) of the universe has a minimum "pixel" size with area $\hbar/2$. You cannot simultaneously resolve position and momentum within a single pixel.

```
Phase space resolution:

         Momentum p
          ^
          |  ####
          |  ####  <- Minimum area occupied by a quantum state ~ h-bar
          |  ####
          +-------> Position x
```

### Analogy with Digital Images

- The resolution of a digital photograph is determined by pixel size.
- The "resolution" of phase space is determined by $\hbar$.
- You cannot make a single pixel simultaneously represent a precise $x$ coordinate and a precise $p$ coordinate, because a pixel is just a pixel.

---

## AI Workshop: Visualizing the Uncertainty Relation

```{code-cell} ipython3
import numpy as np
import matplotlib.pyplot as plt

def gaussian_wavepacket(x, x0, sigma):
    """Gaussian wave packet (position space)"""
    return (1/(2*np.pi*sigma**2))**0.25 * np.exp(-(x-x0)**2 / (4*sigma**2))

x = np.linspace(-20, 20, 1000)

fig, axes = plt.subplots(2, 3, figsize=(14, 8))

# Wave packets of different widths: smaller sigma -> more precise position -> more uncertain momentum
sigmas = [0.5, 2.0, 8.0]
labels = ['Position precise\nMomentum uncertain', 'Intermediate', 'Position uncertain\nMomentum precise']

for i, (sigma, label) in enumerate(zip(sigmas, labels)):
    # Position space
    psi_x = gaussian_wavepacket(x, 0, sigma)
    prob_x = np.abs(psi_x)**2
    axes[0, i].plot(x, prob_x, 'b-', linewidth=2)
    axes[0, i].set_title(f'σ_x = {sigma}')
    axes[0, i].set_xlabel('Position x')
    axes[0, i].set_ylabel('|ψ(x)|²')
    axes[0, i].set_xlim(-15, 15)

    # Momentum space (Fourier transform)
    dp = 2*np.pi / (x[-1]-x[0])
    p = np.fft.fftshift(np.fft.fftfreq(len(x), d=(x[1]-x[0]))) * 2 * np.pi
    psi_p = np.fft.fftshift(np.fft.fft(psi_x)) * (x[1]-x[0]) / np.sqrt(2*np.pi)
    prob_p = np.abs(psi_p)**2
    prob_p /= np.trapezoid(prob_p, p)
    axes[1, i].plot(p, prob_p, 'r-', linewidth=2)
    axes[1, i].set_title(f'σ_p = {1/(2*sigma):.2f}')
    axes[1, i].set_xlabel('Momentum p')
    axes[1, i].set_ylabel('|ψ(p)|²')
    axes[1, i].set_xlim(-5, 5)
    axes[1, i].text(0.5, 0.9, label, transform=axes[1,i].transAxes,
                    ha='center', fontsize=9, color='gray')

plt.suptitle('Uncertainty Relation: The Trade-off Between Position Precision and Momentum Precision', fontsize=13)
plt.tight_layout()
plt.savefig('uncertainty_principle.png', dpi=150)
plt.show()
```

---

## Exercises

1. Does the uncertainty relation mean "the electron has a definite position and momentum, but we simply cannot know both at the same time"? Discuss the difference between the "epistemological" interpretation and the "ontological" interpretation.

2. Heisenberg originally used the "microscope thought experiment" to explain the uncertainty relation, suggesting that uncertainty arises from measurement disturbance. What is the problem with this interpretation? How does modern quantum mechanics understand the origin of the uncertainty relation?

3. What is the essential difference between the energy-time uncertainty relation $\Delta E \cdot \Delta t \gtrsim \hbar$ and the position-momentum uncertainty relation? Is "time" an operator or a parameter in quantum mechanics?

4. Is the uncertainty relation a "defect" or a "feature" of quantum mechanics? If there were no uncertainty relation, could atoms still exist stably?
