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

# 4.3 氢原子的量子力学解

## 分离变量与量子数

氢原子是量子力学中最重要的精确可解问题之一。在氢原子中，电子处于原子核的库仑势中：

$$
V(r) = -\frac{e^2}{4\pi\epsilon_0 r}
$$

这个势能只依赖于电子到原子核的距离 $r$，具有完美的球对称性。定态薛定谔方程在球坐标下写为：

$$
-\frac{\hbar^2}{2m_e}\left[\frac{1}{r^2}\frac{\partial}{\partial r}\left(r^2 \frac{\partial \psi}{\partial r}\right) + \frac{1}{r^2\sin\theta}\frac{\partial}{\partial \theta}\left(\sin\theta\frac{\partial \psi}{\partial \theta}\right) + \frac{1}{r^2\sin^2\theta}\frac{\partial^2 \psi}{\partial \phi^2}\right] - \frac{e^2}{4\pi\epsilon_0 r}\psi = E\psi
$$

由于势能只依赖于 $r$(球对称)，可以将波函数分离为径向部分和角度部分的乘积：

$$
\psi_{nlm}(r, \theta, \phi) = R_{nl}(r) \cdot Y_l^m(\theta, \phi)
$$

其中 $R_{nl}(r)$ 是径向波函数，决定电子离核的远近分布；$Y_l^m(\theta, \phi)$ 是球谐函数，决定电子云的角度形状。这种分离变量的方法将一个三维偏微分方程化为了几个更容易处理的常微分方程。球谐函数 $Y_l^m$ 是拉普拉斯方程在球面上的本征函数，它们在数学物理中无处不在，从电磁学中的多极展开到地球物理学中的重力场分析都会用到。

分离变量的过程自然引入了三个量子数，它们从数学上约束了波函数的形式，同时在物理上决定了电子状态的全部特征。主量子数 $n$ 可以取 1, 2, 3, ... 的任意正整数值，它决定了电子的能量以及轨道的整体大小。$n$ 越大，电子离核越远，能量越高(绝对值越小)。角量子数 $l$ 的取值范围是 $0, 1, 2, \ldots, n-1$，它决定了电子轨道角动量的大小 $|\mathbf{L}| = \hbar\sqrt{l(l+1)}$ 以及电子云的角度形状。磁量子数 $m$ 的取值范围是 $-l, -l+1, \ldots, 0, \ldots, l-1, l$，共 $2l+1$ 个值，它决定了角动量在 $z$ 方向的分量 $L_z = m\hbar$。这三个量子数并非人为引入的，而是数学上要求波函数满足单值性、有限性和归一化条件的必然结果。

氢原子的能量只依赖于主量子数：

$$
E_n = -\frac{13.6 \text{ eV}}{n^2}
$$

这与玻尔模型的结果完全一致！但现在它是从薛定谔方程严格推导出来的，不再是临时假设。玻尔模型中那些看似武断的量子化条件——角动量必须是 $\hbar$ 的整数倍——在薛定谔方程的框架中自然地浮现出来，成为边界条件的数学推论。

对于给定的 $n$，有 $n^2$ 个不同的 $(l, m)$ 组合(不考虑自旋)，它们具有相同的能量。这种**简并**是库仑势的特殊对称性($O(4)$ 对称性)的结果。具体来说，当 $n = 1$ 时，$l$ 只能取 0，因此只有一个状态，称为 1s 态。当 $n = 2$ 时，$l$ 可以取 0 或 1，对应的状态有 $l=0$ 的一个(2s)加上 $l=1, m=-1,0,+1$ 的三个(2p)，共 4 个态。当 $n = 3$ 时，$l$ 可以取 0, 1, 2，对应 1 + 3 + 5 = 9 个态，分别命名为 3s, 3p, 3d。这里的字母 s, p, d, f 来自早期光谱学家对谱线系列的描述性命名。当 $l = 0$ 时，轨道被称为 s 轨道，这个字母来自早期光谱学中的 sharp(锐利)一词，因为 s 系列谱线在光谱中呈现锐利的特征。当 $l = 1$ 时，轨道被称为 p 轨道，来自 principal(主要的)一词。当 $l = 2$ 时，轨道被称为 d 轨道，来自 diffuse(弥散的)。当 $l = 3$ 时，轨道被称为 f 轨道，来自 fundamental(基本的)。此后的命名按字母表顺序继续：g, h, i, ...。这套命名法虽然有些古老，但至今仍在原子物理学和化学中广泛使用。

电子的轨道运动产生磁矩：

$$
\boldsymbol{\mu}_l = -\frac{e}{2m_e}\mathbf{L}
$$

磁矩的 $z$ 分量：

$$
\mu_z = -m_l \mu_B, \quad \mu_B = \frac{e\hbar}{2m_e} = 9.274 \times 10^{-24} \text{ J/T}
$$

其中 $\mu_B$ 是**玻尔磁子**，它是原子磁矩的自然单位。轨道磁矩的存在解释了为什么磁场中光谱线会分裂——这就是正常塞曼效应。当原子处于外磁场中时，不同 $m$ 值的态具有不同的能量，因此原来简并的能级被分裂为 $2l+1$ 个子能级，对应的光谱线也随之分裂。

## 硅基视角：球谐函数即 3D 渲染参数

$(n, l, m)$ 不是抽象的数字，而是定义波函数几何拓扑的三个"渲染参数"。主量子数 $n$ 控制波函数的径向范围，即电子云有多大，同时决定了径向节点的数目(共有 $n-l-1$ 个球面节点)。节点是波函数为零的面，就像一根振动弦上的不动点一样，$n$ 越大，径向上的振荡越多，节点也越多。角量子数 $l$ 控制波函数的角度复杂度，即电子云在空间中呈现出多少个角度节面。$l=0$ 时电子云是球形的(各向同性)，$l=1$ 时呈哑铃形(具有一个角度节面)，$l=2$ 时呈四叶草形(两个角度节面)，随着 $l$ 的增大，角度结构越来越复杂。磁量子数 $m$ 控制波函数在 $z$ 轴周围的旋转对称性。当 $m=0$ 时，波函数关于 $z$ 轴旋转对称；当 $m \neq 0$ 时，这种对称性被打破，波函数在方位角方向上呈现出振荡结构。

用计算机图形学的语言来说，$n$ 类似于缩放比例(zoom level)，决定了渲染场景的整体尺度；$l$ 类似于角度复杂度(polygon count)，决定了形状有多复杂；$m$ 类似于方位角取向(azimuthal orientation)，决定了形状在空间中如何摆放。传统的 s, p, d, f 命名来自光谱学历史(sharp, principal, diffuse, fundamental)，但从几何的角度看，它们的含义更加直观：s 轨道($l=0$)是球形的，没有角度节面，完全各向同性；p 轨道($l=1$)是哑铃形的，有一个角度节面，具有明确的方向性；d 轨道($l=2$)是四叶草形的，有两个角度节面，方向性更加复杂；f 轨道($l=3$)则更加复杂，有三个角度节面。随着 $l$ 的增大，电子云的形状就像多边形面数越来越多的三维模型，角度细节越来越丰富。

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

## 思考题

1. 氢原子的能级只依赖于主量子数 $n$ 而不依赖于角量子数 $l$，这种"意外简并"来自哪里？库仑势有什么特殊之处？

2. 电子云的形状(s、p、d轨道)与化学键的方向性有什么关系？为什么碳原子能形成四面体构型的共价键？

3. 量子力学给出的氢原子图像与玻尔模型有什么本质区别？"电子轨道"这个概念还有意义吗？

4. 氢原子问题可以精确求解，但氦原子(两个电子)就不能了。为什么多一个电子会使问题变得如此困难？
