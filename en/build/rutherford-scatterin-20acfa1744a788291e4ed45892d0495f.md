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

# 1.2 The Nuclear Structure of the Atom

## Thomson's Atomic Model

After the discovery of the electron, physicists faced an urgent question: how are electrons distributed within the atom? The atom as a whole is electrically neutral and electrons carry negative charge, so there must also be positive charge within the atom. But what form does the positive charge take? How is it combined with the electrons?

Thomson, the discoverer of the electron, proposed the first concrete atomic model in 1904. He envisioned that the positive charge was uniformly distributed throughout the entire volume of the atom like a blob of "pudding," with electrons embedded in it like "raisins." The model was therefore figuratively called the "plum pudding model." In this model, electrons are held inside the atom by the electric field of the positive charge. When an electron is displaced from its equilibrium position, it experiences a restoring force directed toward that position and can oscillate about it. Thomson hoped to use these oscillations to explain the frequencies of atomic emission spectra.

Thomson's model made a definite experimental prediction: if charged particles were fired at atoms, because the positive charge is uniformly spread over the entire atomic volume, the electric field experienced by the incoming particle would be relatively weak and diffuse, so only small-angle deflections should occur. Specifically, if an incident particle passes through a single layer of atoms, the average deflection angle should not exceed about one degree. Even when passing through a very thick target (containing thousands of atomic layers), since the directions of successive scatterings are random, the cumulative effect would not be large. According to statistical laws, the average deflection after passing through $n$ atomic layers is proportional to $\sqrt{n}$, making the observation of large-angle scattering (say, greater than 90 degrees) virtually impossible.

## The Geiger-Marsden Experiment

In 1909, Hans Geiger and Ernest Marsden, working at the University of Manchester under Rutherford's guidance, carried out an experiment to test Thomson's model. They bombarded gold foil with alpha particles emitted by the radioactive element radium and used a fluorescent screen to detect the directions of the scattered alpha particles. Alpha particles are helium nuclei, carrying two units of positive charge, with a mass about 7300 times that of the electron. Choosing alpha particles as probes offered several advantages: their mass is much greater than that of the electron, so they are not easily deflected by electrons within the atom; their energy is relatively high (about 5 MeV), allowing them to penetrate fairly thick targets; and they carry positive charge, so they would experience Coulomb repulsion from the positive charge in the atom.

The principle of the experimental apparatus was straightforward: the alpha particle source was placed in a small box, and a collimated beam of alpha particles was emitted through a small aperture toward the gold foil target. The gold foil was very thin, only about 400 nanometers thick, corresponding to roughly 1000 layers of gold atoms. Fluorescent screens were placed around the gold foil, and when alpha particles struck the screen they produced flashes of light, which the researchers observed and counted at various angles using a microscope. This was grueling work: the observer had to sit in darkness for a long time to let the eyes adapt, then spend hours continuously counting flashes through the microscope.

The experimental results were mostly as expected: the vast majority of alpha particles underwent only small deflections and passed through the gold foil nearly in straight lines. But unexpectedly, a very small fraction of alpha particles were deflected through large angles. Approximately one in eight thousand alpha particles was deflected by more than 90 degrees, and some were bounced almost straight back. Rutherford later recalled: "It was quite the most incredible event that has ever happened to me in my life. It was almost as incredible as if you fired a 15-inch shell at a piece of tissue paper and it came back and hit you. It was impossible unless..."

Unless the positive charge inside the atom was not uniformly distributed but concentrated in an extremely small region. Only then could an incident alpha particle, upon close approach, encounter a powerful Coulomb repulsive force and be deflected through large angles or even bounced back. After more than two years of reflection and calculation, Rutherford formally proposed the nuclear model of the atom in 1911: all of the atom's positive charge and the vast majority of its mass are concentrated in an extremely small central region called the atomic nucleus, while electrons move in the vast space outside the nucleus. The radius of the nucleus is approximately $10^{-15}$ meters, while the radius of the entire atom is approximately $10^{-10}$ meters, a difference of about one hundred thousand times. If the atom were enlarged to the size of a football stadium, the nucleus would be roughly the size of a pea. The interior of the atom is almost entirely empty.

## Derivation of the Rutherford Scattering Formula

Rutherford did not merely propose a qualitative model; he also provided precise quantitative predictions. He assumed that the nucleus can be treated as a stationary point charge (a reasonable assumption since the nuclear mass is much greater than that of the alpha particle), and that the alpha particle follows a classical mechanical trajectory in the Coulomb field of the nucleus. Mathematically, this problem is completely analogous to the motion of a planet around the Sun, except that gravitational attraction is replaced by Coulomb repulsion.

Let us derive the Rutherford scattering formula in detail. Let the charge of the incident alpha particle be $Z_1 e$ (for an alpha particle, $Z_1 = 2$), the charge of the target nucleus be $Z_2 e$ (for a gold nucleus, $Z_2 = 79$), the initial kinetic energy of the alpha particle be $E$, and its initial velocity be $v_0$. When the alpha particle is very far from the nucleus, it travels along a straight line. The perpendicular distance from this line to the nucleus is called the impact parameter, denoted $b$.

In the Coulomb repulsive field, the trajectory of the particle is a hyperbola. The relationship between the scattering angle and the impact parameter can be obtained directly using conservation laws. Let $\theta$ be the scattering angle, i.e., the angle between the incident and outgoing directions. From conservation of angular momentum at infinity and at the distance of closest approach $r_{\min}$:

$$
L = m v_0 b = m v_{\max} r_{\min}
$$

From conservation of energy at infinity and at the distance of closest approach:

$$
\frac{1}{2}m v_0^2 = \frac{1}{2}m v_{\max}^2 + \frac{Z_1 Z_2 e^2}{4\pi\varepsilon_0 r_{\min}}
$$

For a head-on collision ($b = 0$), the alpha particle comes to rest at some closest distance $r_0$ and then retraces its path. At this point, all kinetic energy is converted to potential energy:

$$
E = \frac{1}{2}m v_0^2 = \frac{Z_1 Z_2 e^2}{4\pi\varepsilon_0 r_0}
$$

From this we obtain

$$
r_0 = \frac{Z_1 Z_2 e^2}{4\pi\varepsilon_0 E}
$$

This distance $r_0$ is called the "distance of closest approach" or "collision diameter," and it is the characteristic length scale of the Rutherford scattering problem.

Through detailed orbital mechanics calculations (the derivation is omitted here; interested readers may consult the Kepler problem in mechanics textbooks), the relationship between the scattering angle and the impact parameter can be obtained:

$$
b = \frac{r_0}{2} \cot\frac{\theta}{2}
$$

or equivalently

$$
\tan\frac{\theta}{2} = \frac{r_0}{2b}
$$

The physical meaning of this formula is clear: the smaller the impact parameter $b$, the closer the alpha particle passes to the nucleus, the stronger the Coulomb force it experiences, and the larger the scattering angle $\theta$. When $b \to 0$ (head-on collision), $\theta \to 180°$ (the particle retraces its path); when $b \to \infty$, $\theta \to 0$ (no deflection).

What is measured experimentally is not the scattering angle of a single particle but the statistical distribution of a large number of particles. Let the intensity of the incident beam (number of particles per unit time per unit area) be $I_0$. Particles with impact parameters between $b$ and $b + db$ are scattered into angles between $\theta$ and $\theta + d\theta$. Due to azimuthal symmetry, these particles strike the detector at a distance $R$ from the target nucleus and are distributed in an annular region.

The differential scattering cross section $d\sigma/d\Omega$ is defined as the effective area for scattering into a unit solid angle. After calculation, we obtain the Rutherford scattering formula:

$$
\frac{d\sigma}{d\Omega} = \left(\frac{Z_1 Z_2 e^2}{16\pi\varepsilon_0 E}\right)^2 \frac{1}{\sin^4(\theta/2)} = \left(\frac{r_0}{4}\right)^2 \frac{1}{\sin^4(\theta/2)}
$$

This formula has several important features. First, the scattering cross section is proportional to $\sin^{-4}(\theta/2)$, which means that small-angle scattering is far more probable than large-angle scattering. As $\theta \to 0$, $d\sigma/d\Omega \to \infty$, reflecting the fact that the Coulomb force is a long-range force: even very distant particles undergo slight deflections. As $\theta \to 180°$, $d\sigma/d\Omega$ reaches its minimum value but is not zero, corresponding to head-on collisions. Second, the cross section is inversely proportional to the square of the incident energy: higher-energy particles are harder to deflect. Third, the cross section is proportional to the square of the target nuclear charge, which can be used to determine the nuclear charge of unknown elements.

## Experimental Verification and Determination of the Atomic Number

Geiger and Marsden carried out a systematic experimental verification of the Rutherford formula. They measured the scattering angle distribution, the dependence on incident energy, and the dependence on target material, and all results agreed well with the predictions of the Rutherford formula.

The verification of the scattering angle distribution was the most critical. According to the Rutherford formula, the number of particles scattered to an angle $\theta$ should be proportional to $\sin^{-4}(\theta/2)$. Geiger and Marsden measured the number of scattered particles over the range from 15 degrees to 150 degrees and found that within this range, the particle count varied by more than four orders of magnitude, yet all data points fell precisely on the $\sin^{-4}(\theta/2)$ curve. This constituted a powerful verification of the Rutherford formula.

The dependence on incident energy was also verified. Using alpha particles of different energies (from different radioactive isotopes), the scattering cross section was indeed found to be inversely proportional to the square of the energy.

Even more interesting was the dependence on target material. The Rutherford formula predicts that the scattering cross section is proportional to the square of the nuclear charge $Z_2$. By comparing scattering results from different metal foils, the nuclear charge of various elements could be inferred. These experimental results were fully consistent with the atomic numbers later determined by Moseley through characteristic X-ray spectra, thereby proving that the atomic number is equal to the nuclear charge. This discovery was of great significance: it showed that the ordering of the periodic table is not by atomic weight (which was already known to have several exceptions) but by nuclear charge.

## Estimation of Nuclear Size

The Rutherford scattering formula is based on the assumption that "the nucleus can be treated as a point charge." If the alpha particle enters the interior of the nucleus, this assumption breaks down and the scattering behavior deviates from the Rutherford formula. Therefore, by observing at what energy the Rutherford formula fails, the size of the nucleus can be estimated.

Consider the case of a head-on collision. The alpha particle comes to rest at the closest distance $r_0 = Z_1 Z_2 e^2 / (4\pi\varepsilon_0 E)$. If this distance is greater than the nuclear radius $R$, the alpha particle always remains outside the nucleus and the Rutherford formula holds. If $r_0 < R$, the alpha particle enters the interior of the nucleus and the scattering behavior changes.

For 5 MeV alpha particles bombarding a gold nucleus ($Z_1 = 2$, $Z_2 = 79$), the closest approach distance in a head-on collision is approximately $4.5 \times 10^{-14}$ meters. Experiments show that the Rutherford formula still holds at this energy, indicating that the radius of the gold nucleus is less than this value. By using higher-energy alpha particles, this upper bound can be further tightened.

Modern experiments show that the nuclear radius can be approximately described by the empirical formula $R \approx r_0 A^{1/3}$, where $A$ is the mass number and $r_0 \approx 1.2 \times 10^{-15}$ meters. For a gold nucleus ($A = 197$), the radius is approximately $7 \times 10^{-15}$ meters. This scale is about five orders of magnitude smaller than the atomic radius (approximately $10^{-10}$ meters), confirming that the interior of the atom is indeed almost empty.

## Silicon Perspective: System Identification and Model Selection

From the perspective of systems engineering, Rutherford's work is a classic "System Identification" problem. The atom is a black-box system whose internal structure cannot be directly observed, but which can be inferred from input-output relationships.

The input signal is a beam of alpha particles with known energy and direction. This signal has the following characteristics: controllable energy, controllable direction, and controllable intensity. The output signal is the angular distribution of the scattered alpha particles, which can be precisely measured with detectors. The unknown system is the charge-mass distribution inside the atom, which we wish to deduce from the input-output relationship.

Different assumptions about the internal structure lead to different output predictions. Thomson's model (uniformly distributed positive charge) predicts only small-angle scattering, with the probability of large-angle scattering being extremely low. Rutherford's model (point-like nucleus) predicts a $\sin^{-4}(\theta/2)$ angular distribution, where large-angle scattering is rare but definitely occurs. The experimental results clearly supported Rutherford's model.

This is logically isomorphic to the "Model Selection" problem in modern machine learning. Given training data, we have multiple candidate models and need to select the one that best explains the data. The criteria typically include: goodness of fit (how well the model's predictions match the experimental data) and model complexity (Occam's razor favors simpler models). Rutherford's model not only fit the data better but was also simpler in a certain sense: assuming that the positive charge is concentrated at a point is easier to handle than assuming it is uniformly distributed.

Let us use a Monte Carlo simulation to visually demonstrate the characteristics of Rutherford scattering.

```{code-cell} ipython3
:tags: [hide-input]

import numpy as np
import matplotlib.pyplot as plt

# Physical constants (SI)
e = 1.602e-19       # C
epsilon_0 = 8.854e-12
Z1, Z2 = 2, 79      # Charge numbers of alpha particle and gold nucleus
E_MeV = 5.0         # Incident energy (MeV)
E = E_MeV * 1e6 * e  # Convert to Joules

# Distance of closest approach for head-on collision (collision diameter)
r0 = Z1 * Z2 * e**2 / (4 * np.pi * epsilon_0 * E)
print(f"Collision diameter r0 = {r0*1e15:.2f} fm")

# Relationship between impact parameter and scattering angle: b = (r0/2) * cot(theta/2)
# Inversely: theta = 2 * arctan(r0 / (2b))
def scattering_angle(b):
    """Given impact parameter b, return scattering angle theta (radians)"""
    return 2 * np.arctan(r0 / (2 * b + 1e-20))  # Add small value to avoid division by zero

# Monte Carlo simulation
N = 200000  # Number of particles
b_max = 100 * r0  # Maximum impact parameter

# Uniform sampling in a circular area: probability density of b is proportional to b
# Using inverse transform sampling: b = b_max * sqrt(u), where u ~ Uniform(0,1)
u = np.random.uniform(0, 1, N)
b = b_max * np.sqrt(u)

# Calculate scattering angles
theta = scattering_angle(b)
theta_deg = np.degrees(theta)

# Plotting
fig, axes = plt.subplots(2, 2, figsize=(12, 10))

# (1) Scattering angle distribution histogram
ax1 = axes[0, 0]
bins = np.linspace(0, 180, 91)
counts, bin_edges, _ = ax1.hist(theta_deg, bins=bins, density=True, alpha=0.7,
                                 edgecolor='black', label='Monte Carlo simulation')
ax1.set_xlabel('Scattering angle theta (degrees)')
ax1.set_ylabel('Probability density')
ax1.set_title('Scattering angle distribution')
ax1.set_yscale('log')
ax1.set_ylim(1e-6, 1)
ax1.legend()

# (2) Comparison with Rutherford formula
ax2 = axes[0, 1]
theta_theory = np.linspace(5, 175, 200)
theta_rad = np.radians(theta_theory)
# Differential cross section dsigma/dOmega proportional to 1/sin^4(theta/2)
dsigma = 1 / np.sin(theta_rad/2)**4
# Normalization
dsigma_norm = dsigma / np.trapz(dsigma * np.sin(theta_rad), theta_rad)

ax2.plot(theta_theory, dsigma_norm, 'r-', linewidth=2, label='Rutherford formula')
ax2.set_xlabel('Scattering angle theta (degrees)')
ax2.set_ylabel('dsigma/dOmega (normalized)')
ax2.set_title('Rutherford scattering cross section')
ax2.set_yscale('log')
ax2.legend()
ax2.grid(True, alpha=0.3)

# (3) Fraction of large-angle scattering
ax3 = axes[1, 0]
angles = [30, 60, 90, 120, 150]
fractions = [np.sum(theta_deg > a) / N for a in angles]

# Theoretical values: integrate sin^{-4}(theta/2) * sin(theta) dtheta from theta to pi
# Analytical result: fraction with scattering angle > theta_0 is proportional to cot^2(theta_0/2)
fractions_theory = [1 / np.tan(np.radians(a/2))**2 / (b_max/r0)**2 for a in angles]

x = range(len(angles))
width = 0.35
ax3.bar([i - width/2 for i in x], fractions, width, label='Simulation', alpha=0.7)
ax3.bar([i + width/2 for i in x], fractions_theory, width, label='Theory', alpha=0.7)
ax3.set_xticks(x)
ax3.set_xticklabels([f'>{a}deg' for a in angles])
ax3.set_ylabel('Fraction')
ax3.set_title('Fraction of large-angle scattering')
ax3.legend()
ax3.set_yscale('log')

# (4) Particle trajectory visualization
ax4 = axes[1, 1]

# Plot several representative trajectories
impact_params = [0.5*r0, 1*r0, 2*r0, 5*r0, 10*r0]
colors = plt.cm.viridis(np.linspace(0, 0.8, len(impact_params)))

for b_val, color in zip(impact_params, colors):
    # Hyperbolic trajectory parameters
    theta_scatter = scattering_angle(b_val)

    # Geometric parameters of the hyperbola
    # For Coulomb scattering: r = a(epsilon^2 - 1) / (1 + epsilon cos phi)
    # where a = r0/2, epsilon = 1/sin(theta/2)
    a = r0 / 2
    epsilon = 1 / np.sin(theta_scatter / 2)

    # Parameterized angle phi
    phi_max = np.pi - theta_scatter/2
    phi = np.linspace(-phi_max + 0.1, phi_max - 0.1, 500)

    r = a * (epsilon**2 - 1) / (1 + epsilon * np.cos(phi))

    # Convert to Cartesian coordinates (rotated so incident direction is along x-axis)
    x_traj = r * np.cos(phi)
    y_traj = r * np.sin(phi)

    ax4.plot(x_traj / r0, y_traj / r0, color=color,
             label=f'b = {b_val/r0:.1f}r0, theta = {np.degrees(theta_scatter):.1f} deg')

# Mark the nucleus position
ax4.plot(0, 0, 'ko', markersize=10, label='Nucleus')
ax4.set_xlabel('x / r0')
ax4.set_ylabel('y / r0')
ax4.set_title('Alpha particle trajectories (Coulomb scattering)')
ax4.set_xlim(-20, 20)
ax4.set_ylim(-15, 15)
ax4.set_aspect('equal')
ax4.legend(fontsize=8)
ax4.grid(True, alpha=0.3)

plt.tight_layout()
plt.show()

# Print some statistics
print(f"\nMonte Carlo simulation statistics (N = {N} particles):")
print(f"Fraction with scattering angle > 90 deg: {np.sum(theta_deg > 90) / N:.2e}")
print(f"Fraction with scattering angle > 150 deg: {np.sum(theta_deg > 150) / N:.2e}")
print(f"\nTheoretical expectation (for b_max = {b_max/r0:.0f}r0):")
print(f"Fraction with scattering angle > 90 deg: {1 / (b_max/r0)**2:.2e}")
```

This code demonstrates several key features of Rutherford scattering. The upper-left panel shows a histogram of the scattering angle distribution, where we can see that the vast majority of particles undergo only small-angle deflections, while large-angle scattering is very rare. The upper-right panel shows the differential cross section predicted by the Rutherford formula, exhibiting the characteristic $\sin^{-4}(\theta/2)$ dependence. The lower-left panel compares the fraction of large-angle scattering at different angle thresholds, with simulation results matching theory well. The lower-right panel visualizes particle trajectories for different impact parameters, providing an intuitive picture of how the impact parameter affects the scattering angle.

## Comparison of Thomson and Rutherford Model Simulations

To more clearly see the difference between the two models, let us simulate what the scattering results would look like if the Thomson model were correct.

```{code-cell} ipython3
:tags: [hide-input]

import numpy as np
import matplotlib.pyplot as plt

def thomson_model_scattering(N, R_atom, Z, E, m_alpha):
    """
    Simulate scattering in Thomson's model (uniformly charged positive sphere)

    Inside a uniformly charged sphere, the electric field E(r) = (Ze/4*pi*epsilon_0) * (r/R^3)
    Particles passing through the sphere experience a weak average deflecting force
    """
    e = 1.602e-19
    epsilon_0 = 8.854e-12

    # Uniform sampling of impact parameter
    b_max = R_atom
    u = np.random.uniform(0, 1, N)
    b = b_max * np.sqrt(u)

    # For a particle passing through a uniformly charged sphere, the deflection angle is approximately
    # theta ~ (Ze^2 / 4*pi*epsilon_0) * (1/E) * (2/R) * (1 - b^2/R^2)^(1/2)
    # Here we use a simplified estimate
    v0 = np.sqrt(2 * E / m_alpha)

    # Chord length through the sphere
    chord = 2 * np.sqrt(R_atom**2 - b**2 + 1e-30)

    # Average force (approximate)
    r_avg = np.sqrt(b**2 + (chord/4)**2)
    F_avg = Z * e**2 / (4 * np.pi * epsilon_0 * R_atom**3) * r_avg

    # Deflection angle estimate (small angle approximation)
    delta_p = F_avg * chord / v0
    theta = delta_p / (m_alpha * v0)

    # Limit maximum angle
    theta = np.clip(theta, 0, np.pi)

    return np.degrees(theta)

# Parameters
N = 100000
R_atom = 1e-10  # Atomic radius
Z = 79  # Gold
E_MeV = 5.0
E = E_MeV * 1e6 * 1.602e-19
m_alpha = 4 * 1.66e-27  # Alpha particle mass

# Compute Thomson model scattering
theta_thomson = thomson_model_scattering(N, R_atom, Z, E, m_alpha)

# Compare with Rutherford model
e = 1.602e-19
epsilon_0 = 8.854e-12
r0 = 2 * Z * e**2 / (4 * np.pi * epsilon_0 * E)
b_max_rutherford = 100 * r0
u = np.random.uniform(0, 1, N)
b_rutherford = b_max_rutherford * np.sqrt(u)
theta_rutherford = np.degrees(2 * np.arctan(r0 / (2 * b_rutherford + 1e-30)))

# Comparison plots
fig, axes = plt.subplots(1, 2, figsize=(12, 5))

# Linear scale
ax1 = axes[0]
bins = np.linspace(0, 20, 41)
ax1.hist(theta_thomson, bins=bins, density=True, alpha=0.7,
         label='Thomson model', edgecolor='black')
ax1.hist(theta_rutherford[theta_rutherford < 20], bins=bins, density=True, alpha=0.7,
         label='Rutherford model', edgecolor='black')
ax1.set_xlabel('Scattering angle theta (degrees)')
ax1.set_ylabel('Probability density')
ax1.set_title('Small-angle region comparison')
ax1.legend()

# Log scale for large angles
ax2 = axes[1]
bins = np.linspace(0, 180, 37)
ax2.hist(theta_thomson, bins=bins, density=True, alpha=0.7,
         label='Thomson model', edgecolor='black')
ax2.hist(theta_rutherford, bins=bins, density=True, alpha=0.7,
         label='Rutherford model', edgecolor='black')
ax2.set_xlabel('Scattering angle theta (degrees)')
ax2.set_ylabel('Probability density')
ax2.set_title('Full angular range comparison (log scale)')
ax2.set_yscale('log')
ax2.set_ylim(1e-8, 1)
ax2.legend()

plt.tight_layout()
plt.show()

# Statistical comparison
print("Large-angle scattering fraction comparison:")
print(f"Thomson model: fraction with theta > 10 deg = {np.sum(theta_thomson > 10) / N:.2e}")
print(f"Rutherford model: fraction with theta > 10 deg = {np.sum(theta_rutherford > 10) / N:.2e}")
print(f"\nThomson model: fraction with theta > 90 deg = {np.sum(theta_thomson > 90) / N:.2e}")
print(f"Rutherford model: fraction with theta > 90 deg = {np.sum(theta_rutherford > 90) / N:.2e}")
```

This comparison clearly demonstrates the essential difference between the two models. In Thomson's model, because the positive charge is uniformly distributed throughout the entire atomic volume, a particle passing through the atom experiences only a weak average force and therefore undergoes only small deflections; large-angle scattering is virtually impossible. In Rutherford's model, because the positive charge is concentrated in a point-like nucleus, particles approaching the nucleus closely experience extremely strong Coulomb forces and can be scattered through large angles, even up to 180 degrees. The large-angle scattering events observed by Geiger and Marsden were the key evidence supporting the Rutherford model and rejecting the Thomson model.

## Section Summary

In this section, we discussed in detail Rutherford's exploration of atomic structure. Thomson's "plum pudding" model assumed that the positive charge was uniformly distributed throughout the atom, but this model could not explain the large-angle alpha particle scattering observed by Geiger and Marsden. Rutherford proposed the nuclear model of the atom: the positive charge and the vast majority of the mass are concentrated in a tiny nucleus, with electrons moving outside the nucleus.

Rutherford not only proposed a qualitative model but also derived a precise scattering formula. This formula predicts that the scattering cross section is proportional to $\sin^{-4}(\theta/2)$, in perfect agreement with experimental results. By analyzing the range of validity of the Rutherford formula, the size of the nucleus can also be estimated.

From a methodological perspective, Rutherford's work demonstrates how carefully designed experiments can probe invisible microscopic structures. Injecting a known probe signal, analyzing the output response, and then using a physical model to explain the input-output relationship is the fundamental research paradigm of atomic physics and indeed of all microscopic physics.

## Exercises

1. The Rutherford scattering formula is derived from classical mechanics. What happens when the alpha particle energy is high enough to "touch" the surface of the nucleus? How does this help us measure the size of the nucleus?

2. Why did Rutherford use alpha particles rather than electrons to probe atomic structure? What would be different if electrons were used? (Hint: consider the mass ratio and the relationship to scattering angles.)

3. Thomson's "plum pudding" model predicted that the probability of large-angle scattering should be extremely small, yet Rutherford's experiment observed it. What does this "surprise" tell us about scientific methodology? Are unexpected experimental results often more valuable?

4. Rutherford's model explained large-angle scattering, but it also has a fatal flaw (electrons orbiting the nucleus would radiate energy and collapse). Why did physicists nevertheless accept this "flawed" model?
