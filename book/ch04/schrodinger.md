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

# 4.1 状态演化引擎——薛定谔方程

> **Algorithm Goal:** 理解薛定谔方程作为量子力学"运动方程"的角色，掌握定态薛定谔方程的特征值问题结构。

---

## Carbon Story：薛定谔的灵感

### 从德布罗意到波动方程

1926 年，奥地利物理学家薛定谔(Erwin Schrödinger)受到德布罗意物质波假说的启发：如果粒子是波，那么应该存在一个**波动方程**来描述这种波的行为。

经典波动方程描述绳上的波、水波、声波。薛定谔的目标是找到一个描述"物质波"的方程。

### 含时薛定谔方程

薛定谔方程的一般形式(含时)是：

$$
i\hbar \frac{\partial \psi}{\partial t} = \hat{H} \psi
$$

其中 $\hat{H}$ 是**哈密顿算符**——系统的总能量算符：

$$
\hat{H} = -\frac{\hbar^2}{2m}\nabla^2 + V(\mathbf{r}, t)
$$

第一项是动能算符，第二项是势能。

### 定态薛定谔方程

当势能不显含时间 $V(\mathbf{r})$ 时，可以做变量分离 $\psi(\mathbf{r}, t) = \psi(\mathbf{r}) e^{-iEt/\hbar}$，得到**定态(时间无关)薛定谔方程**：

$$
\hat{H}\psi = E\psi
$$

展开写就是：

$$
-\frac{\hbar^2}{2m}\nabla^2\psi + V(\mathbf{r})\psi = E\psi
$$

这是一个**特征值方程**：给定势能 $V(\mathbf{r})$，求所有允许的能量 $E$(特征值)及对应的波函数 $\psi$(特征函数)。

### 一维势阱示例

最简单的例子——一维无限深方势阱(粒子被关在宽度为 $L$ 的盒子里)：

$$
V(x) = \begin{cases} 0, & 0 < x < L \\ \infty, & \text{其他} \end{cases}
$$

边界条件 $\psi(0) = \psi(L) = 0$ 给出：

$$
\psi_n(x) = \sqrt{\frac{2}{L}} \sin\left(\frac{n\pi x}{L}\right), \quad E_n = \frac{n^2 \pi^2 \hbar^2}{2mL^2}, \quad n = 1, 2, 3, \ldots
$$

能量自然是量子化的——边界条件迫使波函数只能取特定的"驻波"模式。

---

## Silicon Perspective：特征值问题与递归算法

### 薛定谔方程 = 特征值问题

$\hat{H}\psi = E\psi$ 这个方程的结构在数学和工程中无处不在——它就是**特征值问题(Eigenvalue Problem)**。

在线性代数中，$A\mathbf{v} = \lambda\mathbf{v}$(矩阵 $A$ 作用在向量 $\mathbf{v}$ 上，结果是 $\mathbf{v}$ 的标量倍数)。求解这个方程就是找到所有"本征向量"和"本征值"。

薛定谔方程是它的连续版本：算符 $\hat{H}$ 取代矩阵 $A$，波函数 $\psi$ 取代向量 $\mathbf{v}$，能量 $E$ 取代本征值 $\lambda$。

```
线性代数:     A·v = λ·v     →  找 (λ, v)
量子力学:     H·ψ = E·ψ     →  找 (E, ψ)
```

### 哈密顿量 = 核心算法

$\hat{H}$ 是整个系统的"核心算法"——它编码了所有的物理规则(动能如何算、势能如何分布)。不同的 $V(\mathbf{r})$ 定义了不同的"游戏规则"，薛定谔方程负责在这些规则下找出所有合法的"游戏状态"。

```python
# 伪代码：薛定谔方程求解器
def solve_schrodinger(H, boundary_conditions):
    """
    输入: 哈密顿量 H (定义物理规则)
          边界条件 (定义约束)
    输出: 所有允许的 (能量, 波函数) 对
    """
    eigenvalues, eigenfunctions = eigensolve(H, boundary_conditions)
    return [(E, psi) for E, psi in zip(eigenvalues, eigenfunctions)]
```

---

## AI Workshop：数值求解一维势阱

```{code-cell} ipython3
import numpy as np
import matplotlib.pyplot as plt

# 一维无限深方势阱的数值解
L = 1.0        # 阱宽 (nm)
N = 1000       # 网格点数
dx = L / (N+1)
x = np.linspace(dx, L-dx, N)

# 构建哈密顿矩阵 (有限差分)
# H = -ℏ²/(2m) d²/dx²  → 三对角矩阵
hbar2_over_2m = 0.0762  # eV·nm² (电子)

diag = 2 * hbar2_over_2m / dx**2 * np.ones(N)
off_diag = -hbar2_over_2m / dx**2 * np.ones(N-1)

H = np.diag(diag) + np.diag(off_diag, 1) + np.diag(off_diag, -1)

# 求解特征值问题
energies, wavefunctions = np.linalg.eigh(H)

# 绘制前 4 个本征态
fig, axes = plt.subplots(1, 2, figsize=(14, 6))

# 能级
n_show = 6
for n in range(n_show):
    axes[0].hlines(energies[n], 0, 1, colors='blue', linewidth=2)
    axes[0].text(1.05, energies[n], f'n={n+1}, E={energies[n]:.3f} eV', va='center')

# 解析值对比
n_arr = np.arange(1, n_show+1)
E_exact = n_arr**2 * np.pi**2 * hbar2_over_2m / L**2
for E in E_exact:
    axes[0].hlines(E, 0, 1, colors='red', linewidth=1, linestyles='--')

axes[0].set_ylabel('能量 (eV)')
axes[0].set_title('能级 (蓝=数值, 红虚线=解析)')
axes[0].get_xaxis().set_visible(False)

# 波函数
for n in range(4):
    psi = wavefunctions[:, n]
    psi = psi / np.sqrt(np.trapezoid(psi**2, x))  # 归一化
    axes[1].plot(x, psi + energies[n]*5, label=f'n={n+1}')

axes[1].set_xlabel('位置 x (nm)')
axes[1].set_ylabel('ψ(x) + offset')
axes[1].set_title('波函数')
axes[1].legend()

plt.suptitle('一维无限深方势阱的数值解', fontsize=13)
plt.tight_layout()
plt.savefig('particle_in_box.png', dpi=150)
plt.show()
```

---

## 习题

1. **[传统]** 推导一维无限深方势阱的能级和波函数。验证基态能量 $E_1 = \pi^2\hbar^2/(2mL^2)$ 与不确定关系给出的零点能估计一致。
2. **[传统]** 对于一维谐振子势 $V(x) = \frac{1}{2}m\omega^2 x^2$，薛定谔方程的本征值为 $E_n = (n+\frac{1}{2})\hbar\omega$。基态波函数是什么形状？为什么基态能量不为零？
3. **[计算]** 修改上面的数值代码，将势能从方势阱改为谐振子势，验证数值本征值是否为等间距的($E_n \propto n+1/2$)。
4. **[思考]** 为什么薛定谔方程是线性方程？这与叠加原理有什么关系？如果方程是非线性的，量子力学会变成什么样？
