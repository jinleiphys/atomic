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

# 1.1 Discovery of the Electron and Its Fundamental Properties

## Cathode Rays and the Discovery of the Electron

In the second half of the 19th century, physicists developed a keen interest in the phenomenon of vacuum discharge. When a high voltage was applied across the ends of a glass tube evacuated to low pressure, a type of ray was observed emanating from the cathode, causing the walls of the tube to fluoresce. In 1876, the German physicist Eugen Goldstein named this radiation "cathode rays." What was the true nature of cathode rays? This question became a hotly debated topic in the physics community, with the controversy lasting nearly twenty years and dividing physicists into two camps along national lines.

The German school, represented by Goldstein, Heinrich Hertz, and Philipp Lenard, believed that cathode rays were a type of electromagnetic wave similar to light, or an "ether wave." The evidence supporting this view appeared quite compelling. First, cathode rays could cause certain substances to fluoresce, an effect very similar to that of ultraviolet light. Second, cathode rays traveled in straight lines and were unaffected by gravity, characteristics typical of waves. The most important evidence came from Hertz's 1883 experiment: he attempted to deflect cathode rays using charged metal plates but observed no deflection whatsoever. Hertz concluded that if cathode rays were charged particles, they should be attracted or repelled by an electric field; since there was no deflection, they could not be charged particles, and therefore cathode rays were most likely some new type of electromagnetic wave. In 1892, Hertz also discovered that cathode rays could penetrate thin metal foils, which seemed to further support the wave theory, as it was difficult to imagine particles passing through solid metal.

The British school, represented by William Crookes and Thomson, firmly maintained that cathode rays were a stream of rapidly moving charged particles. As early as 1879, Crookes proposed that cathode rays were "radiant matter," that is, some kind of charged atoms or molecules. The evidence supporting the particle theory was equally persuasive. Cathode rays could be deflected by magnetic fields, whereas electromagnetic waves would not be affected by magnetic fields. Crookes placed a Maltese cross-shaped obstacle inside a vacuum tube and found that it cast a sharp shadow on the tube wall, indicating that cathode rays traveled in straight lines like particles and were blocked by solid objects. Even more intriguingly, Crookes discovered that cathode rays could set small paddle-wheel blades spinning inside the tube, demonstrating that they carried momentum, a characteristic of particles rather than waves.

In 1895, the French physicist Jean Perrin performed a crucial experiment that directly demonstrated that cathode rays carry negative charge {cite}`perrin1895`. Perrin placed a Faraday cup (a charge collector) inside a vacuum tube. When cathode rays entered the Faraday cup, the electrometer showed that negative charge accumulated inside. To confirm that the charge indeed came from the cathode rays and not from some other source, Perrin used a magnet to deflect the cathode rays so they no longer entered the Faraday cup, and the charge accumulation immediately ceased; when the magnetic field was removed, the accumulation resumed. This experiment irrefutably demonstrated that cathode rays carry negative charge. Nevertheless, the German school could still argue that perhaps the cathode rays produced some secondary effect upon striking the Faraday cup that caused the charge accumulation.

In 1897, Joseph John Thomson at the Cavendish Laboratory of Cambridge University resolved this debate through a series of elegant experiments {cite}`thomson1897`. Thomson realized the true reason for the failure of Hertz's 1883 experiment: it was not that cathode rays could not be deflected by an electric field, but that the vacuum was insufficiently good. When residual gas remained in the vacuum tube, the strong electric field would ionize the gas, and the resulting ions would neutralize the field, creating a shielding effect similar to a Faraday cage. Thomson improved the vacuum technology, achieving an unprecedented level of vacuum, and finally succeeded in observing the deflection of cathode rays by an electric field. This result decisively proved that cathode rays were charged particles, since electromagnetic waves cannot be deflected by electric fields.

```{figure} ../../ch01/thomson-apparatus.png
:name: fig-thomson-apparatus-en
:width: 80%
:align: center

Schematic diagram of J.J. Thomson's experimental apparatus for discovering the electron. Cathode rays emitted from the cathode are collimated through slits before entering the main vacuum tube. Electric deflection plates and magnetic field coils can apply deflecting forces to the electron beam separately or simultaneously. By measuring the deflection, the charge-to-mass ratio of the electron can be determined.
```

Thomson then performed an even more elegant experiment. He subjected the cathode rays simultaneously to mutually perpendicular electric and magnetic fields. By adjusting the strengths of the electric and magnetic fields, the forces exerted by each on the particles could be made to cancel, allowing the rays to pass through undeflected. Let the electric field strength be $E$, the magnetic field strength be $B$, and the particle velocity be $v$. The condition for the electric force $eE$ to balance the magnetic force $evB$ is $eE = evB$, from which the particle velocity can be obtained as $v = E/B$. Then, with the electric field removed and only the magnetic field retained, the particles undergo circular motion under the Lorentz force. According to Newton's second law, $evB = mv^2/r$, yielding the charge-to-mass ratio of the particles:

$$
\frac{e}{m} = \frac{v}{Br} = \frac{E}{B^2 r}
$$

Thomson's experimental results were astonishing. He found that the charge-to-mass ratio of cathode ray particles was approximately $1.76 \times 10^{11}$ C/kg, a value far greater than that of any known ion at the time. For hydrogen ions, for example, the charge-to-mass ratio is approximately $9.6 \times 10^7$ C/kg, nearly two thousand times smaller than that of cathode ray particles. More importantly, regardless of the cathode material used or the residual gas in the tube, the measured charge-to-mass ratio was always the same. This meant that cathode ray particles were a fundamental constituent universally present in all matter. Thomson named these particles "electrons," a term derived from the Greek word for "amber," since the ancients first discovered static electricity by rubbing amber.

Thomson's discovery was epoch-making. It proved for the first time that the atom was not indivisible but possessed internal structure. The fact that electrons were released from various different atoms indicated that electrons are a common component of all atoms. This discovery not only changed our understanding of the nature of matter but also ushered in a new era of exploring the internal structure of the atom.

## Precision Measurement of the Electron Charge

Thomson's experiment determined the charge-to-mass ratio $e/m$ of the electron, but to separately determine the electron's charge $e$ and mass $m$, an independent measurement of one of these quantities was still needed. This task was accomplished by Thomson's student Robert Millikan between 1909 and 1913, whose "oil drop experiment" became one of the most elegant experiments in the history of physics.

The basic idea of Millikan's experiment was to suspend a charged oil drop in an electric field. When the electric force on the oil drop exactly balanced gravity, the drop would hover motionless. Let the charge of the oil drop be $q$, its mass be $m_d$, and the electric field strength be $E$. The equilibrium condition is $qE = m_d g$. However, directly measuring the mass of a tiny oil drop is extremely difficult, and Millikan devised an ingenious method to solve this problem.

```{figure} ../../ch01/millikan-apparatus.png
:name: fig-millikan-apparatus-en
:width: 80%
:align: center

Schematic diagram of Millikan's oil drop experiment apparatus. An atomizer sprays oil into tiny droplets, which fall through a small hole in the center of the upper plate into the space between parallel plate capacitors. An adjustable high-voltage power supply creates a uniform electric field between the plates to balance the gravitational force on the oil drops. A light source illuminates the drops from the side, making them visible through a microscope like twinkling stars. An X-ray source ionizes the air, allowing the drops to acquire or change their charge, thus enabling multiple measurements on the same drop.
```

Millikan's method involved observing the oil drop falling at terminal velocity in the absence of an electric field. As the drop falls through air, it is subject to gravity and air resistance. The air resistance is given by Stokes' formula: $f = 6\pi\eta r v$, where $\eta$ is the viscosity of air, $r$ is the radius of the oil drop, and $v$ is the falling speed. This formula was derived by the British physicist George Gabriel Stokes in 1851 while studying the motion of pendulums {cite}`stokes1851`, and it describes the drag on a spherical object in a viscous fluid under low Reynolds number conditions. When the oil drop reaches terminal velocity, gravity equals the drag force plus buoyancy:

$$
\frac{4}{3}\pi r^3 \rho g = 6\pi\eta r v_1 + \frac{4}{3}\pi r^3 \rho_0 g
$$

where $\rho$ is the density of the oil, $\rho_0$ is the density of air, and $v_1$ is the terminal falling velocity without an electric field. From this, the radius $r$ of the oil drop can be determined, and hence its mass. Then an electric field is applied to make the drop rise at terminal velocity, the rising speed $v_2$ is measured, and from the force balance the charge $q$ of the drop can be determined.

The brilliance of Millikan's experiment lay not only in the clever design of the measurement method but also in the meticulous control of experimental details. He used clock oil instead of ordinary oil drops because clock oil does not evaporate easily, allowing the drop size to remain stable. He conducted the experiment in a sealed chamber to avoid disturbances from air convection. He used X-rays to change the charge on the oil drops, enabling multiple measurements of different charge values on the same drop.

However, the above analysis is built upon several idealized assumptions, and the real situation is considerably more complex. Stokes' formula assumes that the oil drop is a perfect sphere and that the fluid is an incompressible continuum. But the oil drops in Millikan's experiment had radii of approximately $10^{-6}$ m (1 micrometer), which is comparable to the mean free path of air molecules (approximately $6.8 \times 10^{-8}$ m). At this scale, air can no longer be treated as a continuum; the discrete nature of molecules begins to manifest, and Stokes' formula requires correction. Cunningham first derived this correction factor, and Millikan subsequently verified and precisely calibrated it through experiment. For oil drops with a radius of about 1 micrometer, the Cunningham correction factor is approximately 1.1; ignoring this correction would introduce an error of about 10% in the charge measurement. Furthermore, tiny oil drops are also subject to Brownian motion: random collisions by air molecules cause fluctuations in the drop's motion, introducing additional uncertainty in the velocity measurements. The title of Millikan's 1913 paper explicitly acknowledged this: "On the Elementary Electrical Charge and the Avogadro Constant" {cite}`millikan1913`. This experiment not only determined the electron charge but also calibrated the range of applicability and correction methods of Stokes' law in fluid mechanics, accomplishing two goals at once.

Millikan measured thousands of oil drops and discovered a remarkable pattern: the charge on every oil drop was an integer multiple of a certain minimum value. This minimum value is the magnitude of the electron charge. His result was $e = 1.592 \times 10^{-19}$ C, very close to the modern precise value of $e = 1.602 \times 10^{-19}$ C. This experiment not only precisely determined the electron charge but, more importantly, proved the quantization of charge: charge cannot take arbitrary values but only integer multiples of the elementary charge.

Combining Thomson's measured charge-to-mass ratio and Millikan's measured charge, the mass of the electron can be calculated:

$$
m_e = \frac{e}{e/m} = \frac{1.602 \times 10^{-19}}{1.76 \times 10^{11}} = 9.11 \times 10^{-31} \text{ kg}
$$

This mass is only about 1/1836 of the hydrogen atom mass, indicating that the electron is an extremely light particle. The vast majority of the atom's mass does not reside in the electron but is concentrated in another part of the atom. What is this other part, and how is the positive charge distributed? After discovering the electron, Thomson naturally had to confront these questions.

## Thomson's Atomic Model

The discovery of the electron raised a fundamental question: what is the structure of the atom? Before Thomson, atoms were considered to be indivisible basic units, which is indeed the origin of the name "atom" (from the Greek word for "indivisible"). Now we know that atoms contain negatively charged electrons, and since atoms as a whole are electrically neutral, there must be an equal amount of positive charge to neutralize the negative charge of the electrons. But how is the positive charge distributed within the atom? What is its relationship to the electrons?

In 1904, Thomson proposed his atomic model in an attempt to answer these questions. His reasoning exemplified the typical approach of physicists when confronting the unknown: start from known constraints and construct the simplest, self-consistent model.

The constraints Thomson faced were clear. First, the atom must be electrically neutral, with equal total amounts of positive and negative charge. Second, the atom must be stable; electrons cannot spontaneously fly apart. Third, the size of the atom is on the order of $10^{-10}$ m, as was already known from kinetic theory of gases and crystal structure studies. Fourth, the mass of the electron is only about 1/1836 of the atomic mass, so nearly all of the atom's mass comes from the positively charged part (at that time, the atomic nucleus and neutrons had not yet been discovered).

Based on these constraints, Thomson proposed that the atom is a sphere of uniformly distributed positive charge with electrons embedded in it, like raisins embedded in a pudding. This is the famous "plum pudding model." The positive charge is uniformly distributed throughout the entire atomic volume, providing a "background," while the electrons are scattered throughout like raisins. The electrons are attracted by the positive charge while simultaneously repelling each other, ultimately reaching some equilibrium distribution.

```{figure} ../../ch01/thomson-model.png
:name: fig-thomson-model-en
:width: 50%
:align: center

Schematic diagram of Thomson's atomic model (plum pudding model). Positive charge is uniformly distributed to form a sphere (positive charge cloud), with negatively charged electrons embedded within it. This model is also called the "plum pudding model" because the electrons are scattered throughout the positive charge "pudding" like raisins.
```

Although this model was simple, it was a reasonable conjecture at the time. It satisfied the requirement of electrical neutrality and could explain atomic stability: electrons were bound within the positively charged sphere and would not escape. Thomson even calculated the frequencies of electron oscillations within this positive charge background, attempting to explain the origin of atomic spectra. He found that if one assumed multiple electrons in the atom, their vibrational modes could be complex, and might perhaps explain the observed spectral lines.

However, the plum pudding model had a fatal flaw, though at the time no experiment could test it. The model predicted that if high-speed particles were fired at atoms, the particles should pass through almost unaffected, with at most very small deflections. Because the positive charge was uniformly distributed, there was no concentrated "hard core" to produce large-angle scattering. This prediction was disproved in 1909 by Rutherford and his students Geiger and Marsden using alpha particle scattering experiments: they observed completely unexpected large-angle scattering, and some alpha particles were even bounced back. This experimental result directly led to the birth of the nuclear model of the atom, while the plum pudding model was abandoned.

The failure of Thomson's model does not mean it was worthless. Quite the contrary, it represents the normal process of scientific progress: proposing reasonable hypotheses based on limited information, then testing them with experiments. Thomson's model was the first serious theoretical attempt to address the internal structure of the atom. It clearly posed the right question (how are the positive and negative charges distributed in an atom?), even if it gave the wrong answer. In the history of science, asking the right question is often just as important as finding the right answer.

## Avogadro's Number and the Debate over the Reality of Atoms

Avogadro's number $N_A$ is a crucial bridge connecting the macroscopic and microscopic worlds, defined as the number of basic units in one mole of any substance. However, behind this seemingly simple definition lies a tortuous history: for a considerable time, whether atoms and molecules truly existed was itself a fiercely debated question.

In 1811, the Italian physicist Amedeo Avogadro proposed a bold hypothesis: at the same temperature and pressure, equal volumes of any gas contain the same number of molecules. This hypothesis provided a theoretical foundation for chemical stoichiometry, but when Avogadro died in 1856, his hypothesis was still not widely accepted. The core issue was: do molecules truly exist, or are they merely a convenient mathematical tool for calculations?

At the end of the 19th century, the physics community engaged in a heated debate over whether atoms truly exist. The "energetics school," led by Ernst Mach and Wilhelm Ostwald, held that the essence of matter is energy, and that atoms and molecules are merely human constructs designed to simplify thermodynamic calculations but do not correspond to real physical entities. Mach bluntly asked: "Has anyone ever seen an atom?" Ostwald attempted to replace the atomic hypothesis with purely energetic relations. On the opposing side stood Ludwig Boltzmann, who firmly believed in the reality of atoms and used the methods of statistical mechanics to connect macroscopic thermodynamics with microscopic atomic motion. At the 1895 Lubeck scientific conference, Boltzmann engaged in a famous debate with Ostwald. Arnold Sommerfeld, who was present at the time, later recalled: "The debate between Boltzmann and Ostwald, in both appearance and substance, was like a battle between a bull and a nimble swordsman. But the bull vanquished the matador; Boltzmann's arguments prevailed." Nevertheless, the question of the reality of atoms remained unresolved.

Against the backdrop of this debate, determining Avogadro's number was not merely a technical problem but a fundamental question about whether atoms exist. If this constant could be precisely determined, and consistent results obtained by different methods, it would constitute powerful evidence for the real existence of atoms. In 1865, the Austrian physicist Josef Loschmidt made the first attempt to estimate the number of molecules {cite}`loschmidt1865`. Using kinetic theory of gases combined with experimental data on the mean free path of gas molecules, he estimated that there were approximately $1.83 \times 10^{18}$ molecules per cubic centimeter of gas at standard conditions. Although this value was an order of magnitude lower than the modern value, Loschmidt's work showed for the first time that Avogadro's number is an extremely large number and that molecules are extremely small.

The real breakthrough came in 1905 with Einstein's theory of Brownian motion {cite}`einstein1905brownian`. Brownian motion refers to the ceaseless random motion exhibited by tiny particles (such as pollen) suspended in a liquid, a phenomenon first observed by the botanist Brown in 1827 but which had never received a satisfactory explanation. Einstein pointed out that if a liquid is composed of a large number of constantly moving molecules, then suspended particles subjected to random molecular collisions would exhibit Brownian motion. He derived the relationship between the mean square displacement of Brownian particles and time:

$$
\langle x^2 \rangle = \frac{RT}{3\pi\eta a N_A} t
$$

where $R$ is the gas constant, $T$ is the temperature, $\eta$ is the viscosity of the liquid, and $a$ is the particle radius. The key aspect of this formula is that it connects an observable macroscopic quantity (the displacement of particles) to a microscopic constant (Avogadro's number). If atoms did not exist, Brownian motion should not obey this law.

The French physicist Perrin (whom we already mentioned for his 1895 proof that cathode rays carry negative charge) conducted a series of precision experiments between 1908 and 1913 that verified Einstein's theory. He used an ultramicroscope to observe latex particles suspended in water, measured their displacements, and determined Avogadro's number through statistical analysis. More importantly, Perrin determined Avogadro's number using several different methods, including translational Brownian motion, rotational Brownian motion, and sedimentation equilibrium, and all methods yielded highly consistent results. This consistency provided powerful evidence for the real existence of atoms and molecules. Perrin summarized in his 1913 work "Atoms": "The atomic hypothesis has thus triumphed." {cite}`perrin1913atoms` Faced with the evidence from Perrin's experiments, even the most stubborn skeptic Ostwald acknowledged the existence of atoms in 1908. Perrin was awarded the 1926 Nobel Prize in Physics "for his work on the discontinuous structure of matter."

In addition to Brownian motion, there are other methods for determining Avogadro's number. Faraday's laws of electrolysis provide one route: the amount of electric charge required to deposit or release one mole of any monovalent substance during electrolysis is a constant known as the Faraday constant $F = 96485$ C/mol. This constant equals the total charge carried by one mole of electrons, that is, $F = N_A e$. If the electron charge $e$ is known, Avogadro's number can be calculated:

$$
N_A = \frac{F}{e} = \frac{96485}{1.602 \times 10^{-19}} = 6.02 \times 10^{23} \text{ mol}^{-1}
$$

The most precise modern method involves measuring the lattice constant of a crystal through X-ray crystal diffraction and combining this with the crystal's density and molar mass. This method offers extremely high precision and forms the basis for defining Avogadro's number in the current International System of Units.

Knowing Avogadro's number, we can estimate the size of atoms. Taking solid metals as an example and assuming close-packed atoms, the volume of an atom is approximately equal to the molar volume divided by Avogadro's number. For typical metals, the atomic diameter is approximately $10^{-10}$ m, or 1 angstrom. This length scale is the characteristic scale of atomic physics and also the typical length of chemical bonds.

## Silicon Perspective: From Measurement to Inversion

From the perspective of computer science, Thomson's and Millikan's experiments demonstrate a classic "measurement-inversion" paradigm. In Thomson's experiment, the inputs are the known electric and magnetic field strengths, the output is the deflection trajectory of the particle, and the goal is to infer the charge-to-mass ratio of the particle. In Millikan's experiment, the inputs are the electric field strength and the state of motion of the oil drop, the output is the velocity of the drop, and the goal is to infer the charge of the drop.

This paradigm is ubiquitous in modern science and engineering. In medical imaging, CT scans measure the absorption of X-rays in different directions to reconstruct the internal density distribution of the human body. In geophysical exploration, the travel times of seismic waves are measured to reconstruct subsurface structures. In machine learning, input-output data are observed to infer model parameters.

The ingenuity of Thomson's experiment lies in his design of a condition where electric and magnetic forces balance, transforming a problem requiring the measurement of two unknowns ($e$ and $m$) into one requiring only the measurement of a single combination ($e/m$). This strategy of simplifying problems is very common in scientific research.

The ingenuity of Millikan's experiment lies in using the terminal velocity condition of the oil drop to indirectly measure a quantity that is difficult to measure directly (the mass of the oil drop). This method of "using easily measurable quantities to indirectly measure difficult-to-measure quantities" is one of the core skills of experimental physics.

Let us use Bayesian inference to analyze Millikan's oil drop experiment data. The core problem Millikan faced can be stated precisely: given a set of noisy charge measurements $\{q_i\}$, how do we infer the value of the elementary charge $e$? The Bayesian framework provides an elegant solution to this problem.

Our physical model is $q_i = n_i \cdot e + \epsilon_i$, where $n_i$ is an unknown positive integer (the number of electrons on the drop) and $\epsilon_i$ is measurement noise. The key insight of the Bayesian approach is that for each candidate value of $e$, we do not need to know how many electrons each drop carries; instead, we sum (marginalize) over all possible values of $n_i$. The likelihood for a single drop is

$$
P(q_i \mid e) = \sum_{n=1}^{n_{\max}} P(q_i \mid n, e) \, P(n) = \sum_{n=1}^{n_{\max}} \frac{1}{\sqrt{2\pi}\sigma} \exp\!\left(-\frac{(q_i - ne)^2}{2\sigma^2}\right) P(n)
$$

where $\sigma$ is the standard deviation of the measurement error. Assuming independent drops, the total likelihood is the product of individual likelihoods, and the posterior is proportional to the likelihood times the prior: $P(e \mid \{q_i\}) \propto P(e) \prod_i P(q_i \mid e)$.

```{code-cell} ipython3
:tags: [hide-input]

import numpy as np
import matplotlib.pyplot as plt
from scipy.signal import find_peaks

plt.rcParams['font.sans-serif'] = ['DejaVu Sans']
plt.rcParams['axes.unicode_minus'] = False

# === Simulate experimental data ===
e_true = 1.602e-19  # True elementary charge (C)
np.random.seed(42)
n_droplets = 50
n_electrons = np.random.randint(1, 11, n_droplets)
sigma_rel = 0.02  # 2% relative measurement error
charges = n_electrons * e_true * (1 + sigma_rel * np.random.randn(n_droplets))
sigma = sigma_rel * np.mean(charges)  # Absolute measurement error

# === Bayesian analysis ===
e_grid = np.linspace(0.5e-19, 3.2e-19, 5000)
n_max = 15

# Compute log-posterior (marginal likelihood summed over n)
log_posterior = np.zeros_like(e_grid)
for q in charges:
    ns = np.arange(1, n_max + 1)
    # For each e value, compute the likelihood summed over all possible n
    residuals = q - np.outer(e_grid, ns)  # shape: (len(e_grid), n_max)
    log_liks = -0.5 * (residuals / sigma) ** 2
    # Log-sum-exp trick for numerical stability
    max_log_lik = np.max(log_liks, axis=1)
    log_marginal = max_log_lik + np.log(np.sum(np.exp(log_liks - max_log_lik[:, None]), axis=1))
    log_posterior += log_marginal

# Normalize posterior
log_posterior -= np.max(log_posterior)
posterior = np.exp(log_posterior)
posterior /= np.trapz(posterior, e_grid)

# Find posterior peak (MAP estimate)
i_map = np.argmax(posterior)
e_map = e_grid[i_map]

# Compute 95% credible interval
cumulative = np.cumsum(posterior) * (e_grid[1] - e_grid[0])
i_low = np.searchsorted(cumulative, 0.025)
i_high = np.searchsorted(cumulative, 0.975)

# === Visualization ===
fig, axes = plt.subplots(1, 3, figsize=(15, 4.5))

# Left panel: raw measurement data
axes[0].scatter(range(n_droplets), charges * 1e19, alpha=0.7, s=25)
for n in range(1, 11):
    axes[0].axhline(y=n * e_true * 1e19, color='r', linestyle='--', alpha=0.2, linewidth=0.8)
axes[0].set_xlabel('Drop number')
axes[0].set_ylabel('Charge ($10^{-19}$ C)')
axes[0].set_title('Measurement data')

# Middle panel: posterior distribution (full view)
axes[1].plot(e_grid * 1e19, posterior * 1e19, 'b-', linewidth=1.5)
axes[1].axvline(x=e_true * 1e19, color='r', linestyle='--', alpha=0.8, label=f'True value {e_true*1e19:.3f}')
axes[1].set_xlabel('$e$ ($10^{-19}$ C)')
axes[1].set_ylabel('Posterior density')
axes[1].set_title('$P(e \\mid \\mathrm{data})$ full view')
axes[1].legend(fontsize=9)

# Right panel: posterior distribution (zoomed on main peak)
mask = (e_grid >= 1.45e-19) & (e_grid <= 1.75e-19)
axes[2].plot(e_grid[mask] * 1e19, posterior[mask] * 1e19, 'b-', linewidth=1.5)
axes[2].axvline(x=e_true * 1e19, color='r', linestyle='--', alpha=0.8, label=f'True value {e_true*1e19:.3f}')
axes[2].axvline(x=e_map * 1e19, color='g', linestyle='-', alpha=0.8, label=f'MAP estimate {e_map*1e19:.3f}')
axes[2].axvspan(e_grid[i_low] * 1e19, e_grid[i_high] * 1e19, alpha=0.15, color='blue', label='95% credible interval')
axes[2].set_xlabel('$e$ ($10^{-19}$ C)')
axes[2].set_ylabel('Posterior density')
axes[2].set_title('$P(e \\mid \\mathrm{data})$ main peak')
axes[2].legend(fontsize=9)

plt.tight_layout()
plt.show()

print(f"MAP estimate:          e = {e_map:.4e} C")
print(f"95% credible interval: [{e_grid[i_low]:.4e}, {e_grid[i_high]:.4e}] C")
print(f"True value:            e = {e_true:.4e} C")
print(f"Relative error:        {abs(e_map - e_true) / e_true * 100:.2f}%")
```

The Bayesian analysis reveals an interesting phenomenon: the posterior distribution $P(e \mid \mathrm{data})$ exhibits a multi-modal structure. The dominant peak appears near the true value $e \approx 1.602 \times 10^{-19}$ C, while secondary peaks appear at fractional positions such as $e/2$, $e/3$, and so on. These secondary peaks correspond to alternative hypotheses of the form "perhaps the elementary charge is smaller, and each drop actually carries more electrons." However, as the amount of data increases, the main peak becomes increasingly sharp while the secondary peaks become negligible relative to the main peak. This is precisely the core reason Millikan repeatedly measured thousands of oil drops: more data allows Bayesian inference to point with ever-increasing certainty toward the true elementary charge. From an information-theoretic perspective, each new oil drop measurement provides information about $e$, causing the posterior distribution to narrow progressively.

## Section Summary

In this section, we reviewed the historical process of the discovery of the electron. Thomson discovered the electron through cathode ray experiments and determined its charge-to-mass ratio. Millikan precisely determined the electron charge through the oil drop experiment and proved the quantization of charge. Combining the results of these two experiments, we obtained the mass of the electron. The determination of Avogadro's number established a bridge between macroscopic and microscopic quantities.

The discovery of the electron proved that atoms have internal structure, but what exactly is this internal structure? Electrons carry negative charge and atoms as a whole are electrically neutral, so where is the positive charge? How are the positive charge and the electrons distributed? The answers to these questions had to wait for Rutherford's scattering experiments.

## Exercises

1. Why did Thomson need to use both electric and magnetic fields simultaneously? Could the charge-to-mass ratio of the electron be determined using only magnetic deflection? What other applications does this "crossed-field" method have in modern physics?

2. Millikan's experiment can only prove that charge is an integer multiple of some minimum value, but how can one be certain that this minimum value is the electron charge and not some smaller "fractional charge"? Has anyone in history searched for fractional charges? (Hint: quarks carry charges of $\pm 1/3 e$ or $\pm 2/3 e$; why didn't Millikan observe them?)

3. Boltzmann spent his entire life defending atomism, yet he took his own life on the eve of Perrin's experiments "proving" the existence of atoms. What does the "proof" of a scientific theory mean? What conditions are needed for a theory to be accepted?

## References

```{bibliography}
:filter: docname in docnames
```
