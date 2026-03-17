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

# 2.5 The Franck-Hertz Experiment

## Knocking on the Atom's Door with Electrons

Spectroscopy had provided indirect yet convincing evidence for the existence of atomic energy levels: atoms emit and absorb light at specific frequencies, and these discrete spectral lines could be explained by transitions between stationary states in Bohr's model. However, from the standpoint of rigorous experimental logic, spectroscopic evidence remains indirect. What we observe are photons, not the energy states of the atoms themselves. Is there a way to bypass spectroscopy entirely and use some kind of "probe" to test how much energy an atom can accept, thereby verifying the discreteness of energy levels at the most fundamental level? In 1914, two German physicists, James Franck and Gustav Hertz, pursued exactly this line of reasoning and designed an experiment of striking simplicity and depth, one that would provide the most direct experimental evidence in atomic physics.

Franck was born in Hamburg in 1882 and obtained his doctorate from the University of Heidelberg before moving to the University of Berlin, where he focused on the study of electron collision processes in gases. Hertz, nephew of the great electromagnetic pioneer Heinrich Hertz, was born in Hamburg in 1887 and likewise achieved outstanding academic distinction at the University of Berlin. The two met at the Physical Institute of the University of Berlin in 1913 and began a collaboration that would alter the course of physics. It is worth noting that Franck and Hertz did not originally design their experiment to verify Bohr's model. In fact, when they published their paper in early 1914, they were not well acquainted with Bohr's atomic model published in 1913 and did not cite Bohr's work in their paper. Their original interest was in studying the energy transfer process during collisions between electrons and gas atoms, and in particular they wished to measure the ionization potential of mercury. They believed the 4.9 eV they measured was mercury's ionization energy, not its first excitation energy. This "misunderstanding" actually made their experimental results all the more remarkable: the objective discovery of the experiment transcended the experimenters' original subjective expectations, which is the hallmark of a great experiment.

The apparatus of the Franck-Hertz experiment was ingeniously conceived yet not overly complex. A sealed glass tube was filled with low-pressure mercury vapor. At one end of the tube sat a heated tungsten filament cathode that continuously emitted electrons through thermionic emission. Near the cathode was a grid-like accelerating electrode (anode grid), and an adjustable accelerating voltage $V$ was applied between the cathode and the grid so that electrons leaving the cathode would be accelerated and gain kinetic energy. After acceleration, the electrons passed through the grid and entered the space filled with mercury vapor, where they collided with mercury atoms. On the other side of the grid, close by, was a collector plate, but the crucial step was this: a small retarding voltage (about 0.5 V) was applied between the grid and the collector, creating a decelerating electric field. Only those electrons that still retained sufficient kinetic energy after passing through the grid could overcome this reverse potential difference and reach the collector, where they were registered by a sensitive galvanometer. Electrons that had lost most of their kinetic energy in collisions could not pass this "final gate" and were pushed back by the retarding field. The core measurement of the experiment was simply this: gradually increase the accelerating voltage $V$ while recording the collector current $I$ as a function of $V$.

If atomic energy absorption were continuous, as classical physics would predict, then as the accelerating voltage increased, the electrons would gain ever greater kinetic energy, the energy lost in collisions with mercury atoms would increase continuously, and the collector current should rise more or less monotonically. But what Franck and Hertz observed was entirely unexpected. As the accelerating voltage was raised from zero, in the range $V < 4.9$ V the current did indeed rise steadily with voltage. In this regime the electrons did not yet have enough kinetic energy, and their collisions with mercury atoms were purely elastic. Because the electron mass is far smaller than that of a mercury atom (the mass ratio is approximately 1:370,000), the electron loses almost no kinetic energy in an elastic collision, much like a ping-pong ball bouncing off a bowling ball and rebounding essentially unchanged. These electrons therefore retained sufficient kinetic energy after traversing the mercury vapor to easily surmount the retarding voltage barrier and reach the collector.

But when the accelerating voltage rose to about 4.9 V, the current exhibited a dramatic and sudden drop. This meant that a large number of electrons had suddenly lost nearly all of their kinetic energy while traversing the mercury vapor, to the point where they could no longer overcome even the modest 0.5 V retarding voltage. Franck and Hertz realized there was only one explanation: when the kinetic energy of an electron reached exactly 4.9 eV, a completely new type of collision occurred between the electron and the mercury atom, namely an inelastic collision. In this collision the electron transferred 4.9 eV of energy entirely and all at once to the mercury atom, exciting the atom from its ground state to an excited state, while the electron's own kinetic energy plummeted to nearly zero and it could no longer reach the collector.

As the accelerating voltage continued to rise beyond 4.9 V, the current began to recover. This was because the electrons now had kinetic energy exceeding 4.9 eV, so that after undergoing an inelastic collision and surrendering 4.9 eV, they still retained enough residual kinetic energy to pass through the retarding voltage. But when the voltage reached approximately 9.8 V, the current dropped again. The reason was clear: at this point the electrons had enough kinetic energy to undergo two inelastic collisions along their path, each surrendering 4.9 eV, and after two such collisions they were once again left with insufficient energy. This pattern continued to repeat, with current dips appearing at 14.7 V, 19.6 V, and 24.5 V. The current-voltage curve ultimately displayed sawtooth oscillations with a period of 4.9 V, which is the most iconic experimental signature of the Franck-Hertz experiment.

The physical significance of this result is profound. The Franck-Hertz experiment, in a manner entirely different from spectroscopy, directly demonstrated that mercury atoms can only absorb specific amounts of energy (4.9 eV), corresponding to the transition energy from the ground state to the first excited state ($6\,^1S_0 \to 6\,^3P_1$) of the mercury atom. The atom's absorption of energy is not continuous or capable of taking arbitrary values; rather, it is "all or nothing": the atom either accepts the full 4.9 eV and undergoes a transition, or accepts nothing and remains in elastic collision. This is a direct verification of Bohr's stationary state postulate: atoms indeed possess a discrete energy level structure. Even more convincingly, Franck and Hertz also observed that when the electron energy exceeded 4.9 eV and excited the mercury atom, the mercury vapor emitted ultraviolet radiation at a wavelength of 253.7 nm, whose photon energy was precisely $h\nu = 4.9$ eV. This perfectly closed the evidentiary chain: the electron delivered 4.9 eV of energy to the mercury atom, and the atom, upon returning from its excited state to the ground state, released that energy in the form of a photon whose energy matched exactly the energy transferred by the electron.

After publication of the Franck-Hertz paper, Bohr immediately recognized that this experiment provided the most powerful support for his atomic theory. Yet the historical irony is that Franck and Hertz themselves did not, in their original paper, connect their results to Bohr's model. They interpreted the 4.9 eV as the ionization potential of mercury rather than its first excitation energy. Only through subsequent experiments and theoretical exchanges did they come to appreciate the correct physical interpretation. This episode in the history of science illustrates a clear lesson: experimental facts can exist prior to theoretical understanding, and great experiments sometimes reveal truths that even the experimenters themselves had not anticipated. In 1925, Franck and Hertz were jointly awarded the Nobel Prize in Physics. The Nobel Committee's citation explicitly stated that their contribution lay in "the discovery of the laws governing the impact of an electron upon an atom." This experiment remains a classic in university physics laboratory curricula to this day, and each generation of physics students witnesses the discreteness of atomic energy levels firsthand through this experiment.

## Silicon Perspective: Threshold Testing

In computer engineering, when you are confronted with a hardware device whose function is unknown, one of the most fundamental testing strategies is threshold testing: you gradually increase the amplitude of the signal applied to the device's input port while monitoring the response at the output port, thereby determining the signal processing mechanism inside the device. If the output varies linearly with the input, the internal circuitry is analog, and signal transmission and amplification are continuous. But if the output changes abruptly at certain specific input values while showing almost no response at others, this indicates the presence of digital logic inside the device: the system's state space is discrete and finite, and the system flips from one state to another only when the input reaches or exceeds a certain threshold.

Viewed from this perspective, the Franck-Hertz experiment is, at its core, a threshold test performed on the atom. The experimenters used electrons as "test signals," gradually increasing their energy from zero and injecting them into the mercury atom, the "device under test," then observing changes in the "output" (collector current). The experimental results clearly demonstrate that the atom's energy input port is digital rather than analog. When the input energy is below 4.9 eV, the atom does not respond at all, just as a digital circuit remains unchanged when the input is below the logic threshold; only elastic collisions occur between the electron and the atom, and no energy is absorbed. When the input energy reaches exactly 4.9 eV, the atom suddenly responds, absorbing the full 4.9 eV and undergoing a state transition from the ground state to the excited state, corresponding to a state flip in a digital circuit. When the input energy lies between 4.9 eV and 9.8 eV, the atom still executes only one transition, absorbing 4.9 eV, with the excess energy remaining with the electron as residual kinetic energy. When the input energy reaches 9.8 eV, the electron can trigger two transitions along its path, each of 4.9 eV. And so on.

This behavioral pattern is functionally isomorphic to a Schmitt trigger in digital circuits. A Schmitt trigger is a comparator with hysteresis characteristics: the output flips from low to high only when the input voltage rises above the upper threshold $V_+$, and the output flips back to low only when the input falls below the lower threshold $V_-$. In the Franck-Hertz experiment, 4.9 eV plays the role of the upper threshold: when the electron energy is below this value, the atom remains in its ground state ("output" is low); when it exceeds this value, the atom undergoes a state flip ("output" is high). Of course, there are differences between the atom and a Schmitt trigger. The Schmitt trigger's threshold is set by an external resistor network and is adjustable, whereas the atom's energy level spacing is determined by quantum mechanics and is a function of natural constants, not adjustable. But the core message conveyed by both is the same: the system's state space is discrete, and transitions between states are abrupt rather than gradual.

Pushing this analogy further, the Franck-Hertz experiment actually reveals a "quantized input protocol." In modern digital communications, an analog-to-digital converter (ADC) transforms a continuous analog signal into a discrete digital signal, quantizing the signal's amplitude into a finite number of discrete levels. The atom is, in a sense, nature's most primitive "analog-to-digital converter": the energy it receives is continuously variable (an electron can carry any amount of kinetic energy), but the energy it can actually accept and store takes only a finite number of discrete values (corresponding to the energies of the various excited states). This "quantized input" is the core feature of quantum mechanics and the most original meaning of the word "quantum" itself, the fundamental unit of energy.

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

## Discussion Questions

1. In the Franck-Hertz experiment, why does the current curve exhibit periodic oscillations rather than a staircase shape? What happens to the electrons after they lose their energy?

2. Can the Franck-Hertz experiment detect higher excited states of the mercury atom? If so, what features would appear in the experimental curve?

3. When Franck and Hertz performed this experiment in 1914, what were they originally trying to verify? Did they know about the Bohr model at the time? What roles do "accident" and "expectation" play in scientific discovery?

4. The Franck-Hertz experiment is often called "direct proof" of the existence of atomic energy levels. What does "direct proof" mean? Compared with spectroscopic evidence, what unique persuasive power does this experiment have?
