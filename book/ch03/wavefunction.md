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

# 3.3 状态数据库

> **Algorithm Goal:** 理解波函数 $\psi$ 作为"信息载体"的角色，它不是物理实体，而是编码了粒子在空间中出现概率的完整数据库。

---

## Carbon Story：上帝掷骰子吗？

### 薛定谔的波与玻恩的概率

1926 年，薛定谔写出了波动方程(详见第四章)，波函数 $\psi(x,t)$ 成为量子力学的核心对象。但 $\psi$ 的物理意义是什么？

薛定谔本人希望 $\psi$ 代表某种真实的物理波，类似于电磁场中的电场。但这个解释很快遇到了困难：$\psi$ 是复数，而且对于多粒子系统，$\psi$ 存在于高维构型空间中，不是三维物理空间中的波。

1926 年，玻恩(Max Born)提出了**统计解释**：

$$
|\psi(x,t)|^2 \, dx = \text{在 } x \text{ 到 } x+dx \text{ 之间找到粒子的概率}
$$

$\psi$ 本身不是可观测量，但 $|\psi|^2$ 是**概率密度函数(PDF)**。

这意味着：

- 量子力学不预言单次测量的结果，只预言**统计分布**。
- 对同一个量子态进行大量相同的测量，结果服从 $|\psi|^2$ 给出的分布。
- 单次测量的结果是**内禀随机**的，不是因为我们信息不足。

### 爱因斯坦的反对

爱因斯坦终其一生反对这种解释。他著名的论断是：

> "上帝不掷骰子。"

他认为量子力学是不完备的，背后应该有某种"隐变量"决定了看似随机的结果。

玻尔的回答同样著名：

> "爱因斯坦，别去指挥上帝该怎么做。"

后来的贝尔不等式实验(1982, Aspect 等人)明确排除了局域隐变量理论，证实了量子力学的内禀随机性。

### 波函数的性质

作为概率的数学载体，波函数必须满足：

1. **归一化条件**：

$$
\int_{-\infty}^{\infty} |\psi(x)|^2 \, dx = 1
$$

粒子一定在某处，概率总和为 1。

2. **叠加原理**：如果 $\psi_1$ 和 $\psi_2$ 是合法的波函数，那么 $c_1\psi_1 + c_2\psi_2$ 也是合法的波函数。这导致了干涉效应，量子力学最核心的特征。

3. **连续性**：$\psi$ 和 $d\psi/dx$ 在空间中连续(除了无穷大势垒处)。

---

## Silicon Perspective：概率密度函数与热力图

### 从钟表到云端数据库

经典力学中，粒子的状态是一个精确的点 $(x, p)$，像一个指向确定位置的指针(钟表)。

量子力学中，粒子的状态是一个**分布** $|\psi(x)|^2$，像一张热力图(Heatmap)，告诉你每个位置被"采样"到的相对概率。

```
经典状态:  粒子在 x = 3.0 处
            ↓ 确定性
            |       |
            |   ↑   |
            |   |   |
            +---*---+→  x
                3.0

量子态:    粒子"弥散"在空间中
            ↓ 概率密度
            |  ╭──╮
            | ╭╯  ╰╮
            |╭╯    ╰╮
            +────────→  x
              |ψ(x)|²
```

原子不是一个电子在确定轨道上转圈的"钟表"，而是一个电子概率密度分布的"云端数据库"，电子云。

### 波函数作为信息载体

$\psi(x)$ 编码了关于粒子的**全部信息**。你想知道的任何物理量，都可以通过对 $\psi$ 施加相应的算符来提取(详见第四章)：

```python
# 伪代码：从波函数中提取物理信息
state = Wavefunction(psi)

# 位置的期望值
x_avg = state.query(operator="position")  # ∫ ψ* x ψ dx

# 动量的期望值
p_avg = state.query(operator="momentum")  # ∫ ψ* (-iℏ d/dx) ψ dx

# 能量的期望值
E_avg = state.query(operator="hamiltonian")  # ∫ ψ* H ψ dx
```

$\psi$ 就像一个数据库，算符就像 SQL 查询语句，你用不同的查询，从同一个数据库中提取不同的信息。

---

## AI Workshop：可视化氢原子电子云

```{code-cell} ipython3
import numpy as np
import matplotlib.pyplot as plt
from scipy.special import sph_harm_y, factorial

def hydrogen_radial(n, l, r):
    """氢原子径向波函数 R_nl(r)(简化版)"""
    a0 = 1  # 玻尔半径为单位
    rho = 2 * r / (n * a0)
    # 归一化的简化计算
    from scipy.special import assoc_laguerre
    norm = np.sqrt((2/(n*a0))**3 * factorial(n-l-1) / (2*n*factorial(n+l)**3))
    return norm * np.exp(-rho/2) * rho**l * assoc_laguerre(rho, n-l-1, 2*l+1)

def prob_density_2d(n, l, m, N=500):
    """计算 xz 平面上的概率密度"""
    x = np.linspace(-25, 25, N)
    z = np.linspace(-25, 25, N)
    X, Z = np.meshgrid(x, z)
    R = np.sqrt(X**2 + Z**2) + 1e-10
    Theta = np.arccos(Z / R)

    Rnl = hydrogen_radial(n, l, R)
    Ylm = sph_harm_y(l, m, Theta, 0).real  # phi=0 截面
    psi = Rnl * Ylm
    return X, Z, np.abs(psi)**2

# 绘制几个轨道
orbitals = [(1,0,0), (2,0,0), (2,1,0), (3,2,0)]
names = ['1s', '2s', '2p', '3d']

fig, axes = plt.subplots(1, 4, figsize=(16, 4))

for ax, (n,l,m), name in zip(axes, orbitals, names):
    X, Z, prob = prob_density_2d(n, l, m)
    ax.pcolormesh(X, Z, prob, cmap='hot', shading='auto')
    ax.set_aspect('equal')
    ax.set_title(f'{name} (n={n}, l={l}, m={m})')
    ax.set_xlabel('x / a₀')
    ax.set_ylabel('z / a₀')

plt.suptitle('氢原子电子云 |ψ(r,θ)|² 截面图', fontsize=13)
plt.tight_layout()
plt.savefig('electron_clouds.png', dpi=150)
plt.show()
```

---

## 思考题

1. 波函数的叠加原理如何解释双缝干涉实验？为什么"概率的叠加"与"概率幅的叠加"给出不同的结果？

2. 波函数 $\psi$ 是复数，但所有可观测量都是实数。复数在量子力学中起什么作用？能否用实数波函数构建量子力学？

3. 波函数的"坍缩"是什么意思？测量如何改变波函数？这个过程是薛定谔方程描述的吗？

4. 波函数描述的是单个粒子还是粒子的系综？"概率解释"是关于我们知识的陈述，还是关于物理实在的陈述？
