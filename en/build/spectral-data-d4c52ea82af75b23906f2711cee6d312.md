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

# 2.3 Spectral Data and Empirical Formulas

## Decoding the Atom's Status Codes

When light from a hydrogen discharge tube is passed through a prism, you do not see a rainbow-like continuous spectrum, but rather a few discrete, sharp bright lines scattered at specific wavelength positions. This fact had been known since the early nineteenth century, but its deeper significance was far from obvious. Sunlight or incandescent lamp light, when passed through a prism, fans out into a continuous band of color, transitioning smoothly from red to violet with light present at every wavelength. Yet when you connect a glass tube filled with dilute hydrogen gas to a high-voltage power supply, let the current excite the gas into luminescence, and then pass that light through a prism, only a handful of isolated colored lines appear against a dark background. The positions of these lines are extraordinarily precise and stable: whether you perform the experiment in Berlin or in Paris, whether you use one batch of hydrogen or another, the spectral wavelengths come out exactly the same.

Every element has its own unique combination of spectral lines, forming the atom's "fingerprint." In the 1860s, Kirchhoff and Bunsen used spectral analysis to discover two new elements, cesium and rubidium, inaugurating the golden age of spectroscopy. Over the following decades, spectroscopists used increasingly precise instruments to measure the spectral wavelengths of numerous elements, accumulating vast tables of data. Ångström published the precise wavelengths of thousands of lines in the solar spectrum in 1868, achieving accuracy to six decimal places. But confronted with this ocean of data, physicists were baffled: the numbers appeared to follow no pattern whatsoever, just strings of seemingly "random" wavelength values. Spectroscopy possessed an abundance of precise experimental data yet lacked any theoretical framework to explain them. As one historian described it, spectroscopy at the time was a discipline of "astronomical precision and botanical descriptiveness" -- capable of exacting measurement but unable to yield understanding.

This situation changed dramatically in 1885. A mathematics teacher in Basel, Switzerland, named Johann Jakob Balmer (1825--1898), cracked the code of the hydrogen atom's spectrum at the age of sixty. Balmer was not a physicist; his day job was teaching mathematics at a girls' school in Basel, and in his spare time he studied number theory and geometry. He possessed a near-obsessive intuition for harmonious relationships among numbers, having spent considerable time studying architectural proportions and numerical patterns. It is said that his colleague Eduard Hagenbach, a physics professor at the University of Basel, mentioned the hydrogen spectral data to him and asked whether he could find any mathematical regularity in them. Balmer took up the challenge.

The data before Balmer consisted of the four principal spectral lines of hydrogen in the visible region: $H_\alpha$ at a wavelength of 656.3 nm, a vivid red line; $H_\beta$ at 486.1 nm, blue-green in color; $H_\gamma$ at 434.0 nm, blue-violet; and $H_\delta$ at 410.2 nm, near the violet edge of the visible spectrum. These four numbers -- 656.3, 486.1, 434.0, 410.2 -- what relationship could possibly connect them?

Balmer's method was essentially a number game. He manipulated these numbers repeatedly, computing their ratios, differences, squares, and reciprocals, searching for hidden patterns. After extensive trial and error, he discovered that the ratios of these wavelengths to a base value could be written as simple fractions: $656.3 / 364.56 = 9/5$, $486.1 / 364.56 = 4/3$, $434.0 / 364.56 = 25/21$, $410.2 / 364.56 = 9/8$. The numerators and denominators of these fractions could be further decomposed: $9/5 = 3^2/(3^2 - 4)$, $4/3 = 4^2/(4^2 - 4)$, $25/21 = 5^2/(5^2 - 4)$, $9/8 = 6^2/(6^2 - 4)$. The pattern leapt into view. Balmer wrote down his formula:

$$
\lambda = B \frac{n^2}{n^2 - 4}, \quad n = 3, 4, 5, 6, \ldots
$$

where $B = 364.56$ nm. This formula, with a single constant and a single integer, accurately reproduced the wavelengths of all four known spectral lines. Moreover, Balmer boldly used it for prediction: when $n = 7$, the formula gives a wavelength of 397.0 nm. Subsequent measurements confirmed this prediction exactly. In his 1885 paper "Notiz über die Spectrallinien des Wasserstoffs" ("A Note on the Spectral Lines of Hydrogen"), Balmer even predicted that as $n \to \infty$, the spectral lines should converge to a limiting wavelength $B = 364.56$ nm, the series limit of the Balmer series. All of this was later confirmed by experiment, one prediction at a time.

Balmer's formula caused a tremendous stir in the physics community. On one hand, its success was beyond dispute -- that so concise an expression could reproduce experimental data with such high precision was astonishing in itself. On the other hand, physicists were deeply uneasy, because no one knew why this formula was correct. Where did the number 4 in the formula come from? What did the integer $n$ represent? What was the physical meaning of the constant $B$? Balmer himself could not answer these questions. His formula was purely empirical -- "cobbled together" from the data with no physical picture to support it. But it is precisely this kind of "precise regularity without theoretical explanation" that most torments the physicist's mind. It was like an encrypted letter: you could read every character but could not understand what it was saying. Everyone believed that some profound physical mechanism must lie behind this formula, but at the time, no one could reveal it.

The appearance of Balmer's formula triggered a systematic search for spectral regularities. In 1888, the Swedish physicist Johannes Robert Rydberg (1854--1919) generalized Balmer's formula into a far more universal form. Rydberg's generalization was not a lucky guess but rested on three clear lines of evidence. The first clue came from rewriting Balmer's formula itself. Transforming it into wavenumber form gives $1/\lambda = (4/B)(1/4 - 1/n^2)$, and Rydberg keenly noticed that the 4 in the denominator is simply $2^2$, so the formula becomes $1/\lambda = R_H(1/2^2 - 1/n^2)$. The number 2 did not look like a "fundamental" constant; it looked more like a special value of some more general parameter. The second clue came from comparative studies of alkali metal spectra. Rydberg systematically investigated the spectra of lithium, sodium, potassium, and many other alkali metals, finding that although they were far more complex than hydrogen, they all exhibited a common mathematical structure: the wavenumber of every spectral line could be expressed as the difference of two "terms," $\tilde{\nu} = T(n_1) - T(n_2)$. This "difference of two terms" structure appeared repeatedly across different elements, strongly suggesting that it was not a coincidence but a universal feature of atomic structure. For hydrogen, the simplest atom, the term function took its most concise form $T(n) = R_H/n^2$, and the Balmer series corresponded to $T(2) - T(n)$. A natural question then arose: what about $T(1) - T(n)$ or $T(3) - T(n)$ -- might they correspond to as-yet-undiscovered spectral series? The third clue came from the combination principle proposed by Walther Ritz in 1908: if two known spectral lines have wavenumbers $T(a)-T(b)$ and $T(b)-T(c)$, then their sum $T(a)-T(c)$ should also correspond to an actual spectral line. This prediction was repeatedly verified by experiment, further confirming the physical reality of the "term" structure. Building on these clues, Rydberg generalized Balmer's formula into the wavenumber form:

$$
\frac{1}{\lambda} = R_\infty \left(\frac{1}{n_1^2} - \frac{1}{n_2^2}\right), \quad n_2 > n_1
$$

where $R_\infty = 1.097 \times 10^7 \text{ m}^{-1}$ is the Rydberg constant. When $n_1 = 2$, this reduces to Balmer's formula. But the power of the Rydberg formula extends far beyond that: $n_1 = 1$ gives the Lyman series, whose lines lie in the ultraviolet and were not experimentally discovered until 1906 by Theodore Lyman; $n_1 = 3$ gives the Paschen series in the infrared, confirmed by Friedrich Paschen in 1908; $n_1 = 4$ gives the Brackett series; $n_1 = 5$ gives the Pfund series. These spectral series were discovered one by one in the decades following Rydberg's publication, each discovery a precise verification of the Rydberg formula's prediction.

The profound significance of the Rydberg formula lies in the structure it reveals. Every spectral line of the hydrogen atom, whether it falls in the ultraviolet, visible, or infrared region, can be completely determined by a single constant $R_\infty$ and two positive integers $n_1$ and $n_2$. One constant unifies infinitely many spectral lines. This unification strongly implies that within the atom there exists some kind of discrete state labeled by integers, and that the emission of a spectral line corresponds to a transition from one state to another. The integer $n$ came to be called the quantum number, and the Rydberg formula became one of the most important clues leading to the birth of quantum mechanics. From 1885, when Balmer discovered his formula, to 1913, when Niels Bohr proposed his atomic model and derived the expression for the Rydberg constant from theory, a full 28 years elapsed. Throughout that long waiting period, the Rydberg formula remained an empirical formula of extraordinary precision but without theoretical explanation, standing like a lighthouse guiding physicists toward the correct theory of the atom.

## Silicon Perspective: Symbolic Regression

What Balmer did in 1885 is known in modern data science as **Symbolic Regression**: given a set of data points, search for an analytical expression that fits the data. Unlike conventional numerical regression (such as linear regression or polynomial regression), the goal of symbolic regression is not merely to fit data, but to discover the mathematical structure behind it -- a concise formula with physical meaning. This is exactly what Balmer accomplished, except that the "algorithm" he used was the intuition and patience of the human brain.

From an information-theoretic perspective, what the Rydberg formula achieves is a remarkable form of **data compression**. The hydrogen atom can emit infinitely many spectral lines, each requiring several significant digits to specify its wavelength. If we were to list these wavelengths one by one, we would need an infinitely long data table. But the Rydberg formula can precisely reconstruct the wavelength of any spectral line using a single constant $R_\infty$ and two integers ($n_1$, $n_2$). It is as if an infinitely large database has been compressed into a single line of code. This compression is not lossy approximation (lossy compression) -- the kind that JPEG uses to compress images by sacrificing some detail -- but lossless compression, where the original data can be perfectly recovered. In computer science, we know that lossless compression is possible only when the data contains intrinsic regularities. The very existence of the Rydberg formula therefore proves that deep physical laws are embedded within the spectral data.

At a deeper level, the Rydberg formula reveals a **combinatorial structure** in atomic spectra. The wavenumber (frequency) of each spectral line is not an independent value, but rather the difference of two "terms": $\tilde{\nu} = T(n_1) - T(n_2)$, where $T(n) = R_\infty / n^2$. This is the so-called Ritz combination principle. It means that instead of storing the wavelengths of all spectral lines (a two-dimensional array), you need only store a one-dimensional sequence of term values $T(1), T(2), T(3), \ldots$ and then reconstruct all spectral lines by taking pairwise differences. In computer science, this is analogous to representing an $N \times N$ matrix using an array of length $N$ -- when every element of the matrix equals some row value minus some column value, the storage complexity drops from $O(N^2)$ to $O(N)$. Atomic spectra happen to possess exactly this structure, and the Rydberg formula together with the Ritz combination principle are its precise formulation.

From the standpoint of modern symbolic regression practice, the problem Balmer faced was actually very small in scale: only four data points (four visible spectral lines), with a search space consisting of simple expressions built from basic arithmetic operations and integer powers. Today's symbolic regression algorithms (such as PySR, based on genetic programming, or AI Feynman, based on variational methods) can find the best-fitting formula among millions of candidates in a matter of seconds. Yet Balmer accomplished this without a computer, relying on his acute intuition for numerical proportions and tireless manual calculation. In this sense, Balmer was one of the earliest "symbolic regressors" in human history. His success reminds us that the essence of scientific discovery -- extracting concise laws from noisy data -- shares a profound kinship with data compression and pattern recognition.

The code example below demonstrates how, using the simplest linear regression method, one can "rediscover" the Rydberg constant from the experimental wavelength data of the hydrogen Balmer series.

```{code-cell} ipython3
import numpy as np
from scipy import stats

# Experimental wavelength data for the hydrogen Balmer series (n1=2) (nm)
n2 = np.array([3, 4, 5, 6, 7])
lambda_exp = np.array([656.3, 486.1, 434.0, 410.2, 397.0])  # nm

# Rydberg formula: 1/lambda = R * (1/n1^2 - 1/n2^2)
# Let x = (1/4 - 1/n2^2), y = 1/lambda
# Then y = R * x (linear relationship through the origin)

x = 1/4 - 1/n2**2
y = 1 / (lambda_exp * 1e-9)  # Convert to m^-1

# Linear regression (forced through origin)
slope, _, _, _, _ = stats.linregress(x, y)

print(f"Fitted Rydberg constant: R = {slope:.4e} m^-1")
print(f"Standard value:          R = 1.0974e+07 m^-1")
print(f"Relative error: {abs(slope - 1.0974e7)/1.0974e7 * 100:.2f}%")
```

## Discussion Questions

1. What kind of energy structure does the $1/n^2$ form in the Rydberg formula hint at? Why $n^2$ rather than $n$ or $n^3$?

2. Balmer discovered his formula in 1885, but the Bohr model did not appear until 1913. During those 28 years, how did physicists view the Balmer formula? Does an empirical formula "without a theoretical explanation" have value?

3. The hydrogen atom spectrum is remarkably simple (the Rydberg formula), yet the sodium atom spectrum is much more complex. Where does this complexity come from? Why is the hydrogen atom called "the physicist's hydrogen atom"?
