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

# 1.1 探测信号注入——卢瑟福散射

> **Algorithm Goal:** 将 $\alpha$ 粒子作为探针输入原子系统，通过散射角度分布反推原子内部电荷拓扑。

---

## Carbon Story：从布丁到行星

### 汤姆逊的"葡萄干布丁"

1897 年汤姆逊发现了电子，原子不再是不可分割的基本单位。但电子带负电、质量极小，原子整体电中性——正电荷去哪了？

汤姆逊提出了一个合理的猜测：正电荷像"布丁"一样均匀分布在整个原子体积中，电子像"葡萄干"一样嵌在里面。这就是**葡萄干布丁模型（Plum Pudding Model）**。

这个模型的预言很明确：如果你用带电粒子去轰击原子，由于正电荷是弥散的，粒子应该只会受到微弱的偏转，不会出现大角度散射。

### 卢瑟福的惊讶

1909 年，盖革和马斯登在卢瑟福的指导下，用 $\alpha$ 粒子轰击金箔。结果：

- 绝大多数 $\alpha$ 粒子直线穿过（符合预期）。
- 少数粒子发生了大角度偏转。
- **极少数粒子被几乎反弹回来**（偏转角 $> 90°$）。

卢瑟福后来说：

> "这就像你用15英寸的炮弹去轰击一张薄纸，炮弹却反弹回来打到了你自己。"

这意味着原子内部存在一个**极小但极重**的核心，集中了全部正电荷和绝大部分质量。这就是**原子核**。

### 卢瑟福散射公式

基于库仑势的经典力学推导，卢瑟福得到了散射截面的微分公式：

$$
\frac{d\sigma}{d\Omega} = \left(\frac{Z_1 Z_2 e^2}{4E}\right)^2 \frac{1}{\sin^4(\theta/2)}
$$

其中：
- $Z_1, Z_2$ 是入射粒子和靶核的电荷数
- $E$ 是入射粒子的动能
- $\theta$ 是散射角

关键特征：$\sin^{-4}(\theta/2)$ 的依赖关系意味着大角度散射事件极为稀少但确实存在——这正是点状原子核的指纹。

---

## Silicon Perspective：系统辨识

从工程角度看，卢瑟福做的事情本质上是**系统辨识（System Identification）**：

```
输入信号 x(t) → [ 未知系统 F ] → 输出信号 y(t)
```

- **输入**：已知能量和方向的 $\alpha$ 粒子束
- **未知系统**：原子内部的电荷-质量分布 $\rho(r)$
- **输出**：散射角度的统计分布 $d\sigma/d\Omega$

不同的内部结构假设（"布丁"均匀分布 vs 点电荷中心），会产生截然不同的散射截面函数。通过对比实验数据和理论预言，可以排除错误假设，锁定正确的系统拓扑。

这与现代机器学习中的**模型选择（Model Selection）**在逻辑上完全同构：给定数据，比较不同模型的拟合优度，选择最佳解释。

---

## AI Workshop：蒙特卡洛模拟卢瑟福散射

下面的代码模拟 $\alpha$ 粒子在库仑势中的经典轨迹，生成散射角度分布。

```{code-cell} ipython3
:tags: [hide-input]

import numpy as np
import matplotlib.pyplot as plt

# 物理常数 (CGS)
Z1, Z2 = 2, 79       # alpha粒子, 金核
e = 4.803e-10         # 基本电荷 (esu)
E_MeV = 5.0           # 入射能量 (MeV)
E = E_MeV * 1.602e-6  # 转换为 erg

# 半程距离参数 (distance of closest approach for head-on collision)
a = Z1 * Z2 * e**2 / (2 * E)

# 瞄准距离 (impact parameter) 与散射角的关系:
# b = (a/2) * cot(theta/2)
def scattering_angle(b):
    """给定瞄准距离b, 返回散射角theta (rad)"""
    return 2 * np.arctan(a / (2 * b))

# 蒙特卡洛: 均匀采样瞄准距离
N = 100000
b_max = 50 * a  # 最大瞄准距离
b = b_max * np.sqrt(np.random.uniform(0, 1, N))  # 面积均匀采样
theta = scattering_angle(b)
theta_deg = np.degrees(theta)

# 绘制散射角分布
fig, axes = plt.subplots(1, 2, figsize=(12, 5))

# 直方图
axes[0].hist(theta_deg, bins=100, range=(0, 180), density=True, alpha=0.7)
axes[0].set_xlabel('散射角 θ (度)')
axes[0].set_ylabel('概率密度')
axes[0].set_title('散射角分布')
axes[0].set_yscale('log')

# 与理论 Rutherford 公式对比
theta_theory = np.linspace(5, 175, 200)
dsigma = (a/2)**2 / (4 * np.sin(np.radians(theta_theory/2))**4)
dsigma_norm = dsigma / dsigma.sum()
axes[1].plot(theta_theory, dsigma_norm, 'r-', label='Rutherford 公式')
axes[1].set_xlabel('散射角 θ (度)')
axes[1].set_ylabel('dσ/dΩ (归一化)')
axes[1].set_title('Rutherford 散射截面')
axes[1].set_yscale('log')
axes[1].legend()

plt.tight_layout()
plt.savefig('rutherford_mc.png', dpi=150)
plt.show()
```

**练习：** 修改上面的代码，将点电荷模型替换为均匀球体电荷分布（汤姆逊模型），比较两种模型的散射角分布有何不同。

---

## 习题

1. **[传统]** 能量为 5 MeV 的 $\alpha$ 粒子轰击金箔（$Z=79$），求正面碰撞时的最近距离。与金原子核的半径（约 $7 \times 10^{-15}$ m）比较。
2. **[计算]** 利用上面的蒙特卡洛代码，统计散射角大于 90° 的 $\alpha$ 粒子比例，并与解析公式的预言值进行比较。
3. **[思考]** 卢瑟福散射实验能否确定原子核的尺寸上限？为什么？
