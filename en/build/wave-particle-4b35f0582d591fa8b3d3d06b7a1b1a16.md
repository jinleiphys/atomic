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

# 3.1 Wave-Particle Duality

## What Is Light, Really?

The debate over the nature of light can be traced back to the 17th century, and this protracted intellectual battle, with its depth and dramatic reversals, stands as one of the most fascinating chapters in the history of physics.

In 1672, Isaac Newton submitted his paper on light and color to the Royal Society. Newton argued that light consists of a stream of extremely tiny particles, which shoot out from a source at enormous speed, travel in straight lines, and produce the sensation of sight upon striking our eyes. This was the so-called "corpuscular theory." The corpuscular theory could naturally explain many commonly observed optical phenomena: light travels in straight lines and casts sharp shadows; light reflects from mirrors according to the law that the angle of incidence equals the angle of reflection, much like an elastic ball bouncing off a wall; light refracts upon entering a different medium, which Newton attributed to different forces acting on the particles at the interface. Bolstered by Newton's unrivaled prestige in the scientific world, the corpuscular theory dominated the understanding of light throughout the entire 18th century.

However, just a few years after Newton proposed his corpuscular theory, the Dutch physicist Christiaan Huygens put forward an entirely different explanation in 1678. Huygens argued that light is a form of wave motion, analogous to sound waves propagating through air or water waves spreading across a surface. In his theory, the vibrations produced by a light source propagate in all directions through a medium pervading all of space, called the "ether." Huygens established a principle that still bears his name to this day: every point on a wavefront can be regarded as a new source of secondary wavelets, and the envelope of these wavelets forms the new wavefront. Using this principle, Huygens could not only explain the rectilinear propagation and reflection of light, but could also more naturally explain refraction, particularly the fact that light slows down upon entering a denser medium. The corpuscular theory, by contrast, had to assume that light travels faster in denser media, an assumption later proved to be wrong. Another advantage of Huygens' theory was its ability to explain diffraction, the slight bending of light around the edges of obstacles, which posed extreme difficulty for the corpuscular theory.

This debate remained essentially unresolved for nearly a century and a half, with Newton's authority keeping the corpuscular theory in the ascendancy. The true turning point came in 1801, when the English physician and physicist Thomas Young carried out his famous double-slit experiment. Young directed a beam of monochromatic light through two very closely spaced slits, then observed the distribution of light on a distant screen. If light were a stream of particles, one would expect to see just two bright bands on the screen, corresponding to the projections of the two slits. What Young observed instead was a series of alternating bright and dark fringes, an interference pattern. Such a pattern can only be produced by waves: waves emanating from the two slits arrive in phase at certain locations (crest meets crest), producing bright fringes, and out of phase at other locations (crest meets trough), producing dark fringes. Young even calculated the wavelengths of different colors of light precisely from the fringe spacing, finding that visible light has wavelengths between 400 and 700 nanometers. The double-slit experiment, with its simplicity and irrefutable logic, became the most powerful evidence for the wave theory.

Young's experiment caused a great stir in the academic world, but supporters of the corpuscular theory did not immediately surrender. What truly gave the wave theory its decisive victory was the French physicist Augustin Fresnel's mathematical formalization of diffraction theory in 1818. Fresnel combined Huygens' principle with the principle of interference, developing a complete theory of diffraction capable of precisely calculating diffraction patterns in all kinds of situations. The story goes that when Fresnel submitted his diffraction theory to the French Academy of Sciences, one of the reviewers, Poisson (Simeon Denis Poisson), a staunch supporter of the corpuscular theory, attempted to disprove the theory by reductio ad absurdum. Poisson used Fresnel's formulas to calculate that if light really were a wave, then directly behind an opaque disk, a bright spot should appear at the very center of the shadow, which was obviously absurd. However, another reviewer, Arago (Dominique Francois Jean Arago), promptly carried out the experiment, and indeed observed a bright spot at the center of the disk's shadow! This unexpected result instead became the most dramatic victory for the wave theory, and the bright spot is still known as "Poisson's spot" or "Arago's spot."

In 1865, James Clerk Maxwell elevated optics to an entirely new level. He established a unified theory of electromagnetic fields, describing all the behavior of electric and magnetic fields with four elegant equations. From these equations, Maxwell proved that a changing electric field generates a magnetic field, and a changing magnetic field generates an electric field; the two mutually excite each other, forming electromagnetic waves that propagate at a finite speed. When he calculated the propagation speed of electromagnetic waves, the value he obtained was precisely equal to the speed of light. Maxwell thus arrived at a revolutionary conclusion: light is an electromagnetic wave. In 1888, Heinrich Hertz experimentally produced and detected electromagnetic waves, confirming Maxwell's prediction. At this point, the wave nature of light seemed beyond any doubt, and the corpuscular theory was definitively consigned to the dustbin of history.

By the end of the 19th century, physicists were nearly unanimous in believing that the debate over the nature of light had been settled forever. Light is an electromagnetic wave, a clean, elegant conclusion verified by both theory and experiment. Yet just when everything seemed to be settled, new experimental facts resurrected the ghost of the particle from its grave.

In 1887, Hertz himself, during the very experiments that verified the existence of electromagnetic waves, accidentally discovered a strange phenomenon: when ultraviolet light shines on a metal surface, it causes the metal to release charged particles (later identified as electrons). This is the photoelectric effect. Subsequent experiments revealed several puzzling features of this effect. First, the photoelectric effect has a cutoff frequency: if the frequency of the incident light is below a certain threshold, no electrons are released no matter how intense the light or how long the exposure. Second, when the frequency exceeds the cutoff, electrons are released almost instantaneously, with no measurable time delay. Third, the maximum kinetic energy of the released electrons depends only on the frequency of the light, not on its intensity; increasing the intensity only increases the number of released electrons, not the energy of any individual electron. These features were completely inexplicable by classical wave theory. According to wave theory, the energy of light is determined by its intensity (the square of the amplitude), and frequency should not play a decisive role. Moreover, if light is a wave, its energy should be spread uniformly over the wavefront, and a single electron on the metal surface could only slowly accumulate energy, making it impossible to instantaneously acquire enough energy to escape.

In 1905, the 26-year-old Albert Einstein published a paper that resolved the mystery of the photoelectric effect in a bold and elegant fashion. Einstein proposed that light is not a continuous wave but rather consists of indivisible packets of energy, which he called "light quanta" (Lichtquant), later named "photons." The energy of each photon is uniquely determined by the frequency of the light:

$$
E = h\nu
$$

where $h$ is Planck's constant. When a photon is absorbed by an electron on the metal surface, the electron gains energy $h\nu$. If this energy exceeds the minimum energy required to free the electron from the metal (the work function $W$), the electron can escape, with the excess energy converted to kinetic energy:

$$
E_k^{\max} = h\nu - W
$$

This simple equation explains all the features of the photoelectric effect at once. The cutoff frequency exists because when $h\nu < W$, a single photon does not carry enough energy to liberate an electron from the metal. The instantaneous release of electrons occurs because the energy exchange happens between a single photon and a single electron, requiring no accumulation process. The linear relationship between maximum kinetic energy and frequency follows directly from $E_k^{\max} = h\nu - W$. An increase in light intensity means an increase in the number of photons, hence more electrons are released, but the energy of each photon (determined by frequency) remains unchanged, so the maximum kinetic energy of any individual electron stays the same. Einstein's light quantum hypothesis was so radical that even Planck himself, who had introduced the quantum concept, was skeptical. It was not until 1916 that the American physicist Robert Millikan, through precision experiments, verified Einstein's photoelectric equation, obtaining a value of $h$ in perfect agreement with the one Planck had derived from blackbody radiation. Ironically, Millikan had originally undertaken these experiments with the express purpose of disproving Einstein's theory, as he did not believe in the existence of light quanta, but his results confirmed it perfectly. Einstein was awarded the 1921 Nobel Prize in Physics for his theory of the photoelectric effect.

If the photoelectric effect revealed the first act of the drama of light's particle nature, then Compton scattering was its climax. In 1923, the American physicist Arthur Compton directed X-rays at graphite and observed the scattered X-rays. Classical wave theory predicted that the wavelength of the scattered light should be the same as that of the incident light (this is classical Thomson scattering). However, Compton found that in addition to a component with the same wavelength as the incident light, the scattered radiation also contained a component with a longer wavelength, and the increase in wavelength depended on the scattering angle. Compton explained this phenomenon perfectly by treating the interaction as an elastic collision between a photon and an electron. He treated the photon as a genuine particle possessing energy $E = h\nu$ and momentum $p = h/\lambda$, then applied the laws of conservation of energy and momentum to analyze the collision between a photon and a stationary electron. After the collision, the photon transfers some of its energy and momentum to the electron, so the scattered photon has lower energy (lower frequency) and longer wavelength. The wavelength shift derived from the conservation laws is:

$$
\Delta\lambda = \lambda' - \lambda = \frac{h}{m_e c}(1 - \cos\theta)
$$

where $\theta$ is the scattering angle, $m_e$ is the electron mass, and $c$ is the speed of light. The coefficient $h/(m_e c) = 2.426 \times 10^{-12}$ m is called the "Compton wavelength" of the electron. Compton's experimental data matched this formula with excellent precision. The significance of Compton scattering is that it not only demonstrated that photons possess energy, but also that they carry momentum, and that photons interacting with matter obey exactly the same conservation laws as particle collisions in classical mechanics. This made the particle picture of light unavoidable.

At this point, physicists faced an unprecedented dilemma: interference and diffraction experiments irrefutably proved that light is a wave, while the photoelectric effect and Compton scattering equally irrefutably proved that light is a particle. Light is both a wave and a particle: this is wave-particle duality.

The story did not end there. In 1924, a young French aristocrat, Louis de Broglie, proposed an even bolder generalization in his doctoral thesis. De Broglie's reasoning was grounded in a profound intuition about symmetry: if light, traditionally considered a wave, turns out to have particle properties, then might electrons, traditionally considered particles, also have wave properties? De Broglie proposed that any particle with momentum $p$ has a corresponding wavelength:

$$
\lambda = \frac{h}{p} = \frac{h}{mv}
$$

This is the **de Broglie wavelength**. The beauty of this hypothesis lies in its extension of Einstein's relation $p = h/\lambda$, originally applied to photons, to all material particles. For macroscopic objects, such as a baseball with mass 0.15 kg traveling at 30 m/s, the de Broglie wavelength is roughly $\lambda = h/(mv) \approx 1.5 \times 10^{-34}$ m, a scale far smaller than any known physical structure, which is why the wave nature of a baseball is undetectable in any conceivable experiment. For an electron, however, the situation is entirely different. An electron accelerated through a potential of 100 volts has a momentum of about $5.4 \times 10^{-24}$ kg$\cdot$m/s, corresponding to a de Broglie wavelength of about $1.2 \times 10^{-10}$ m, or 1.2 angstroms, which happens to be comparable to the spacing between atoms in a crystal. This means that the wave nature of electrons should be observable at atomic scales.

De Broglie's thesis defense reportedly involved some uncertainty. The examination committee was cautious about the hypothesis and sent the thesis to Einstein for his opinion. Einstein replied that de Broglie had "lifted a corner of a great veil." With Einstein's endorsement, de Broglie passed his defense successfully. It is worth noting that de Broglie's matter wave hypothesis also provided an intuitive explanation for the angular momentum quantization condition $L = n\hbar$ in Bohr's model: the circumference of the electron's orbit must be exactly an integer multiple of the de Broglie wavelength, $2\pi r = n\lambda$, so that the electron wave forms a standing wave on the orbit without destructively interfering with itself. Substituting $\lambda = h/p = h/(m_e v)$ immediately yields $m_e v r = n\hbar$, which is precisely Bohr's quantization condition. What had originally appeared to be an arbitrary rule now had a natural physical picture behind it.

De Broglie's hypothesis was experimentally verified in 1927. Clinton Davisson and Lester Germer at Bell Laboratories in the United States were not originally attempting to test de Broglie's hypothesis. They were studying the scattering of electrons from the surface of a nickel crystal when their vacuum system accidentally leaked, oxidizing the nickel sample. To remove the oxide layer, they annealed the nickel at high temperature for an extended period. The annealing unexpectedly transformed the originally polycrystalline nickel into a few large single-crystal grains. When they resumed their scattering experiments, they found that the intensity of scattered electrons showed pronounced peaks at certain specific angles, the characteristic pattern of diffraction. Davisson and Germer realized that what they were observing was the diffraction of electrons by the regularly arranged atoms of the crystal, just as X-rays are diffracted by crystals. They measured the energy of the electron beam and the angles of the diffraction peaks, used Bragg's law $n\lambda = 2d\sin\theta$ to calculate the electron wavelength, and found precise agreement with the value given by de Broglie's formula. At nearly the same time, the British physicist George Paget Thomson (the son of J.J. Thomson) independently observed electron diffraction rings by passing electrons through thin metal films, further confirming the wave nature of electrons. History left behind a poignant symmetry at this juncture: the father, J.J. Thomson, won the Nobel Prize for proving that the electron is a particle, while the son, G.P. Thomson, won the Nobel Prize for proving that the electron is a wave. The work of father and son was not contradictory; together, they revealed the complete picture of the electron's wave-particle duality.

## Silicon Perspective: Multiple Inheritance

In object-oriented programming (OOP), there is a mechanism known as "Multiple Inheritance" that allows a subclass to inherit properties and methods from multiple parent classes simultaneously. The wave-particle duality of microscopic particles bears a deep structural resemblance to multiple inheritance, and this analogy is worth exploring carefully.

Consider the two foundational "classes" that classical physics provides. The first is the `Particle` class, which encapsulates the core attributes of a particle: mass, charge, position, and momentum. The methods of the Particle class include scattering (obeying conservation of momentum and energy), collision, and so forth. The second is the `Wave` class, which encapsulates the core attributes of a wave: frequency, wavelength, amplitude, and phase. The methods of the Wave class include interference (amplitude superposition), diffraction (bending around obstacles), and so on. In classical physics, these two classes are completely independent, with no inheritance relationship between them. An object is either a particle or a wave; it cannot be both.

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

What quantum mechanics does is create a new class, such as `Electron`, that simultaneously inherits from both the `Particle` and `Wave` base classes. The `Electron` possesses all the attributes of a particle (mass, charge, momentum) and all the attributes of a wave (frequency, wavelength), and these attributes are tightly coupled through the de Broglie relation $\lambda = h/p$ and the Einstein relation $E = h\nu$. More importantly, the `Electron` inherits all the methods of both base classes: it can call `scatter` (colliding like a particle) and also `interfere` (interfering like a wave).

This analogy reveals a key insight: in multiple inheritance, the subclass does not "switch" between its two parent classes. It is not sometimes a `Particle` and sometimes a `Wave`. The subclass always possesses all the attributes and methods of both parent classes simultaneously. What determines which interface is invoked is not a change in the object itself, but the external caller, which in physics corresponds to the experimental apparatus. When we set up a double-slit experiment, we invoke the `interfere` method of the `Electron` object, and so we see interference fringes. When we set up a collision experiment, we invoke the `scatter` method, and so we see particle-like behavior. The object itself never changes; only the way we observe it changes.

In practical multiple inheritance, there is also the well-known "diamond problem": if two parent classes have methods with the same name but different behavior, which one should the subclass inherit? Python resolves this conflict through the Method Resolution Order (MRO). Similarly, in quantum mechanics, certain experiments, such as Feynman's famous "which-path" double-slit experiment, attempt to invoke both the particle interface (determining which slit the electron passed through) and the wave interface (observing interference fringes) simultaneously. Quantum mechanics' answer is: you cannot invoke both conflicting methods at once. The moment you try to determine which slit the electron passed through (invoking the particle interface), the interference pattern vanishes (the wave interface is disabled). This is the principle of complementarity expressed in the language of programming: certain methods from the two parent classes are mutually exclusive and cannot be used in the same call.

To summarize in programming terms: **wave-particle duality is not a contradiction but two interfaces of the same object.** "Wave" and "particle" reflect the limitations of human language (classical concepts). Objects in the microscopic world are inherently neither classical waves nor classical particles; they are a new kind of entity, a subclass that simultaneously inherits from two base classes, and we can only see different facets of this entity under different experimental conditions. We have no language that directly describes the full picture of an `Electron` object. We can only call its different methods (different experiments) to obtain different projections of it.

## Discussion Questions

1. Why is the wave nature of macroscopic objects unobservable? Is it solely because the wavelength is too short? (Hint: consider decoherence effects and the influence of the environment.)

2. When de Broglie proposed the matter-wave hypothesis in 1924, there was no experimental evidence for it yet. On what basis did he believe the idea was correct? What role does "symmetry" play in physical conjectures?

3. The electron is both a particle and a wave. How do these two descriptions coexist? Does wave-particle duality mean that the electron "is sometimes a particle, sometimes a wave," or that it "is neither a particle nor a wave"?
