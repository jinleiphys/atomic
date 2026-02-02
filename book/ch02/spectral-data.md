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
plt.rcParams['font.sans-serif'] = ['Heiti TC', 'Noto Sans CJK SC', 'SimHei', 'DejaVu Sans']
plt.rcParams['axes.unicode_minus'] = False
```

# 2.1 数据挖掘与特征提取

> **Algorithm Goal:** 对原子光谱数据进行符号回归，发现隐藏的数学结构。

---

## Carbon Story：破译原子的状态码

### 光谱，原子的指纹

将氢气放电管发出的光通过棱镜，你不会看到彩虹般的连续光谱，而是几条分立的、锐利的亮线，散落在特定的波长位置上。

每种元素都有自己独特的光谱线组合，这就是原子的"指纹"。19 世纪的光谱学家精确测量了大量元素的光谱波长，积累了庞大的数据库。但这些数据看起来毫无规律，只是一串串"随机"的数字。

### 巴尔末的直觉

1885 年，瑞士数学教师巴尔末(Johann Balmer)盯着氢原子可见光区的四条谱线波长：

| 谱线 | 波长 (nm) |
|------|-----------|
| $H_\alpha$ | 656.3 |
| $H_\beta$ | 486.1 |
| $H_\gamma$ | 434.0 |
| $H_\delta$ | 410.2 |

他注意到这些数字之间存在某种数学关系，经过反复尝试，凑出了一个公式：

$$
\lambda = B \frac{n^2}{n^2 - 4}, \quad n = 3, 4, 5, 6, \ldots
$$

其中 $B = 364.56$ nm。这个公式精确地复现了所有已知氢原子谱线。

### 里德伯的统一

1888 年，里德伯(Johannes Rydberg)将巴尔末公式推广为更一般的形式：

$$
\frac{1}{\lambda} = R_\infty \left(\frac{1}{n_1^2} - \frac{1}{n_2^2}\right), \quad n_2 > n_1
$$

其中 $R_\infty = 1.097 \times 10^7 \text{ m}^{-1}$ 是里德伯常数。$n_1 = 1$ 给出莱曼系(紫外)，$n_1 = 2$ 给出巴尔末系(可见光)，$n_1 = 3$ 给出帕邢系(红外)……

**一个公式，统一了所有氢原子光谱线。** 但在当时，没人知道这个公式为什么是对的。

---

## Silicon Perspective：符号回归

巴尔末所做的事情，在现代数据科学中叫做**符号回归(Symbolic Regression)**：给定一组数据点，搜索能够拟合数据的解析表达式。

### 光谱数据即"状态码"

原子发出的每一条光谱线，都是一个"状态码(Status Code)"，它携带了原子内部状态变化的信息。里德伯公式告诉我们：

- 光谱频率由**两个整数**($n_1$, $n_2$)决定。
- 这意味着原子内部有某种**离散的状态编号系统**。
- 光谱线对应两个状态之间的"跃迁"。

从信息论角度看，里德伯公式是对海量光谱数据的**无损压缩**：用一个常数 $R_\infty$ 和两个整数，就能重建任意一条谱线的波长。压缩比惊人。

### 代码示例：用线性回归重新发现里德伯常数

```{code-cell} ipython3
import numpy as np
from scipy import stats

# 氢原子巴尔末系 (n1=2) 的实验波长数据 (nm)
n2 = np.array([3, 4, 5, 6, 7])
lambda_exp = np.array([656.3, 486.1, 434.0, 410.2, 397.0])  # nm

# 里德伯公式: 1/λ = R * (1/n1² - 1/n2²)
# 令 x = (1/4 - 1/n2²), y = 1/λ
# 则 y = R * x (过原点的线性关系)

x = 1/4 - 1/n2**2
y = 1 / (lambda_exp * 1e-9)  # 转换为 m⁻¹

# 线性回归 (强制过原点)
slope, _, _, _, _ = stats.linregress(x, y)

print(f"拟合得到的里德伯常数: R = {slope:.4e} m⁻¹")
print(f"标准值:              R = 1.0974e+07 m⁻¹")
print(f"相对误差: {abs(slope - 1.0974e7)/1.0974e7 * 100:.2f}%")
```

---

## 思考题

1. 里德伯公式中 $1/n^2$ 的形式暗示了什么样的能量结构？为什么是 $n^2$ 而不是 $n$ 或 $n^3$？

2. 巴尔末在1885年发现了他的公式，但玻尔模型直到1913年才出现。在这28年间，物理学家们如何看待巴尔末公式？一个"没有理论解释"的经验公式有价值吗？

3. 氢原子光谱如此简单(里德伯公式)，但钠原子光谱就复杂得多。这种复杂性来自哪里？为什么说氢原子是"物理学家的氢原子"？
