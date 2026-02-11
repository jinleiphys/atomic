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

# 3.2 The Uncertainty Relation

## Heisenberg's Microscope

In 1927, the twenty-five-year-old Werner Heisenberg, working in Gottingen, completed a paper that would fundamentally reshape the landscape of physics. In it he devised an extraordinarily ingenious thought experiment that came to be known as "Heisenberg's microscope." The central question of this thought experiment appears deceptively simple: can we, with a sufficiently precise instrument, simultaneously measure the position and the momentum of an electron?

Suppose we possess an ideal gamma-ray microscope and wish to determine the position of an electron with the highest possible accuracy. According to optical diffraction theory, the spatial resolution of any microscope is limited by the wavelength of the light it uses, with a resolution limit of roughly $\Delta x \sim \lambda$. Therefore, to pin down the electron's position more and more precisely, we must use light of shorter and shorter wavelength, ultimately resorting to gamma rays, the most energetic form of electromagnetic radiation. However, the subtlety of the problem emerges precisely at this point. According to Einstein's photon hypothesis and the de Broglie relation, every photon carries a momentum inversely proportional to its wavelength, $p_\gamma = h/\lambda$. The shorter the wavelength, the greater the photon's momentum. When such a high-momentum photon collides with the electron, an event that is essentially a Compton scattering process, the photon transfers an uncertain fraction of its momentum to the electron. We can collect the scattered photon to reconstruct an image of the electron, but the collision has already irreversibly altered the electron's state of motion.

What makes the situation truly inescapable is that the magnitude of this momentum transfer is not something we can predict precisely. The scattered photon may enter the microscope's objective lens at any angle within the cone of acceptance, and the finite aperture of the lens means we cannot determine the exact direction in which the photon left the collision point. If the half-angle of the objective is $\alpha$, then the transverse momentum component of the scattered photon can range from $-p_\gamma \sin\alpha$ to $+p_\gamma \sin\alpha$, introducing an uncertainty in the electron's momentum of approximately $\Delta p \sim (2h \sin\alpha)/\lambda$. At the same time, diffraction theory tells us that the position resolution achievable through this microscope is roughly $\Delta x \sim \lambda/(2\sin\alpha)$. Multiplying these two expressions together, we obtain $\Delta x \cdot \Delta p \sim h$, a result that is independent of the aperture angle $\alpha$ and independent of the chosen wavelength. No matter how you adjust the experimental parameters, there exists an impassable trade-off between the precision of position and the precision of momentum.

If we think from the opposite direction: to measure the electron's momentum precisely, we should use long-wavelength photons, since they carry less momentum and therefore disturb the electron less. But then the microscope's spatial resolution degrades dramatically, and we lose the ability to determine the electron's position accurately. No clever experimental design can achieve both simultaneously. This is the essence of Heisenberg's uncertainty relation:

$$
\Delta x \cdot \Delta p \geq \frac{\hbar}{2}
$$

In this inequality, $\hbar = h/(2\pi)$ is the reduced Planck constant. The quantity $\hbar/2$ on the right-hand side is an extraordinarily small number (approximately $5.3 \times 10^{-35}$ J·s), entirely negligible for macroscopic objects, but at atomic scales it constitutes an insurmountable barrier.

The position-momentum uncertainty relation is not an isolated case. Similar uncertainty relations hold between all conjugate variable pairs, the most important of which is the energy-time pair:

$$
\Delta E \cdot \Delta t \geq \frac{\hbar}{2}
$$

The physical implications of the energy-time uncertainty relation are profound and subtle. It means that if a quantum state exists for only an extremely brief time $\Delta t$, then its energy cannot have a precise definition and must exhibit an energy spread of at least $\Delta E \sim \hbar/(2\Delta t)$. This is precisely the physical origin of the natural linewidth of spectral lines observed in atomic spectroscopy: the shorter the lifetime of an excited state, the more uncertain the energy (and hence frequency) of the photon it emits, and the broader the corresponding spectral line. At a deeper level, the energy-time uncertainty relation also provides the theoretical foundation for quantum vacuum fluctuations. Over extremely short time intervals, the vacuum can "borrow" a certain amount of energy to create virtual particle pairs, so long as these virtual particles annihilate within a time $\Delta t \sim \hbar/(2\Delta E)$, thereby avoiding any violation of energy conservation.

Heisenberg originally understood the uncertainty relation from the perspective of "measurement disturbance," as though our act of measurement unavoidably disturbs the system under observation, thereby causing the uncertainty in the conjugate quantity. This "disturbance" interpretation, while intuitively appealing, does not tell the whole story. Subsequent theoretical developments, particularly through mathematical analysis of the wave function, revealed a deeper origin for the uncertainty relation: it is not a byproduct of measurement but a manifestation of the intrinsic properties of microscopic particles themselves. In the framework of quantum mechanics, position and momentum are represented by two non-commuting operators that satisfy the commutation relation $[\hat{x}, \hat{p}] = i\hbar$. It is precisely this commutation relation that rigorously guarantees, from a mathematical standpoint, that no quantum state can simultaneously be an eigenstate of both position and momentum, meaning that no quantum state exists in which both position and momentum have completely definite values.

An electron is not "at a definite position with a definite momentum that we simply happen not to know." Rather, it inherently does not simultaneously possess a definite position and a definite momentum. This is not ignorance at the epistemological level (we lack information) but a fact at the ontological level (the information simply does not exist). This shift in understanding represents one of the most profound conceptual revolutions in the transition from classical to quantum physics.

## Silicon Perspective: Information Encoding Limits

The uncertainty relation in quantum mechanics may at first appear to be the exclusive province of physics, an exotic phenomenon unique to the microscopic world. But if you have a background in signal processing or information theory, you will discover a striking fact: the mathematical structure of the uncertainty relation has long existed in classical engineering, appearing under different names in the toolkits of electrical engineers, communications specialists, and audio engineers.

In signal processing, there is a theorem that is mathematically fully equivalent to the Heisenberg uncertainty relation. It is known as the time-frequency uncertainty principle, also called the Gabor limit (named after Dennis Gabor, who received the 1971 Nobel Prize in Physics for inventing holography):

$$
\Delta t \cdot \Delta \omega \geq \frac{1}{2}
$$

This inequality tells us that a signal cannot simultaneously have an extremely short duration in the time domain and an extremely narrow frequency bandwidth. If you want a signal pulse that is very precisely localized in time (say, an extremely brief "click"), then when you compute its Fourier transform you will find that its frequency components are spread across a very wide range. Conversely, if you want a signal with an extremely pure frequency (say, a perfect sinusoid), it must extend for an infinite duration in time. This is not because your recording equipment is inadequate or your filter design is flawed; it is a fundamental limit dictated by the mathematical properties of the Fourier transform itself.

To understand why this is so, let us return to the basic framework of Fourier analysis. Any time-domain signal $f(t)$ can be decomposed into a superposition of sinusoidal waves at different frequencies; this is precisely what the Fourier transform $\tilde{f}(\omega) = \int f(t) e^{-i\omega t} dt$ accomplishes. The time domain and the frequency domain are two equivalent descriptions of the same signal, linked to each other through the Fourier transform. The crucial point is that the Fourier transform is a global operation: to compute the strength of a particular frequency component, you must integrate the signal's behavior over the entire time axis. A signal that is strictly truncated in time will necessarily have a diffuse spectrum, because the truncation introduces high-frequency oscillations in the frequency domain (this is the Gibbs phenomenon familiar to engineers).

This time-frequency duality is precisely isomorphic to the position-momentum duality in quantum mechanics. In quantum mechanics, the wave function $\psi(x)$ describes the probability amplitude distribution of a particle in position space, while its Fourier transform $\tilde{\psi}(p) = (1/\sqrt{2\pi\hbar}) \int \psi(x) e^{-ipx/\hbar} dx$ describes the probability amplitude distribution of the same particle in momentum space. Position $x$ corresponds to time $t$, momentum $p$ corresponds to frequency $\omega$, and Planck's constant $\hbar$ plays the role of a conversion factor between the two domains. The correspondence between the uncertainty relation $\Delta x \cdot \Delta p \geq \hbar/2$ and the Gabor limit $\Delta t \cdot \Delta \omega \geq 1/2$ is exact: multiplying the latter by $\hbar$ yields the former.

Mathematically, the only signal (or wave function) that saturates the equality in the uncertainty relation is the Gaussian function. A Gaussian wave packet $\psi(x) \propto \exp(-x^2/4\sigma^2)$ is Gaussian in position space, and its Fourier transform is likewise Gaussian in momentum space, satisfying $\sigma_x \cdot \sigma_p = \hbar/2$. This is why Gaussian wave packets are called "minimum uncertainty states" or "coherent states": they distribute quantum uncertainty between position and momentum in the most economical way possible, neither more nor less, exactly saturating the uncertainty relation. In signal processing, the Gaussian pulse is likewise the optimal signal shape that achieves the Gabor limit, which is why Gabor chose the Gaussian window function as the fundamental unit of time-frequency analysis in his pioneering 1946 paper.

This cross-disciplinary mathematical commonality reveals a profound insight: the uncertainty relation is not a "quirk" of quantum mechanics but an inevitable feature of any theory based on a wave description. Whenever a physical quantity and its conjugate are related through a Fourier transform, the uncertainty relation automatically holds. What is unique about quantum mechanics is not the mathematical form of the uncertainty relation but the physical reality it ascribes to it: in classical signal processing, the time-frequency uncertainty is a limitation on signal representation; in quantum mechanics, the position-momentum uncertainty is a limitation on physical reality itself.

Pushing this idea to its logical conclusion, we can imagine the entire phase space of the universe (the position-momentum space) as a screen with finite resolution. Each point in phase space represents a classical state (a definite position together with a definite momentum), but the uncertainty relation tells us that nature does not allow any physical state to be compressed into a region of phase space with area smaller than $\hbar/2$. This is analogous to the way a digital screen's pixel size sets the limit on the finest detail it can display. You cannot make a single pixel simultaneously represent a horizontal and a vertical coordinate with sub-pixel precision, because a pixel is the smallest unit of information. Similarly, in quantum phase space, $\hbar/2$ is the area of the "quantum pixel," and every quantum state must occupy at least this much phase space. This is not a bug in the universe's simulator; it is its most fundamental specification.

This analogy also helps us understand why classical physics is so successful at macroscopic scales. For a macroscopic object with a mass of 1 kilogram moving at 1 meter per second, the phase space area it occupies is enormously larger than $\hbar/2$, so the granularity of the quantum pixels is entirely imperceptible and the continuous, deterministic classical description serves as an excellent approximation. But when we enter the atomic scale, where the action (the product of position and momentum in order of magnitude) of a particle becomes comparable to $\hbar$, the "pixelation" of phase space can no longer be ignored, the classical picture breaks down completely, and the probabilistic description of quantum mechanics becomes indispensable.

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

## Discussion Questions

1. Does the uncertainty relation mean "the electron has a definite position and momentum, but we simply cannot know both at the same time"? Discuss the difference between the "epistemological" interpretation and the "ontological" interpretation.

2. Heisenberg originally used the "microscope thought experiment" to explain the uncertainty relation, suggesting that uncertainty arises from measurement disturbance. What is the problem with this interpretation? How does modern quantum mechanics understand the origin of the uncertainty relation?

3. What is the essential difference between the energy-time uncertainty relation $\Delta E \cdot \Delta t \gtrsim \hbar$ and the position-momentum uncertainty relation? Is "time" an operator or a parameter in quantum mechanics?

4. Is the uncertainty relation a "defect" or a "feature" of quantum mechanics? If there were no uncertainty relation, could atoms still exist stably?
