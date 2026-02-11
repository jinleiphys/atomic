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

# 2.3 Hardware-Level Verification

> **Algorithm Goal:** Directly verify the discreteness of atomic energy levels through threshold testing, proving that the atom's energy input port is staircase-shaped rather than linear.

---

## Carbon Story: Knocking on the Atom's Door with Electrons

### Experimental Design

In 1914, James Franck and Gustav Hertz designed an elegant yet profound experiment:

1. In a tube filled with mercury vapor, electrons are emitted from a heated cathode.
2. The electrons are accelerated by an accelerating voltage $V$, then pass through the mercury vapor region and collide with mercury atoms.
3. A small retarding voltage (about 0.5 V) is applied before the collector, allowing only electrons with sufficient kinetic energy to reach it.
4. The collector current $I$ is measured as a function of the accelerating voltage $V$.

### The Surprising Results

If atomic energy absorption were continuous, the current should increase monotonically with voltage. But the experimental results showed:

- When $V < 4.9$ V, the current increases steadily with voltage. The electrons undergo elastic collisions with mercury atoms, losing almost no energy.
- When $V \approx 4.9$ V, the current **drops suddenly**: the electrons have gained enough kinetic energy to exactly excite the first excited state of the mercury atom. In the collision, they transfer 4.9 eV of energy entirely to the mercury atom, causing their own kinetic energy to plummet, so they cannot overcome the retarding voltage to reach the collector.
- As $V$ continues to increase, the current recovers, until $V \approx 9.8$ V when it drops again (the electron undergoes two inelastic collisions along its path).

The current-voltage curve exhibits **sawtooth oscillations** with a period of 4.9 V.

### Physical Significance

The Franck-Hertz experiment directly proved:

- Mercury atoms can only absorb **specific amounts** of energy (4.9 eV), corresponding to the first excited state.
- Energy absorption is not continuous but **all-or-nothing**.
- Bohr's stationary state postulate is correct: atoms indeed possess a discrete energy level structure.

This earned Franck and Hertz the 1925 Nobel Prize in Physics.

---

## Silicon Perspective: Threshold Testing

### Digital Ports vs. Analog Ports

Imagine you are testing an unknown hardware device. You apply voltages of different magnitudes to its input port and observe the output:

- **Analog port**: The output varies linearly with the input, indicating that the internal circuitry is linear.
- **Digital port**: The output changes abruptly only at specific input values, indicating digital logic inside with discrete thresholds.

The Franck-Hertz experiment is a **Threshold Test** on the atom. The experimental results clearly show: the atom's energy input port is **digital**, not analog.

```
Input energy E < 4.9 eV  ->  Atom does not respond (elastic collision)
Input energy E = 4.9 eV  ->  State transition triggered (inelastic collision)
Input energy 4.9 < E < 9.8 eV  ->  One transition + residual kinetic energy
Input energy E = 9.8 eV  ->  Two transitions
...
```

This is behaviorally isomorphic to a **Schmitt Trigger** in digital circuits: the system flips its state only when the input exceeds a threshold.

### Code Example: Simulating the Franck-Hertz Curve

```{code-cell} ipython3
import numpy as np
import matplotlib.pyplot as plt

def franck_hertz_current(V, V_threshold=4.9, V_retard=0.5):
    """
    Simplified Franck-Hertz current model
    V: accelerating voltage
    V_threshold: excitation potential (mercury first excited state = 4.9 V)
    V_retard: retarding voltage
    """
    I = np.zeros_like(V)
    for i, v in enumerate(V):
        if v <= V_retard:
            I[i] = 0
            continue

        # The electron may undergo multiple inelastic collisions along its path
        n_collisions = int(v / V_threshold)  # Number of collisions
        E_residual = v - n_collisions * V_threshold  # Residual kinetic energy (eV)

        # Only electrons with residual energy > retarding voltage reach the collector
        if E_residual > V_retard:
            I[i] = (E_residual - V_retard) * (1 + 0.1 * v)
        else:
            I[i] = 0.01 * v  # Small leakage current

    # Add some noise for realism
    I += np.random.normal(0, 0.02 * I.max(), len(I))
    I = np.maximum(I, 0)
    return I

V = np.linspace(0, 25, 1000)
I = franck_hertz_current(V)

plt.figure(figsize=(10, 5))
plt.plot(V, I, 'b-', linewidth=1)
plt.xlabel('Accelerating Voltage V (V)')
plt.ylabel('Collector Current I (a.u.)')
plt.title('Franck-Hertz Experiment Simulation (Mercury)')

# Mark thresholds
for n in range(1, 6):
    plt.axvline(x=n*4.9, color='red', linestyle='--', alpha=0.4)
    plt.text(n*4.9, plt.ylim()[1]*0.95, f'{n*4.9:.1f}V',
             ha='center', fontsize=8, color='red')

plt.grid(True, alpha=0.3)
plt.tight_layout()
plt.savefig('franck_hertz.png', dpi=150)
plt.show()
```

---

## Discussion Questions

1. In the Franck-Hertz experiment, why does the current curve exhibit periodic oscillations rather than a staircase shape? What happens to the electrons after they lose their energy?

2. Can the Franck-Hertz experiment detect higher excited states of the mercury atom? If so, what features would appear in the experimental curve?

3. When Franck and Hertz performed this experiment in 1914, what were they originally trying to verify? Did they know about the Bohr model at the time? What roles do "accident" and "expectation" play in scientific discovery?

4. The Franck-Hertz experiment is often called "direct proof" of the existence of atomic energy levels. What does "direct proof" mean? Compared with spectroscopic evidence, what unique persuasive power does this experiment have?
