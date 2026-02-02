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

# 5.2 参数耦合与调试

> **Algorithm Goal:** 理解自旋-轨道耦合如何修正能级结构，以及外部磁场如何导致能级的进一步分裂。

---

## Carbon Story：光谱线的精细分裂

### 碱金属双线

用高分辨率光谱仪观察钠的发射光谱，著名的黄色 D 线($\lambda \approx 589$ nm)实际上是**两条**非常接近的谱线：

- $D_1$: 589.592 nm
- $D_2$: 588.995 nm

波长差仅 0.597 nm，但它们确实是两条独立的谱线。这就是**精细结构**。

类似的双线结构在氢原子光谱中也存在，只是分裂更小。

### 自旋-轨道耦合

精细结构的物理原因是**自旋-轨道耦合(Spin-Orbit Coupling)**。

从电子的参考系看，带正电的原子核在围绕它运动，产生一个磁场 $\mathbf{B}_{\text{int}}$。电子的自旋磁矩在这个内部磁场中获得额外的势能：

$$
H_{SO} = -\boldsymbol{\mu}_s \cdot \mathbf{B}_{\text{int}} \propto \mathbf{L} \cdot \mathbf{S}
$$

自旋-轨道耦合能正比于 $\mathbf{L} \cdot \mathbf{S}$，也就是轨道角动量和自旋角动量的"点乘"。

### 总角动量

定义总角动量：

$$
\mathbf{J} = \mathbf{L} + \mathbf{S}
$$

新的量子数 $j$ 可以取：

$$
j = l + s = l + \frac{1}{2} \quad \text{或} \quad j = l - s = l - \frac{1}{2} \quad (l \geq 1)
$$

对于 $l = 0$，只有 $j = 1/2$(无分裂)。对于 $l \geq 1$，每个能级分裂为两个。

钠 D 线的分裂就是 $3p$ 态分裂为 $j = 3/2$ 和 $j = 1/2$ 两个子能级：

$$
3p_{3/2} \to 3s_{1/2}: \quad D_2 \text{ 线}
$$
$$
3p_{1/2} \to 3s_{1/2}: \quad D_1 \text{ 线}
$$

### 塞曼效应

当原子置于外部磁场 $\mathbf{B}$ 中时，能级发生进一步分裂，**塞曼效应(Zeeman Effect)**。

在外磁场中，总角动量 $\mathbf{J}$ 的 $z$ 分量 $m_j$ 对应不同的能量：

$$
\Delta E = g_j m_j \mu_B B
$$

其中 **朗德 $g$ 因子**：

$$
g_j = 1 + \frac{j(j+1) + s(s+1) - l(l+1)}{2j(j+1)}
$$

每个 $j$ 能级分裂为 $2j+1$ 个子能级。

- **正常塞曼效应**($S=0$，纯轨道)：每条谱线分裂为三条。
- **反常塞曼效应**($S \neq 0$，自旋参与)：分裂模式更复杂，由 $g_j$ 的具体值决定。

---

## Silicon Perspective：微扰理论，给系统打补丁

### 主程序与补丁包

从软件工程的角度看，氢原子的能级结构就像一个软件的版本迭代：

```
v1.0 — 玻尔模型 (Chapter 2)
  主程序: 库仑势 V(r) = -e²/r
  输出:   E_n = -13.6/n² eV
  精度:   ~10⁻¹ eV

v2.0 — 薛定谔方程 (Chapter 4)
  主程序: 同上(非相对论量子力学)
  输出:   同上，但波函数是精确的
  精度:   ~10⁻¹ eV

v2.1 — 精细结构补丁 (Chapter 5)
  补丁1: 自旋-轨道耦合 H_SO ~ L·S
  补丁2: 相对论动能修正
  补丁3: 达尔文项
  输出:   E_nj = E_n + ΔE(j)
  精度:   ~10⁻⁵ eV

v2.2 — 外场补丁 (塞曼效应)
  补丁:   -μ·B (外磁场耦合)
  输出:   E_njm = E_nj + g_j * m_j * μ_B * B
  精度:   ~10⁻⁶ eV (取决于场强)
```

### 微扰理论的算法逻辑

**微扰理论(Perturbation Theory)**是量子力学中处理"补丁"的标准方法：

1. 先求解**无微扰系统**(主程序)的精确解 $\psi_n^{(0)}$, $E_n^{(0)}$。
2. 把微扰项 $H'$(补丁)视为小量。
3. 逐阶修正能量和波函数。

一阶能量修正：

$$
E_n^{(1)} = \langle \psi_n^{(0)} | H' | \psi_n^{(0)} \rangle
$$

用编程语言来说：在原始波函数上"评估"补丁的效果，取期望值。

```python
def perturbation_correction(psi_0, H_prime, order=1):
    """
    微扰理论: 计算能量修正
    psi_0:   无微扰波函数 (主程序的输出)
    H_prime: 微扰哈密顿量 (补丁)
    """
    if order == 1:
        # 一阶修正: <ψ₀|H'|ψ₀>
        return expectation_value(psi_0, H_prime)
    elif order == 2:
        # 二阶修正: Σ |<ψₘ|H'|ψ₀>|² / (E₀ - Eₘ)
        ...
```

---

## AI Workshop：塞曼效应能级分裂

```{code-cell} ipython3
import numpy as np
import matplotlib.pyplot as plt

def lande_g(j, l, s=0.5):
    """计算朗德 g 因子"""
    if j == 0:
        return 0
    return 1 + (j*(j+1) + s*(s+1) - l*(l+1)) / (2*j*(j+1))

def zeeman_splitting(n, l, B_range):
    """
    计算给定 (n,l) 态在外磁场中的塞曼分裂
    返回各子能级的能量 (相对于无场能量)
    """
    s = 0.5
    mu_B = 5.788e-5  # eV/T

    levels = {}
    for j in [l + s, abs(l - s)]:
        if j < 0:
            continue
        g = lande_g(j, l)
        for mj in np.arange(-j, j+1, 1):
            label = f"j={j:.0f}/2, mj={mj:+.0f}/2" if j % 1 else f"j={j:.0f}, mj={mj:+.0f}"
            # 实际使用半整数
            levels[(j, mj)] = g * mj * mu_B * B_range

    return levels

# 钠 D 线: 3p → 3s 跃迁在磁场中的分裂
fig, axes = plt.subplots(1, 2, figsize=(14, 8))
B = np.linspace(0, 2, 100)  # 磁场 0-2 T

# 3p 态 (l=1): j=3/2 和 j=1/2
ax = axes[0]
ax.set_title('3p 态的塞曼分裂')
s = 0.5
mu_B = 5.788e-5  # eV/T

for j in [1.5, 0.5]:
    g = lande_g(j, l=1)
    for mj in np.arange(-j, j+1, 1):
        E_offset = 0 if j == 1.5 else -0.002  # 自旋-轨道分裂 (示意)
        E = E_offset + g * mj * mu_B * B
        label = f'j={j}, $m_j$={mj:+.1f}'
        color = 'blue' if j == 1.5 else 'red'
        ax.plot(B, E * 1000, color=color, label=label)  # meV

ax.set_xlabel('磁场 B (T)')
ax.set_ylabel('能量偏移 (meV)')
ax.legend(fontsize=7, ncol=2)
ax.grid(True, alpha=0.3)

# 3s 态 (l=0): 只有 j=1/2
ax = axes[1]
ax.set_title('3s 态的塞曼分裂')
g = lande_g(0.5, l=0)
for mj in [-0.5, 0.5]:
    E = g * mj * mu_B * B
    ax.plot(B, E * 1000, 'green', label=f'j=1/2, $m_j$={mj:+.1f}')

ax.set_xlabel('磁场 B (T)')
ax.set_ylabel('能量偏移 (meV)')
ax.legend(fontsize=9)
ax.grid(True, alpha=0.3)

plt.suptitle('钠 D 线的塞曼效应', fontsize=14)
plt.tight_layout()
plt.savefig('zeeman_effect.png', dpi=150)
plt.show()

# 打印朗德 g 因子
print("朗德 g 因子:")
print(f"  3s (l=0, j=1/2): g = {lande_g(0.5, 0):.3f}")
print(f"  3p (l=1, j=1/2): g = {lande_g(0.5, 1):.3f}")
print(f"  3p (l=1, j=3/2): g = {lande_g(1.5, 1):.3f}")
```

---

## 思考题

1. **[传统]** 计算氢原子 $2p$ 态精细结构分裂后的两个能级 $2p_{1/2}$ 和 $2p_{3/2}$ 对应的朗德 $g$ 因子。
2. **[传统]** 在 1 T 的外磁场中，钠 $D_1$ 线($3p_{1/2} \to 3s_{1/2}$)分裂为几条谱线？写出选择定则 $\Delta m_j = 0, \pm 1$ 并列出所有允许的跃迁。
3. **[思考]** 为什么叫"反常"塞曼效应？历史上哪个效应先被发现？从现代量子力学的角度看，哪个才是"正常"的？
4. **[计算]** 修改上面的代码，绘制氢原子 $n=2$ 能级($2s_{1/2}$, $2p_{1/2}$, $2p_{3/2}$)在外磁场中的完整分裂图。标注所有从 $n=2$ 到 $n=1$ 的允许跃迁。
