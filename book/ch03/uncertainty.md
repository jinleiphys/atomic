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

# 3.2 分辨率极限——不确定关系

> **Algorithm Goal:** 理解位置和动量作为共轭变量，为什么无法同时具有任意高的精度——这不是技术限制，而是信息编码的根本极限。

---

## Carbon Story：海森堡的显微镜

### 思想实验

1927 年，海森堡（Werner Heisenberg）提出了一个著名的思想实验：

假设你想用显微镜"看到"一个电子，确定它的位置。你需要用光照射它。为了精确定位，你需要使用短波长的光（分辨率 $\Delta x \sim \lambda$）。

但根据光子的粒子性（$p = h/\lambda$），波长越短的光子，动量越大。当光子与电子碰撞时（康普顿效应），它会给电子一个不可控的动量"踢"。

结果：

- 要精确测量**位置** → 用短波长光 → 光子动量大 → 动量扰动大
- 要精确测量**动量** → 用长波长光 → 位置分辨率差

你无法两全。这就是**海森堡不确定关系**：

$$
\Delta x \cdot \Delta p \geq \frac{\hbar}{2}
$$

### 不确定关系的推广

类似的不确定关系存在于所有**共轭变量对**之间：

$$
\Delta E \cdot \Delta t \geq \frac{\hbar}{2}
$$

能量-时间的不确定关系意味着：一个粒子在极短时间内的能量是"模糊"的。这导致了虚粒子对的产生和量子隧穿等效应。

### 深层含义

海森堡最初从"测量干扰"的角度理解不确定关系，但后来认识到，这不仅仅是测量问题——它是**微观粒子本身的固有属性**。

一个电子不是"有确定位置但我们不知道"，而是**它本身就没有同时确定的位置和动量**。这不是无知，而是本体论。

---

## Silicon Perspective：信息编码极限

### 共轭变量与带宽

在信号处理中，有一个与不确定关系在数学上完全等价的定理——**时频不确定性原理（Gabor Limit）**：

$$
\Delta t \cdot \Delta \omega \geq \frac{1}{2}
$$

一个信号不可能同时具有极短的时域持续时间和极窄的频率带宽。这不是录音设备的缺陷，而是**傅里叶变换的数学性质**。

量子力学中的位置-动量不确定关系与此完全同构：

- 位置 $x$ ↔ 时间 $t$
- 动量 $p$ ↔ 频率 $\omega$
- 普朗克常数 $\hbar$ ↔ 归一化常数

波函数 $\psi(x)$ 和它的傅里叶变换 $\tilde{\psi}(p)$ 是一对共轭表示，数学上无法同时是 $\delta$ 函数。

### 宇宙的像素分辨率

```python
# 不确定关系的一行代码表达
assert delta_x * delta_p >= hbar / 2
```

这条断言永远不会被违反。它不是 Bug，而是 Feature——这是宇宙模拟器的底层规格。

你可以把它想象成：宇宙的"相空间"（位置-动量空间）有一个最小的"像素"大小，面积为 $\hbar/2$。你无法在一个像素的尺度内同时分辨位置和动量。

```
相空间分辨率:

         动量 p
          ↑
          |  ████
          |  ████  ← 一个量子态占据的最小面积 ~ ℏ
          |  ████
          +————————→ 位置 x
```

### 与数字图像的类比

- 一张数码照片的分辨率由像素大小决定。
- 相空间的"分辨率"由 $\hbar$ 决定。
- 你不能让一个像素同时表示精确的 $x$ 坐标和精确的 $p$ 坐标——因为一个像素只是一个像素。

---

## AI Workshop：可视化不确定关系

```{code-cell} ipython3
import numpy as np
import matplotlib.pyplot as plt

def gaussian_wavepacket(x, x0, sigma):
    """高斯波包 (位置空间)"""
    return (1/(2*np.pi*sigma**2))**0.25 * np.exp(-(x-x0)**2 / (4*sigma**2))

x = np.linspace(-20, 20, 1000)

fig, axes = plt.subplots(2, 3, figsize=(14, 8))

# 不同宽度的波包: sigma 越小 → 位置越确定 → 动量越不确定
sigmas = [0.5, 2.0, 8.0]
labels = ['位置精确\n动量模糊', '中等', '位置模糊\n动量精确']

for i, (sigma, label) in enumerate(zip(sigmas, labels)):
    # 位置空间
    psi_x = gaussian_wavepacket(x, 0, sigma)
    prob_x = np.abs(psi_x)**2
    axes[0, i].plot(x, prob_x, 'b-', linewidth=2)
    axes[0, i].set_title(f'σ_x = {sigma}')
    axes[0, i].set_xlabel('位置 x')
    axes[0, i].set_ylabel('|ψ(x)|²')
    axes[0, i].set_xlim(-15, 15)

    # 动量空间 (傅里叶变换)
    dp = 2*np.pi / (x[-1]-x[0])
    p = np.fft.fftshift(np.fft.fftfreq(len(x), d=(x[1]-x[0]))) * 2 * np.pi
    psi_p = np.fft.fftshift(np.fft.fft(psi_x)) * (x[1]-x[0]) / np.sqrt(2*np.pi)
    prob_p = np.abs(psi_p)**2
    prob_p /= np.trapezoid(prob_p, p)
    axes[1, i].plot(p, prob_p, 'r-', linewidth=2)
    axes[1, i].set_title(f'σ_p = {1/(2*sigma):.2f}')
    axes[1, i].set_xlabel('动量 p')
    axes[1, i].set_ylabel('|ψ(p)|²')
    axes[1, i].set_xlim(-5, 5)
    axes[1, i].text(0.5, 0.9, label, transform=axes[1,i].transAxes,
                    ha='center', fontsize=9, color='gray')

plt.suptitle('不确定关系：位置精度 ↔ 动量精度 的此消彼长', fontsize=13)
plt.tight_layout()
plt.savefig('uncertainty_principle.png', dpi=150)
plt.show()
```

---

## 习题

1. **[传统]** 一个电子被约束在宽度为 $L = 1 \text{ \AA}$ 的区域内（原子尺度），估算它的最小动能。
2. **[传统]** 利用能量-时间不确定关系，估算处于激发态（寿命 $\tau \sim 10^{-8}$ s）的原子发出的光谱线的自然线宽 $\Delta \nu$。
3. **[思考]** 不确定关系是否意味着"电子有确定的位置和动量，只是我们无法同时知道它们"？讨论"认识论"解释和"本体论"解释的区别。
4. **[计算]** 运行上面的代码，观察当 $\sigma_x$ 从 0.1 变化到 10 时，$\sigma_x \cdot \sigma_p$ 的乘积是否始终满足 $\geq \hbar/2$。
