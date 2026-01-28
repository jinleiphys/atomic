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

# 2.2 强制量化补丁——玻尔模型

> **Algorithm Goal:** 通过对经典行星模型施加角动量量子化约束，将连续轨道空间离散化，消除经典模型的能量泄露 Bug。

---

## Carbon Story：玻尔的三个假设

### 物理学的至暗时刻

1913 年，物理学面临一个尴尬的局面：

- 卢瑟福散射证明了原子核的存在（第一章）。
- 光谱数据暗示了某种离散结构（2.1 节）。
- 但经典理论预言原子会在 $10^{-11}$ 秒内坍缩。

年轻的丹麦物理学家尼尔斯·玻尔（Niels Bohr）做了一件大胆的事：他不去修补经典理论，而是直接**强行添加新规则**。

### 三个假设

**假设一：定态假设**

电子在原子中只能处于一系列特定的稳定轨道上，称为**定态**。在定态中运动的电子不辐射电磁波。

$$
E_n = -\frac{me^4}{2\hbar^2} \cdot \frac{1}{n^2} = -\frac{13.6 \text{ eV}}{n^2}, \quad n = 1, 2, 3, \ldots
$$

**假设二：跃迁规则**

电子从高能级 $E_{n_2}$ 跃迁到低能级 $E_{n_1}$ 时，发出频率为 $\nu$ 的光子：

$$
h\nu = E_{n_2} - E_{n_1}
$$

**假设三：角动量量子化**

电子轨道角动量只能取 $\hbar$ 的整数倍：

$$
L = m_e v r = n\hbar, \quad n = 1, 2, 3, \ldots
$$

### 推导玻尔半径

联立角动量量子化条件和库仑力提供向心力：

$$
\begin{cases}
m_e v r = n\hbar \\
\displaystyle\frac{e^2}{4\pi\epsilon_0 r^2} = \frac{m_e v^2}{r}
\end{cases}
$$

消去 $v$，得到第 $n$ 个允许轨道的半径：

$$
r_n = \frac{4\pi\epsilon_0 \hbar^2}{m_e e^2} \cdot n^2 = a_0 n^2
$$

其中 $a_0 = 0.529 \text{ \AA}$ 就是**玻尔半径**——氢原子基态的轨道半径。

将 $r_n$ 代入能量表达式，立刻得到里德伯公式，理论计算的 $R_\infty$ 与实验值完美吻合。

---

## Silicon Perspective：模数转换（ADC）

### 从模拟到数字

玻尔所做的事情，本质上是一次**模数转换（Analog-to-Digital Conversion, ADC）**。

在经典模型中：
- 轨道半径 $r$ 是连续变量（模拟信号），可以取任意正实数值。
- 能量 $E$ 也是连续的。

玻尔的量子化条件把这个连续空间"采样"成了离散格点：

```
经典 (模拟):  r ∈ (0, ∞)     → 无穷多个轨道
玻尔 (数字):  r ∈ {a₀, 4a₀, 9a₀, 16a₀, ...}  → 可数个轨道
```

角动量量子化 $L = n\hbar$ 就是**采样频率**——它决定了"像素大小"。普朗克常数 $\hbar$ 是宇宙的最小分辨率单位。

### 能级即内存地址

电子只能驻留在特定能级上，就像数据只能存储在特定的内存地址上：

```
能级编号 n:    1      2      3      4     ...
能量 (eV):  -13.6  -3.40  -1.51  -0.85  ...
内存地址:   0x001  0x002  0x003  0x004  ...
```

光子发射 = 电子从一个地址"跳转"到另一个地址，释放的能量差以光子的形式输出。

这就解释了为什么光谱是离散的——因为地址是离散的，两个地址之间的差值也只能取离散值。

---

## AI Workshop：玻尔模型能级图

```{code-cell} ipython3
import numpy as np
import matplotlib.pyplot as plt

# 玻尔模型能级
def E_n(n):
    """氢原子第n能级的能量 (eV)"""
    return -13.6 / n**2

# 绘制能级图
fig, ax = plt.subplots(figsize=(8, 10))

n_max = 7
for n in range(1, n_max + 1):
    E = E_n(n)
    ax.hlines(E, 0.2, 0.8, colors='blue', linewidth=2)
    ax.text(0.85, E, f'n={n}, E={E:.2f} eV', va='center', fontsize=10)

# 标注几个跃迁 (巴尔末系)
transitions = [(3, 2, 'red'), (4, 2, 'cyan'), (5, 2, 'blue'), (6, 2, 'violet')]
for n2, n1, color in transitions:
    E_upper = E_n(n2)
    E_lower = E_n(n1)
    dE = E_upper - E_lower
    lam = 1240 / dE  # nm (from E = hc/λ, with E in eV, λ in nm)
    ax.annotate('', xy=(0.5, E_lower), xytext=(0.5, E_upper),
                arrowprops=dict(arrowstyle='->', color=color, lw=1.5))
    ax.text(0.52, (E_upper + E_lower)/2, f'{lam:.0f} nm',
            fontsize=8, color=color)

ax.set_xlim(0, 1.2)
ax.set_ylim(-15, 1)
ax.set_ylabel('能量 (eV)')
ax.set_title('氢原子玻尔模型能级图')
ax.axhline(y=0, color='gray', linestyle='--', alpha=0.5, label='电离极限')
ax.get_xaxis().set_visible(False)
ax.legend()
plt.tight_layout()
plt.savefig('bohr_energy_levels.png', dpi=150)
plt.show()
```

---

## 习题

1. **[传统]** 计算氢原子前四个轨道的半径和能量。从 $n=3$ 到 $n=2$ 的跃迁发出的光子波长是多少？
2. **[传统]** 将玻尔模型推广到类氢离子（核电荷 $Z$），推导能级公式 $E_n = -13.6 Z^2/n^2$ eV。计算 $\text{He}^+$ 和 $\text{Li}^{2+}$ 的基态能量和电离能。
3. **[思考]** 玻尔模型成功地解释了氢原子光谱，但它有哪些根本性的局限？为什么它不能推广到多电子原子？
4. **[计算]** 修改上面的代码，绘制 $\text{He}^+$ 的能级图，并标注从 $n=4$ 到 $n=3$ 跃迁的波长。
