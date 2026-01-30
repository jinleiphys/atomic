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

# 4.3 3D 渲染解——氢原子波函数

> **Algorithm Goal:** 求解氢原子的定态薛定谔方程，理解量子数 $(n, l, m)$ 如何定义波函数的几何拓扑。

---

## Carbon Story：分离变量与量子数

### 氢原子的薛定谔方程

氢原子中，电子处于原子核的库仑势中：

$$
V(r) = -\frac{e^2}{4\pi\epsilon_0 r}
$$

定态薛定谔方程(球坐标)：

$$
-\frac{\hbar^2}{2m_e}\left[\frac{1}{r^2}\frac{\partial}{\partial r}\left(r^2 \frac{\partial \psi}{\partial r}\right) + \frac{1}{r^2\sin\theta}\frac{\partial}{\partial \theta}\left(\sin\theta\frac{\partial \psi}{\partial \theta}\right) + \frac{1}{r^2\sin^2\theta}\frac{\partial^2 \psi}{\partial \phi^2}\right] - \frac{e^2}{4\pi\epsilon_0 r}\psi = E\psi
$$

### 分离变量

由于势能只依赖于 $r$(球对称)，可以将波函数分离为：

$$
\psi_{nlm}(r, \theta, \phi) = R_{nl}(r) \cdot Y_l^m(\theta, \phi)
$$

- $R_{nl}(r)$：径向波函数——决定电子离核的远近分布。
- $Y_l^m(\theta, \phi)$：球谐函数——决定电子云的角度形状。

### 三个量子数

分离变量过程自然引入了三个量子数：

| 量子数 | 名称 | 取值范围 | 物理意义 |
|--------|------|----------|----------|
| $n$ | 主量子数 | $1, 2, 3, \ldots$ | 决定能量和轨道大小 |
| $l$ | 角量子数 | $0, 1, \ldots, n-1$ | 决定角动量大小和轨道形状 |
| $m$ | 磁量子数 | $-l, \ldots, 0, \ldots, +l$ | 决定角动量在 $z$ 方向的分量 |

### 能级

氢原子的能量只依赖于主量子数：

$$
E_n = -\frac{13.6 \text{ eV}}{n^2}
$$

这与玻尔模型的结果完全一致！但现在它是从薛定谔方程严格推导出来的，不再是临时假设。

### 简并度

对于给定的 $n$，有 $n^2$ 个不同的 $(l, m)$ 组合(不考虑自旋)，它们具有相同的能量。这种**简并**是库仑势的特殊对称性($O(4)$ 对称性)的结果。

| $n$ | $l$ 取值 | 状态数 | 轨道名称 |
|-----|---------|--------|----------|
| 1 | 0 | 1 | 1s |
| 2 | 0, 1 | 4 | 2s, 2p |
| 3 | 0, 1, 2 | 9 | 3s, 3p, 3d |

### 轨道磁矩

电子的轨道运动产生磁矩：

$$
\boldsymbol{\mu}_l = -\frac{e}{2m_e}\mathbf{L}
$$

磁矩的 $z$ 分量：

$$
\mu_z = -m_l \mu_B, \quad \mu_B = \frac{e\hbar}{2m_e} = 9.274 \times 10^{-24} \text{ J/T}
$$

其中 $\mu_B$ 是**玻尔磁子**。这解释了为什么磁场中光谱线会分裂(正常塞曼效应)。

---

## Silicon Perspective：球谐函数即 3D 渲染参数

### 量子数 = 波函数的几何参数

$(n, l, m)$ 不是抽象的数字，而是定义波函数几何拓扑的三个"渲染参数"：

- **$n$(主量子数)**：控制波函数的**径向范围**(电子云有多大)和**径向节点数**($n-l-1$ 个球面节点)。
- **$l$(角量子数)**：控制波函数的**角度复杂度**($l$ 个角度节面)。$l=0$ 是球形，$l=1$ 是哑铃形，$l=2$ 是四叶草形……
- **$m$(磁量子数)**：控制波函数在 $z$ 轴周围的**旋转对称性**。$m=0$ 关于 $z$ 轴旋转对称，$m \neq 0$ 打破这种对称。

```
渲染参数映射:

n → 缩放比例 (zoom level)
l → 角度复杂度 (polygon count)
m → 方位角取向 (azimuthal orientation)
```

### 轨道命名的 CS 解读

传统的 s, p, d, f 命名来自光谱学历史(sharp, principal, diffuse, fundamental)。用现代语言：

```
s 轨道 (l=0): 球形      → 0 个角度节面 → 各向同性
p 轨道 (l=1): 哑铃形    → 1 个角度节面 → 有方向性
d 轨道 (l=2): 四叶草形  → 2 个角度节面 → 更复杂的方向性
f 轨道 (l=3): 更复杂    → 3 个角度节面
```

---

## AI Workshop：氢原子轨道 3D 可视化

```{code-cell} ipython3
import numpy as np
import matplotlib.pyplot as plt
from matplotlib import cm
from scipy.special import sph_harm_y, assoc_laguerre, factorial

def hydrogen_wavefunction(n, l, m, r, theta, phi):
    """
    氢原子波函数 ψ_nlm(r, θ, φ)
    r 以玻尔半径 a0 为单位
    """
    a0 = 1.0  # 玻尔半径为单位
    rho = 2 * r / (n * a0)

    # 径向部分
    norm_r = np.sqrt((2/(n*a0))**3 * factorial(n-l-1) / (2*n * factorial(n+l)**3))
    R = norm_r * np.exp(-rho/2) * rho**l * assoc_laguerre(rho, n-l-1, 2*l+1)

    # 角度部分 (球谐函数)
    Y = sph_harm_y(l, m, theta, phi)

    return R * Y

# 在 xz 平面绘制概率密度截面图
def plot_orbital_cross_section(n, l, m, ax, rmax=None):
    """绘制 xz 平面 (φ=0) 的概率密度"""
    if rmax is None:
        rmax = 2 * n**2 + 10

    N = 400
    x = np.linspace(-rmax, rmax, N)
    z = np.linspace(-rmax, rmax, N)
    X, Z = np.meshgrid(x, z)

    R = np.sqrt(X**2 + Z**2) + 1e-10
    Theta = np.arccos(np.clip(Z / R, -1, 1))
    Phi = np.zeros_like(R)

    psi = hydrogen_wavefunction(n, l, m, R, Theta, Phi)
    prob = np.abs(psi)**2

    # 对数尺度增强对比度
    prob_log = np.log10(prob + 1e-20)
    vmax = prob_log.max()

    ax.pcolormesh(X, Z, prob_log, cmap='inferno',
                  vmin=vmax-6, vmax=vmax, shading='auto')
    ax.set_aspect('equal')

    # 标注轨道名称
    orbital_names = {0:'s', 1:'p', 2:'d', 3:'f'}
    name = f"{n}{orbital_names.get(l, '?')}"
    ax.set_title(f'{name}  (n={n}, l={l}, m={m})', fontsize=11)
    ax.set_xlabel('x / a₀')
    ax.set_ylabel('z / a₀')

# 绘制一组轨道
orbitals = [
    (1, 0, 0), (2, 0, 0), (2, 1, 0), (2, 1, 1),
    (3, 0, 0), (3, 1, 0), (3, 2, 0), (3, 2, 1),
]

fig, axes = plt.subplots(2, 4, figsize=(18, 9))
for ax, (n, l, m) in zip(axes.flat, orbitals):
    plot_orbital_cross_section(n, l, m, ax)

plt.suptitle('氢原子轨道概率密度截面图 (xz 平面, 对数尺度)', fontsize=14)
plt.tight_layout()
plt.savefig('hydrogen_orbitals.png', dpi=150, bbox_inches='tight')
plt.show()
```

---

## 习题

1. **[传统]** 写出氢原子 1s、2s、2p ($m=0$) 态的完整波函数(含归一化常数)。画出它们的径向概率分布 $r^2|R_{nl}|^2$。
2. **[传统]** 计算氢原子 2p 态的轨道角动量大小 $|\mathbf{L}|$ 和 $z$ 分量 $L_z$ 的可能取值。
3. **[传统]** 解释为什么氢原子的能级只依赖于 $n$ 而不依赖于 $l$。对于多电子原子，这个简并是否仍然成立？为什么？
4. **[计算]** 运行上面的代码，绘制 $n=4$ 层的所有轨道截面图。观察径向节点数和角度节面数与量子数的关系。
