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

# 2.1 Data Mining and Feature Extraction

> **Algorithm Goal:** Perform symbolic regression on atomic spectral data to discover hidden mathematical structures.

---

## Carbon Story: Decoding the Atom's Status Codes

### Spectra: The Atom's Fingerprint

When light from a hydrogen discharge tube is passed through a prism, you do not see a rainbow-like continuous spectrum, but rather a few discrete, sharp bright lines scattered at specific wavelength positions.

Every element has its own unique combination of spectral lines, forming the atom's "fingerprint." Nineteenth-century spectroscopists precisely measured the spectral wavelengths of many elements, accumulating a vast database. Yet these data appeared to follow no pattern at all, just strings of seemingly "random" numbers.

### Balmer's Intuition

In 1885, Swiss mathematics teacher Johann Balmer stared at the wavelengths of the four visible spectral lines of the hydrogen atom:

| Spectral Line | Wavelength (nm) |
|------|-----------|
| $H_\alpha$ | 656.3 |
| $H_\beta$ | 486.1 |
| $H_\gamma$ | 434.0 |
| $H_\delta$ | 410.2 |

He noticed a mathematical relationship among these numbers. After repeated trial and error, he pieced together a formula:

$$
\lambda = B \frac{n^2}{n^2 - 4}, \quad n = 3, 4, 5, 6, \ldots
$$

where $B = 364.56$ nm. This formula accurately reproduced all known hydrogen spectral lines.

### Rydberg's Unification

In 1888, Johannes Rydberg generalized Balmer's formula into a more universal form:

$$
\frac{1}{\lambda} = R_\infty \left(\frac{1}{n_1^2} - \frac{1}{n_2^2}\right), \quad n_2 > n_1
$$

where $R_\infty = 1.097 \times 10^7 \text{ m}^{-1}$ is the Rydberg constant. $n_1 = 1$ gives the Lyman series (ultraviolet), $n_1 = 2$ gives the Balmer series (visible), $n_1 = 3$ gives the Paschen series (infrared)...

**A single formula unifying all hydrogen spectral lines.** But at the time, no one knew why this formula was correct.

---

## Silicon Perspective: Symbolic Regression

What Balmer did is called **Symbolic Regression** in modern data science: given a set of data points, search for an analytical expression that fits the data.

### Spectral Data as "Status Codes"

Every spectral line emitted by an atom is a "Status Code" carrying information about changes in the atom's internal state. The Rydberg formula tells us:

- The spectral frequency is determined by **two integers** ($n_1$, $n_2$).
- This implies that there is some kind of **discrete state numbering system** inside the atom.
- Each spectral line corresponds to a "transition" between two states.

From an information-theoretic perspective, the Rydberg formula is a **lossless compression** of a massive amount of spectral data: with a single constant $R_\infty$ and two integers, one can reconstruct the wavelength of any spectral line. The compression ratio is astonishing.

### Code Example: Rediscovering the Rydberg Constant via Linear Regression

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

---

## Discussion Questions

1. What kind of energy structure does the $1/n^2$ form in the Rydberg formula hint at? Why $n^2$ rather than $n$ or $n^3$?

2. Balmer discovered his formula in 1885, but the Bohr model did not appear until 1913. During those 28 years, how did physicists view the Balmer formula? Does an empirical formula "without a theoretical explanation" have value?

3. The hydrogen atom spectrum is remarkably simple (the Rydberg formula), yet the sodium atom spectrum is much more complex. Where does this complexity come from? Why is the hydrogen atom called "the physicist's hydrogen atom"?
