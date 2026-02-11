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

# 3.1 Class Inheritance of Objects

> **Algorithm Goal:** Understand how microscopic particles simultaneously implement both the "particle" and "wave" interfaces, and how experimental conditions determine which interface is called.

---

## Carbon Story: What Is Light, Really?

### Three Centuries of Debate

- **Newton (1672):** Light is a stream of particles (corpuscular theory), which explains reflection and rectilinear propagation.
- **Huygens (1678):** Light is a wave (wave theory), which explains diffraction and interference.
- **Young's double-slit experiment (1801):** Clearly showed interference fringes; the wave theory won.
- **Maxwell (1865):** Light is an electromagnetic wave, with theoretical predictions in perfect agreement with experiment; the wave theory triumphed decisively.

By the end of the 19th century, everything seemed settled. Then:

- **Photoelectric effect (1905):** Einstein showed that when light exchanges energy with matter, it behaves as discrete "light quanta" (photons) with energy $E = h\nu$.
- **Compton scattering (1923):** When X-rays collide with electrons, the behavior is exactly like an elastic collision between two particles; photons carry momentum $p = h/\lambda$.

Light is both a wave and a particle.

### De Broglie's Generalization

In 1924, de Broglie (Louis de Broglie) proposed a bold symmetry argument in his doctoral thesis:

> If light waves exhibit particle properties, then particles should also exhibit wave properties.

Any particle with momentum $p$ has a corresponding wavelength:

$$
\lambda = \frac{h}{p} = \frac{h}{mv}
$$

This is the **de Broglie wavelength**. For macroscopic objects (such as a baseball), $\lambda \sim 10^{-34}$ m, far smaller than any observable scale, so wave behavior is undetectable. But for an electron, $\lambda \sim 10^{-10}$ m, comparable to atomic scales, and wave behavior should be observable.

In 1927, the electron diffraction experiment by Davisson and Germer confirmed this prediction.

---

## Silicon Perspective: Multiple Inheritance

### Object Modeling

In object-oriented programming, a class can inherit properties and methods from multiple parent classes simultaneously. The wave-particle duality of microscopic particles can be modeled naturally with **Multiple Inheritance**:

```python
class Particle:
    """Particle base class"""
    def __init__(self, mass, charge):
        self.mass = mass
        self.charge = charge
        self.position = None  # Can have a definite position
        self.momentum = None  # Can have a definite momentum

    def scatter(self, target):
        """Particle scattering: obeys conservation of momentum and energy"""
        ...

class Wave:
    """Wave base class"""
    def __init__(self, frequency, wavelength):
        self.frequency = frequency
        self.wavelength = wavelength

    def interfere(self, other_wave):
        """Wave interference: amplitude superposition"""
        ...

    def diffract(self, slit_width):
        """Wave diffraction: significant when slit width ~ wavelength"""
        ...

class Electron(Particle, Wave):
    """Electron: inherits both particle and wave properties"""
    def __init__(self, momentum):
        Particle.__init__(self, mass=9.109e-31, charge=-1.602e-19)
        self.momentum = momentum
        # De Broglie relation: wavelength determined by momentum
        self.wavelength = 6.626e-34 / abs(momentum)
        self.frequency = abs(momentum)**2 / (2 * self.mass * 6.626e-34)

    def observe(self, experiment_type):
        """Experimental conditions determine which interface is called"""
        if experiment_type == "double_slit":
            return self.interfere(...)   # Calls the Wave interface
        elif experiment_type == "collision":
            return self.scatter(...)     # Calls the Particle interface
```

### Key Insight

This analogy reveals an important point: **wave-particle duality is not a contradiction but two interfaces of the same object.** "Wave" and "particle" reflect the limitations of human language (classical concepts). Objects in the microscopic world are inherently neither classical waves nor classical particles; they are a new kind of entity, and we can only see different facets of it under different experimental conditions.

In programming terms: we have no language that directly describes the full picture of an `Electron` object. We can only call its different methods (different experiments) to obtain different projections of it.

---

## Exercises

1. Why is the wave nature of macroscopic objects unobservable? Is it solely because the wavelength is too short? (Hint: consider decoherence effects and the influence of the environment.)

2. When de Broglie proposed the matter-wave hypothesis in 1924, there was no experimental evidence for it yet. On what basis did he believe the idea was correct? What role does "symmetry" play in physical conjectures?

3. The electron is both a particle and a wave. How do these two descriptions coexist? Does wave-particle duality mean that the electron "is sometimes a particle, sometimes a wave," or that it "is neither a particle nor a wave"?
