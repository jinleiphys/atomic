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

# 2.2 Bohr's Quantization Postulates

## From the Classical Crisis to the Quantization Postulates

In 1911, Rutherford's alpha-particle scattering experiments at Manchester revealed the nuclear structure of the atom (Chapter 1), but this model immediately precipitated a profound theoretical crisis. According to classical electrodynamics, an accelerating charged particle must radiate electromagnetic waves. An electron in orbital motion around the nucleus is in a state of continuous acceleration, so it should radiate energy without cease. As energy drains away, the electron's orbit would shrink continuously, and within roughly $10^{-11}$ seconds the electron would spiral into the nucleus. In other words, classical theory predicted that atoms are unstable and that no atom could persist for any appreciable length of time. Yet atoms are manifestly stable; they constitute the foundation of all matter around us. At the same time, precision spectroscopy was accumulating data that classical theory could not explain: the emission spectrum of hydrogen was not a continuous rainbow but a series of sharply defined bright lines, and the Rydberg formula (Section 2.1) described their wavelength distribution with stunning accuracy, though no one could derive this empirical formula from first principles. Physics had arrived at an impasse: on one hand, Rutherford's scattering experiments provided a compelling picture of a nuclear atom; on the other hand, that picture could not exist self-consistently within the framework of classical physics.

It was against this backdrop that the young Danish physicist Niels Bohr (1885-1962) stepped onto the stage of history. Bohr was born in Copenhagen into an academic family; his father was a professor of physiology at the University of Copenhagen, and his mother came from one of Denmark's wealthiest banking dynasties. In 1911, Bohr earned his doctorate from the University of Copenhagen with a dissertation on the electron theory of metals. After receiving his degree, he traveled to England for postdoctoral work, spending several months at Cambridge under J.J. Thomson. Although Thomson was the discoverer of the electron, his interest in the theoretical frontier had waned by then, and the collaboration was not a fruitful one. In early 1912, Bohr moved to Manchester and joined Rutherford's research group. Those months in Manchester proved to be the turning point of Bohr's scientific career. Rutherford had just published his nuclear model of the atom, and the entire group was alive with enthusiasm for exploring atomic structure. Bohr recognized with great acuity that the problem of atomic stability could never be resolved within the classical framework, and that some entirely new principle was required. Drawing inspiration from Planck's quantum hypothesis of 1900 and Einstein's light-quantum theory of 1905, he began to attempt grafting the concept of quantization onto Rutherford's planetary model.

In 1913, Bohr published three landmark papers, later known collectively as "the great trilogy." His approach was bold to the point of audacity: rather than attempting to patch the contradictions within classical theory, he simply declared that certain classical laws no longer applied at the atomic scale and forcibly imposed new quantization rules. This method provoked intense controversy in the physics community, but events would prove that it pointed in the right direction.

Bohr's first postulate concerned the existence of stationary orbits. He assumed that an electron in an atom can only move in a series of specific, stable orbits corresponding to a discrete set of energy values, which he called "stationary states." An electron in a stationary state, despite undergoing circular motion around the nucleus, does not radiate electromagnetic waves. This postulate directly contradicted the predictions of classical electrodynamics for accelerating charges and was an extraordinarily bold assertion. In a stationary state, the energy of the hydrogen atom is uniquely determined by the quantum number $n$:

$$
E_n = -\frac{me^4}{2\hbar^2} \cdot \frac{1}{n^2} = -\frac{13.6 \text{ eV}}{n^2}, \quad n = 1, 2, 3, \ldots
$$

The negative sign indicates that the electron is in a bound state. The value $n=1$ corresponds to the ground state with the lowest energy. As $n$ increases, the energy rises (approaching zero), and in the limit $n \to \infty$ the energy tends to zero, corresponding to the electron being completely freed from the nucleus, that is, the ionization state.

Bohr's second postulate specified the law governing the emission and absorption of electromagnetic radiation when an electron transitions between stationary states. When an electron drops from a higher energy level $E_{n_2}$ to a lower energy level $E_{n_1}$, the atom emits a photon whose frequency $\nu$ is determined by the energy difference between the two levels:

$$
h\nu = E_{n_2} - E_{n_1}
$$

This relation applies Planck's energy quantization condition $E = h\nu$ directly to the atomic radiation process. Conversely, if the atom absorbs a photon whose frequency exactly satisfies the equation above, the electron will be promoted from the lower level to the higher one. This postulate elegantly explains the discrete nature of atomic spectra: since the energy levels are discrete, the energy difference between any two levels can take only specific discrete values, and therefore the atom can emit or absorb only certain discrete frequencies of light.

Bohr's third postulate was the angular momentum quantization condition, which served as the keystone of the entire theoretical edifice. Bohr postulated that when the electron moves in a circular orbit around the nucleus, its orbital angular momentum can only take integer multiples of the reduced Planck constant $\hbar = h/2\pi$:

$$
L = m_e v r = n\hbar, \quad n = 1, 2, 3, \ldots
$$

Here $m_e$ is the electron mass, $v$ is the orbital speed, $r$ is the orbital radius, and $n$ is a positive integer called the principal quantum number. This condition may seem to have been conjured out of thin air, but it is the crucial bridge connecting classical mechanics to the quantum world. Part of the reason Bohr chose to quantize angular momentum (rather than some other physical quantity) was that angular momentum has the same dimensions as Planck's constant $h$ (both carry units of $\text{J} \cdot \text{s}$), hinting at a deep connection between them. A decade later, de Broglie would provide a far more natural explanation: if the electron possesses wave-like properties with a de Broglie wavelength $\lambda = h/mv$, then the condition for a stable orbit is that the orbital circumference accommodate an integer number of wavelengths, that is, $2\pi r = n\lambda$, from which $mvr = n\hbar$ follows immediately. In other words, Bohr's angular momentum quantization condition is, at its heart, another way of stating the electron standing-wave condition.

With these three postulates in hand, deriving the orbital radii and energy levels of the hydrogen atom becomes a straightforward exercise in algebra. Consider the electron moving in uniform circular motion around the proton. Two equations must be solved simultaneously. The first is Bohr's angular momentum quantization condition $m_e v r = n\hbar$. The second comes from classical mechanics: the Coulomb attractive force provides the centripetal force needed for circular motion:

$$
\begin{cases}
m_e v r = n\hbar \\
\displaystyle\frac{e^2}{4\pi\epsilon_0 r^2} = \frac{m_e v^2}{r}
\end{cases}
$$

Solving the first equation for the velocity gives $v = n\hbar / (m_e r)$. Substituting this into the second equation yields

$$
\frac{e^2}{4\pi\epsilon_0 r^2} = \frac{m_e}{r} \cdot \frac{n^2\hbar^2}{m_e^2 r^2} = \frac{n^2\hbar^2}{m_e r^3}
$$

Rearranging and solving for $r$, we obtain the radius of the $n$-th allowed orbit:

$$
r_n = \frac{4\pi\epsilon_0 \hbar^2}{m_e e^2} \cdot n^2 = a_0 n^2
$$

Here $a_0 = 4\pi\epsilon_0 \hbar^2 / (m_e e^2) = 0.529 \text{ \AA}$ is the celebrated Bohr radius, the orbital radius of the hydrogen atom in its ground state ($n=1$). The orbital radius scales as the square of the quantum number, which means the $n=2$ orbit is four times larger than the ground-state orbit, the $n=3$ orbit is nine times larger, and the spacing between adjacent orbits grows as $n$ increases. Substituting $r_n$ and $v_n$ into the expression for the total energy of the electron (kinetic energy plus Coulomb potential energy) gives

$$
E_n = \frac{1}{2}m_e v_n^2 - \frac{e^2}{4\pi\epsilon_0 r_n} = -\frac{m_e e^4}{2(4\pi\epsilon_0)^2 \hbar^2} \cdot \frac{1}{n^2} = -\frac{13.6 \text{ eV}}{n^2}
$$

Combining the energy difference $E_{n_2} - E_{n_1}$ with $h\nu = hc/\lambda$ immediately yields

$$
\frac{1}{\lambda} = \frac{m_e e^4}{8\epsilon_0^2 h^3 c} \left(\frac{1}{n_1^2} - \frac{1}{n_2^2}\right)
$$

where $m_e e^4 / (8\epsilon_0^2 h^3 c)$ is precisely the Rydberg constant $R_\infty$. Starting from three simple postulates, Bohr had not only derived the exact form of the Rydberg formula but also expressed the Rydberg constant in terms of fundamental physical constants. When the experimental values of the electron mass, electron charge, Planck's constant, and the speed of light were substituted, the calculated $R_\infty$ agreed with the spectroscopic measurement to within the experimental precision of the time. The achievement was stunning: the mysterious constant that had "fallen from the sky" into an empirical formula now stood on firm theoretical ground.

Bohr's theory provoked strong reactions throughout the physics community upon its publication. Einstein, upon hearing of Bohr's results, remarked: "This is an enormously high level of musicality (Musikalitat)." The choice of word was telling; it suggested that Einstein considered Bohr's work beautiful but not yet a complete theory, more akin to a stroke of genius improvisation. Rutherford, with his characteristic directness, expressed both admiration and concern: "Your ideas about the origin of the hydrogen spectrum are very ingenious and seem to work out well. But there is one grave difficulty in your hypothesis which I have no doubt you fully realize: how does an electron decide what frequency it is going to vibrate at when it passes from one stationary state to another?" Rutherford's question touched on a deep difficulty in Bohr's theory, one that would not be truly resolved until the maturation of quantum mechanics. At Gottingen, the leading theoretical physicists were generally skeptical. Sommerfeld initially considered Bohr's theory too crude, but he later became one of its most important developers, introducing elliptical orbits and relativistic corrections to create what is known as the "old quantum theory."

Bohr was awarded the 1922 Nobel Prize in Physics "for his services in the investigation of the structure of atoms and of the radiation emanating from them." Although his theory would expose fundamental limitations when confronted with multi-electron atoms and fine structure (it remained, at its core, a semi-classical theory that retained the concept of classical orbits), its place in the history of physics is unassailable. The Bohr model was the first to successfully apply quantization conditions to atomic structure, it accurately predicted the hydrogen atom spectrum, and it established a bridge between classical and quantum physics. More importantly, it introduced the core concepts of stationary states, energy-level transitions, and quantum numbers, paving the way for Heisenberg and Schrodinger to construct the full framework of quantum mechanics.

## Silicon Perspective: Analog-to-Digital Conversion (ADC)

Viewed through the lens of computer science, what Bohr accomplished was essentially an analog-to-digital conversion (ADC). This analogy is not mere literary flourish; it is precise down to the level of mathematical structure.

In Rutherford's classical planetary model, the orbital radius $r$ of the electron is a continuous variable that can take any positive real value from zero to infinity, just as an analog signal can assume any voltage within its range. Correspondingly, the orbital energy $E$ is also a continuous variable, free to vary continuously across the entire interval $(-\infty, 0)$. This means the "state space" of the classical model is an uncountable continuum containing infinitely many possible orbital states. Yet this continuous state space is precisely the root cause of the classical model's collapse: because the orbital radius can vary continuously, the electron is able to radiate energy away continuously, spiraling ever closer to the nucleus until catastrophic collapse ensues.

Bohr's quantization condition $L = n\hbar$ plays the role of a "sampler," extracting a discrete set of sample points from this continuous analog signal. After this sampling operation, the allowed orbital radii shrink from a continuum to a countable set $r \in \{a_0, 4a_0, 9a_0, 16a_0, \ldots\}$, and the corresponding energies change from a continuous spectrum to a discrete one: $E \in \{-13.6, -3.40, -1.51, -0.85, \ldots\}$ eV. In this analogy, Planck's constant $\hbar$ plays the role of "sampling resolution" or "bit depth": it sets the minimum scale of quantization, just as an 8-bit ADC quantizes an analog signal into 256 discrete levels. If the value of $\hbar$ were to approach zero (which corresponds physically to the classical limit), the quantization interval would shrink to nothing, the discrete energy levels would merge into a continuous energy spectrum, and we would recover the picture of classical mechanics. This is the essence of Bohr's correspondence principle.

The ADC analogy has a second layer of meaning that pertains to the transition of electrons between discrete energy levels. In a digital system, data can only be stored at specific memory addresses; the address space is discrete, and data cannot exist "between" two addresses. Likewise, in Bohr's model, an electron can only reside at a specific energy level; it cannot linger in some intermediate state between $n=1$ and $n=2$. When an electron transitions from one level to another, the process in Bohr's theory is instantaneous, with no intermediate transitional state, much like a pointer in a computer jumping from one memory address to another. The energy released during the transition is output in the form of a photon, whose energy equals the energy difference between the two "addresses." This naturally explains why atomic spectra are discrete: because the energy levels (addresses) are discrete, the energy difference (address gap) between any two levels can only take a finite set of discrete values, so the emitted photon frequencies must also belong to a discrete set.

It is worth noting that the ADC analogy also illuminates a profound consequence of quantization: the loss of information and the gain of stability are two sides of the same coin. In the analog world, a signal can in principle carry information with infinite precision, but it is also extremely vulnerable to noise corruption and degradation. After digitization, the signal is quantized into a finite number of discrete levels; precision is limited, but the signal simultaneously gains powerful immunity to noise. Similarly, in the classical atomic model, the electron's state space is continuous and the "information content" is in a sense infinite, but the system is profoundly unstable (classical collapse). Bohr's quantization compresses the state space to a countable set of discrete points, seemingly "discarding information," yet it endows the atom with unprecedented stability: when the electron is in the ground state $n=1$, there is no lower level to which it can transition, so the atom cannot collapse. This is much like a digital signal that, once quantized to the lowest significant bit, can degrade no further.

## AI Workshop: Bohr Model Energy Level Diagram

```{code-cell} ipython3
import numpy as np
import matplotlib.pyplot as plt

# Bohr model energy levels
def E_n(n):
    """Energy of the n-th level of hydrogen (eV)"""
    return -13.6 / n**2

# Plot energy level diagram
fig, ax = plt.subplots(figsize=(8, 10))

n_max = 7
for n in range(1, n_max + 1):
    E = E_n(n)
    ax.hlines(E, 0.2, 0.8, colors='blue', linewidth=2)
    ax.text(0.85, E, f'n={n}, E={E:.2f} eV', va='center', fontsize=10)

# Annotate several transitions (Balmer series)
transitions = [(3, 2, 'red'), (4, 2, 'cyan'), (5, 2, 'blue'), (6, 2, 'violet')]
for n2, n1, color in transitions:
    E_upper = E_n(n2)
    E_lower = E_n(n1)
    dE = E_upper - E_lower
    lam = 1240 / dE  # nm (from E = hc/lambda, with E in eV, lambda in nm)
    ax.annotate('', xy=(0.5, E_lower), xytext=(0.5, E_upper),
                arrowprops=dict(arrowstyle='->', color=color, lw=1.5))
    ax.text(0.52, (E_upper + E_lower)/2, f'{lam:.0f} nm',
            fontsize=8, color=color)

ax.set_xlim(0, 1.2)
ax.set_ylim(-15, 1)
ax.set_ylabel('Energy (eV)')
ax.set_title('Hydrogen Atom Bohr Model Energy Level Diagram')
ax.axhline(y=0, color='gray', linestyle='--', alpha=0.5, label='Ionization limit')
ax.get_xaxis().set_visible(False)
ax.legend()
plt.tight_layout()
plt.savefig('bohr_energy_levels.png', dpi=150)
plt.show()
```

## Discussion Questions

1. Bohr's quantization condition $L = n\hbar$ appears highly "artificial." How did Bohr himself defend this postulate? How did de Broglie later provide a more natural explanation using the concept of matter waves?

2. The Bohr model successfully explained the hydrogen atom spectrum, but what are its fundamental limitations? Why can it not be extended to multi-electron atoms?

3. In the Bohr model, the electron moves in a fixed orbit without radiating, which clearly violates classical electromagnetic theory. How did Bohr handle this contradiction? What role did the "correspondence principle" play?

4. The Bohr model is "semi-classical": it retains the concept of classical orbits while introducing quantization conditions. Why was this "hybrid" theory able to succeed? Was its success merely a coincidence?
