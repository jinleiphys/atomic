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
import numpy as np
plt.rcParams['font.sans-serif'] = ['Heiti TC', 'Noto Sans CJK SC', 'SimHei', 'DejaVu Sans']
plt.rcParams['axes.unicode_minus'] = False
```

# 1.2 原子的核式结构

## 汤姆孙原子模型

电子被发现后，物理学家们面临一个迫切的问题：电子在原子中是如何分布的？原子整体是电中性的，电子带负电，因此原子中必定还存在正电荷。但正电荷是什么形态？它与电子是如何组合在一起的？

发现电子的汤姆孙在1904年提出了第一个具体的原子模型。他设想正电荷像一团"布丁"一样均匀分布在整个原子体积内，电子则像"葡萄干"一样嵌在这团正电荷中。这个模型因此被形象地称为"葡萄干布丁模型"（plum pudding model）。在这个模型中，电子被正电荷的电场束缚在原子内部，当电子偏离平衡位置时，会受到一个指向平衡位置的恢复力，从而可以在平衡位置附近振动。汤姆孙希望用这种振动来解释原子发射光谱的频率。

汤姆孙模型有一个明确的实验预言：如果用带电粒子去轰击原子，由于正电荷是均匀弥散在整个原子体积内的，入射粒子受到的电场力会比较弱且分散，因此只会发生小角度的偏转。具体地说，如果入射粒子穿过单层原子，平均偏转角不会超过一度左右。即使穿过很厚的靶材（包含成千上万层原子），由于各次散射的方向是随机的，累积效应也不会太大。根据统计规律，穿过 $n$ 层原子后的平均偏转角与 $\sqrt{n}$ 成正比，要想观察到大角度散射（比如90度以上）几乎是不可能的。

## 盖革-马斯顿实验

1909年，在曼彻斯特大学工作的汉斯·盖革（Hans Geiger）和欧内斯特·马斯顿（Ernest Marsden）在卢瑟福的指导下，进行了一项检验汤姆孙模型的实验。他们用放射性元素镭发射的α粒子轰击金箔，并用荧光屏探测散射后α粒子的方向。α粒子是氦原子核，带两个正电荷单位，质量约为电子质量的7300倍。选择α粒子作为探针有几个优点：它的质量比电子大得多，不容易被原子中的电子偏转；它的能量较高（约5 MeV），可以穿透较厚的靶材；它带正电，会与原子中的正电荷发生库仑排斥。

实验装置的原理并不复杂：α粒子源放置在一个小盒子里，通过一个小孔射出一束准直的α粒子，射向金箔靶。金箔很薄，只有约400纳米厚，相当于大约1000层金原子。在金箔周围布置荧光屏，当α粒子打到荧光屏上时会产生闪光，研究者用显微镜观察并计数不同方向上的闪光数目。这是一项艰苦的工作，观察者必须在黑暗中待很长时间让眼睛适应，然后连续几个小时盯着显微镜计数。

实验结果大部分符合预期：绝大多数α粒子只发生了很小的偏转，几乎沿直线穿过金箔。但出乎意料的是，有极少数α粒子发生了大角度偏转，其中有大约八千分之一的α粒子偏转角超过了90度，甚至有些被几乎原路反弹回来。卢瑟福后来回忆说："这是我一生中最不可思议的事情。这就好像你用一枚15英寸的炮弹去轰击一张薄纸，结果炮弹竟然反弹回来打中了你自己。这简直不可能，除非......"

除非原子内部的正电荷不是均匀分布的，而是集中在一个极小的区域内。只有这样，入射的α粒子才有可能在近距离遭遇强大的库仑排斥力，被大角度偏转甚至反弹回去。经过两年多的思考和计算，卢瑟福在1911年正式提出了原子的核式结构模型：原子的全部正电荷和绝大部分质量都集中在一个极小的核心区域，这个核心被称为原子核；电子则在原子核外很大的空间范围内运动。原子核的半径约为 $10^{-15}$ 米，而整个原子的半径约为 $10^{-10}$ 米，两者相差约十万倍。如果把原子放大到一个足球场那么大，原子核大约只有一颗豌豆的大小。原子内部几乎是空的。

## 卢瑟福散射公式的推导

卢瑟福不仅提出了定性的模型，还给出了精确的定量预言。他假设原子核可以看作一个静止的点电荷（这是合理的，因为原子核的质量比α粒子大得多），α粒子在原子核的库仑场中做经典力学轨道运动。这个问题在数学上与行星绕太阳的运动完全类似，只是万有引力换成了库仑斥力。

让我们详细推导卢瑟福散射公式。设入射α粒子的电荷为 $Z_1 e$（对于α粒子，$Z_1 = 2$），靶核的电荷为 $Z_2 e$（对于金核，$Z_2 = 79$），α粒子的初始动能为 $E$，初始速度为 $v_0$。α粒子在距离原子核很远时沿一条直线运动，这条直线到原子核的垂直距离称为瞄准距离或碰撞参数，记作 $b$。

在库仑斥力场中，粒子的轨迹是一条双曲线。运用守恒定律可以直接求出散射角与瞄准距离的关系。设散射角为 $\theta$，即入射方向与出射方向之间的夹角。根据角动量守恒，在无穷远处和最近距离 $r_{\min}$ 处分别有

$$
L = m v_0 b = m v_{\max} r_{\min}
$$

根据能量守恒，在无穷远处和最近距离处分别有

$$
\frac{1}{2}m v_0^2 = \frac{1}{2}m v_{\max}^2 + \frac{Z_1 Z_2 e^2}{4\pi\varepsilon_0 r_{\min}}
$$

对于正面碰撞（$b = 0$），α粒子会在某个最近距离 $r_0$ 处停下来然后原路返回。此时全部动能转化为势能：

$$
E = \frac{1}{2}m v_0^2 = \frac{Z_1 Z_2 e^2}{4\pi\varepsilon_0 r_0}
$$

由此得到

$$
r_0 = \frac{Z_1 Z_2 e^2}{4\pi\varepsilon_0 E}
$$

这个距离 $r_0$ 称为"最近距离"或"碰撞直径"，它是卢瑟福散射问题的特征长度。

通过详细的轨道力学计算（这里省略推导过程，有兴趣的读者可以参考力学教材中的开普勒问题），可以得到散射角与瞄准距离的关系：

$$
b = \frac{r_0}{2} \cot\frac{\theta}{2}
$$

或者反过来写

$$
\tan\frac{\theta}{2} = \frac{r_0}{2b}
$$

这个公式的物理意义很清楚：瞄准距离 $b$ 越小，α粒子越靠近原子核，受到的库仑力越强，散射角 $\theta$ 越大。当 $b \to 0$（正面碰撞）时，$\theta \to 180°$（原路返回）；当 $b \to \infty$ 时，$\theta \to 0$（不偏转）。

实验中测量的不是单个粒子的散射角，而是大量粒子的统计分布。设入射粒子束的强度（单位时间、单位面积的粒子数）为 $I_0$，瞄准距离在 $b$ 到 $b + db$ 之间的粒子会被散射到 $\theta$ 到 $\theta + d\theta$ 的角度范围内。由于轴对称性，这些粒子打到距离靶核 $R$ 的探测器上，会分布在一个环形区域内。

定义微分散射截面 $d\sigma/d\Omega$ 为散射到单位立体角内的有效面积。经过计算可得卢瑟福散射公式：

$$
\frac{d\sigma}{d\Omega} = \left(\frac{Z_1 Z_2 e^2}{16\pi\varepsilon_0 E}\right)^2 \frac{1}{\sin^4(\theta/2)} = \left(\frac{r_0}{4}\right)^2 \frac{1}{\sin^4(\theta/2)}
$$

这个公式有几个重要特征。首先，散射截面与 $\sin^{-4}(\theta/2)$ 成正比，这意味着小角度散射的概率远大于大角度散射。当 $\theta \to 0$ 时，$d\sigma/d\Omega \to \infty$，这反映了库仑力是长程力，即使很远的粒子也会发生微小偏转。当 $\theta \to 180°$ 时，$d\sigma/d\Omega$ 达到最小值但不为零，这对应于正面碰撞的情况。其次，散射截面与入射能量的平方成反比，能量越高的粒子越不容易被偏转。第三，散射截面与靶核电荷数的平方成正比，这可以用来测定未知元素的核电荷数。

## 实验验证与原子序数的确定

盖革和马斯顿对卢瑟福公式进行了系统的实验验证。他们测量了散射角分布、入射能量依赖性和靶材依赖性，所有结果都与卢瑟福公式的预言符合得很好。

对散射角分布的验证最为关键。根据卢瑟福公式，散射到角度 $\theta$ 方向的粒子数应该与 $\sin^{-4}(\theta/2)$ 成正比。盖革和马斯顿测量了从15度到150度范围内的散射粒子数，发现在这个范围内，粒子数的变化超过了四个数量级，但都精确地落在 $\sin^{-4}(\theta/2)$ 曲线上。这是对卢瑟福公式的有力验证。

对入射能量的依赖性也得到了验证。使用不同能量的α粒子（来自不同的放射性同位素），发现散射截面确实与能量的平方成反比。

更有趣的是对靶材的依赖性。卢瑟福公式预言散射截面与靶核电荷数 $Z_2$ 的平方成正比。通过比较不同金属箔的散射结果，可以推断出各种元素的核电荷数。这些实验结果与后来莫塞莱通过X射线特征谱确定的原子序数完全一致，从而证明了原子序数就等于核电荷数。这一发现具有重大意义：它说明元素周期表的排列顺序不是按照原子量（这在当时已知有几处例外），而是按照核电荷数。

## 原子核大小的估计

卢瑟福散射公式是建立在"原子核可以看作点电荷"这一假设上的。如果α粒子进入原子核内部，这个假设就不再成立，散射行为会偏离卢瑟福公式。因此，通过观察卢瑟福公式在多高能量下失效，可以估计原子核的大小。

考虑正面碰撞的情况。α粒子会在最近距离 $r_0 = Z_1 Z_2 e^2 / (4\pi\varepsilon_0 E)$ 处停下来。如果这个距离大于原子核半径 $R$，α粒子始终在原子核外运动，卢瑟福公式成立。如果 $r_0 < R$，α粒子会进入原子核内部，散射行为会发生变化。

对于5 MeV的α粒子轰击金核（$Z_1 = 2$，$Z_2 = 79$），正面碰撞的最近距离约为 $4.5 \times 10^{-14}$ 米。实验观察到卢瑟福公式在这个能量下仍然成立，说明金原子核的半径小于这个值。通过使用更高能量的α粒子，可以进一步缩小这个上限。

现代实验表明，原子核的半径大约可以用经验公式 $R \approx r_0 A^{1/3}$ 表示，其中 $A$ 是质量数，$r_0 \approx 1.2 \times 10^{-15}$ 米。对于金核（$A = 197$），半径约为 $7 \times 10^{-15}$ 米。这个尺度比原子半径（约 $10^{-10}$ 米）小了约五个数量级，证实了原子内部确实几乎是空的。

## 硅基视角：系统辨识与模型选择

从系统工程的角度看，卢瑟福的工作是一个经典的"系统辨识"（System Identification）问题。原子是一个黑箱系统，我们无法直接观察其内部结构，但可以通过输入-输出关系来推断。

输入信号是一束已知能量和方向的α粒子。这个信号的特点是：能量可控，方向可控，强度可控。输出信号是散射后α粒子的角度分布，可以通过探测器精确测量。未知的系统是原子内部的电荷-质量分布，我们要从输入输出关系反推这个分布。

不同的内部结构假设会给出不同的输出预言。汤姆孙模型（均匀分布的正电荷）预言只有小角度散射，大角度散射的概率极低。卢瑟福模型（点状原子核）预言会有 $\sin^{-4}(\theta/2)$ 的角度分布，大角度散射虽然稀少但确实存在。实验结果明确支持卢瑟福模型。

这与现代机器学习中的"模型选择"（Model Selection）问题在逻辑上完全同构。给定训练数据，我们有多个候选模型，需要选择最能解释数据的那个。评判标准通常包括：拟合优度（模型预言与实验数据的吻合程度）和模型复杂度（奥卡姆剃刀原则倾向于选择简单的模型）。卢瑟福模型不仅更好地拟合了数据，而且在某种意义上更简单——它假设正电荷集中在一点，比假设正电荷均匀分布更容易处理。

让我们用蒙特卡洛模拟来直观地展示卢瑟福散射的特征。

```{code-cell} ipython3
:tags: [hide-input]

import numpy as np
import matplotlib.pyplot as plt

# 物理常数 (SI)
e = 1.602e-19       # C
epsilon_0 = 8.854e-12
Z1, Z2 = 2, 79      # α粒子和金核的电荷数
E_MeV = 5.0         # 入射能量 (MeV)
E = E_MeV * 1e6 * e  # 转换为焦耳

# 正面碰撞的最近距离 (碰撞直径)
r0 = Z1 * Z2 * e**2 / (4 * np.pi * epsilon_0 * E)
print(f"碰撞直径 r₀ = {r0*1e15:.2f} fm")

# 瞄准距离与散射角的关系: b = (r0/2) * cot(θ/2)
# 反过来: θ = 2 * arctan(r0 / (2b))
def scattering_angle(b):
    """给定瞄准距离 b，返回散射角 θ (弧度)"""
    return 2 * np.arctan(r0 / (2 * b + 1e-20))  # 加小量避免除零

# 蒙特卡洛模拟
N = 200000  # 粒子数
b_max = 100 * r0  # 最大瞄准距离

# 在圆形区域内均匀采样：b 的概率密度正比于 b
# 使用逆变换采样：b = b_max * sqrt(u)，其中 u ~ Uniform(0,1)
u = np.random.uniform(0, 1, N)
b = b_max * np.sqrt(u)

# 计算散射角
theta = scattering_angle(b)
theta_deg = np.degrees(theta)

# 绘图
fig, axes = plt.subplots(2, 2, figsize=(12, 10))

# (1) 散射角分布直方图
ax1 = axes[0, 0]
bins = np.linspace(0, 180, 91)
counts, bin_edges, _ = ax1.hist(theta_deg, bins=bins, density=True, alpha=0.7,
                                 edgecolor='black', label='蒙特卡洛模拟')
ax1.set_xlabel('散射角 θ (度)')
ax1.set_ylabel('概率密度')
ax1.set_title('散射角分布')
ax1.set_yscale('log')
ax1.set_ylim(1e-6, 1)
ax1.legend()

# (2) 与卢瑟福公式对比
ax2 = axes[0, 1]
theta_theory = np.linspace(5, 175, 200)
theta_rad = np.radians(theta_theory)
# 微分截面 dσ/dΩ ∝ 1/sin⁴(θ/2)
dsigma = 1 / np.sin(theta_rad/2)**4
# 归一化
dsigma_norm = dsigma / np.trapz(dsigma * np.sin(theta_rad), theta_rad)

ax2.plot(theta_theory, dsigma_norm, 'r-', linewidth=2, label='卢瑟福公式')
ax2.set_xlabel('散射角 θ (度)')
ax2.set_ylabel('dσ/dΩ (归一化)')
ax2.set_title('卢瑟福散射截面')
ax2.set_yscale('log')
ax2.legend()
ax2.grid(True, alpha=0.3)

# (3) 统计大角度散射比例
ax3 = axes[1, 0]
angles = [30, 60, 90, 120, 150]
fractions = [np.sum(theta_deg > a) / N for a in angles]

# 理论值：积分 sin⁻⁴(θ/2) * sinθ dθ 从 θ 到 π
# 解析结果：对于散射角 > θ₀ 的比例 ∝ cot²(θ₀/2)
fractions_theory = [1 / np.tan(np.radians(a/2))**2 / (b_max/r0)**2 for a in angles]

x = range(len(angles))
width = 0.35
ax3.bar([i - width/2 for i in x], fractions, width, label='模拟', alpha=0.7)
ax3.bar([i + width/2 for i in x], fractions_theory, width, label='理论', alpha=0.7)
ax3.set_xticks(x)
ax3.set_xticklabels([f'>{a}°' for a in angles])
ax3.set_ylabel('比例')
ax3.set_title('大角度散射的比例')
ax3.legend()
ax3.set_yscale('log')

# (4) 粒子轨迹可视化
ax4 = axes[1, 1]

# 绘制几条典型轨迹
impact_params = [0.5*r0, 1*r0, 2*r0, 5*r0, 10*r0]
colors = plt.cm.viridis(np.linspace(0, 0.8, len(impact_params)))

for b_val, color in zip(impact_params, colors):
    # 双曲线轨迹参数
    theta_scatter = scattering_angle(b_val)

    # 双曲线的几何参数
    # 对于库仑散射：r = a(ε² - 1) / (1 + ε cos φ)
    # 其中 a = r0/2，ε = 1/sin(θ/2)
    a = r0 / 2
    epsilon = 1 / np.sin(theta_scatter / 2)

    # 参数化角度 φ
    phi_max = np.pi - theta_scatter/2
    phi = np.linspace(-phi_max + 0.1, phi_max - 0.1, 500)

    r = a * (epsilon**2 - 1) / (1 + epsilon * np.cos(phi))

    # 转换为直角坐标 (旋转使入射方向沿 x 轴)
    x_traj = r * np.cos(phi)
    y_traj = r * np.sin(phi)

    ax4.plot(x_traj / r0, y_traj / r0, color=color,
             label=f'b = {b_val/r0:.1f}r₀, θ = {np.degrees(theta_scatter):.1f}°')

# 标记原子核位置
ax4.plot(0, 0, 'ko', markersize=10, label='原子核')
ax4.set_xlabel('x / r₀')
ax4.set_ylabel('y / r₀')
ax4.set_title('α粒子轨迹 (库仑散射)')
ax4.set_xlim(-20, 20)
ax4.set_ylim(-15, 15)
ax4.set_aspect('equal')
ax4.legend(fontsize=8)
ax4.grid(True, alpha=0.3)

plt.tight_layout()
plt.show()

# 打印一些统计信息
print(f"\n蒙特卡洛模拟统计 (N = {N} 个粒子):")
print(f"散射角 > 90° 的比例: {np.sum(theta_deg > 90) / N:.2e}")
print(f"散射角 > 150° 的比例: {np.sum(theta_deg > 150) / N:.2e}")
print(f"\n理论预期（对于 b_max = {b_max/r0:.0f}r₀）:")
print(f"散射角 > 90° 的比例: {1 / (b_max/r0)**2:.2e}")
```

这段代码展示了卢瑟福散射的几个关键特征。左上图是散射角的分布直方图，可以看到绝大多数粒子只发生小角度偏转，大角度散射非常稀少。右上图是卢瑟福公式预言的微分截面，呈现出 $\sin^{-4}(\theta/2)$ 的特征。左下图比较了不同角度阈值下大角度散射的比例，模拟结果与理论预言吻合得很好。右下图可视化了不同瞄准距离对应的粒子轨迹，可以直观地看到瞄准距离如何影响散射角。

## 汤姆孙模型与卢瑟福模型的对比模拟

为了更清楚地看出两种模型的区别，让我们模拟一下如果汤姆孙模型是正确的，散射结果会是什么样子。

```{code-cell} ipython3
:tags: [hide-input]

import numpy as np
import matplotlib.pyplot as plt

def thomson_model_scattering(N, R_atom, Z, E, m_alpha):
    """
    模拟汤姆孙模型（均匀分布的正电荷球）中的散射

    在均匀带电球内部，电场强度 E(r) = (Ze/4πε₀) * (r/R³)
    穿过球体的粒子受到的平均偏转力较弱
    """
    e = 1.602e-19
    epsilon_0 = 8.854e-12

    # 均匀采样瞄准距离
    b_max = R_atom
    u = np.random.uniform(0, 1, N)
    b = b_max * np.sqrt(u)

    # 对于穿过均匀带电球的粒子，偏转角近似为
    # θ ≈ (Ze² / 4πε₀) * (1/E) * (2/R) * (1 - b²/R²)^(1/2)
    # 这里使用简化的估计
    v0 = np.sqrt(2 * E / m_alpha)

    # 粒子穿过球体的弦长
    chord = 2 * np.sqrt(R_atom**2 - b**2 + 1e-30)

    # 平均受力（近似）
    r_avg = np.sqrt(b**2 + (chord/4)**2)
    F_avg = Z * e**2 / (4 * np.pi * epsilon_0 * R_atom**3) * r_avg

    # 偏转角估计（小角近似）
    delta_p = F_avg * chord / v0
    theta = delta_p / (m_alpha * v0)

    # 限制最大角度
    theta = np.clip(theta, 0, np.pi)

    return np.degrees(theta)

# 参数
N = 100000
R_atom = 1e-10  # 原子半径
Z = 79  # 金
E_MeV = 5.0
E = E_MeV * 1e6 * 1.602e-19
m_alpha = 4 * 1.66e-27  # α粒子质量

# 计算汤姆孙模型的散射
theta_thomson = thomson_model_scattering(N, R_atom, Z, E, m_alpha)

# 与卢瑟福模型对比
e = 1.602e-19
epsilon_0 = 8.854e-12
r0 = 2 * Z * e**2 / (4 * np.pi * epsilon_0 * E)
b_max_rutherford = 100 * r0
u = np.random.uniform(0, 1, N)
b_rutherford = b_max_rutherford * np.sqrt(u)
theta_rutherford = np.degrees(2 * np.arctan(r0 / (2 * b_rutherford + 1e-30)))

# 绘图对比
fig, axes = plt.subplots(1, 2, figsize=(12, 5))

# 线性坐标
ax1 = axes[0]
bins = np.linspace(0, 20, 41)
ax1.hist(theta_thomson, bins=bins, density=True, alpha=0.7,
         label='汤姆孙模型', edgecolor='black')
ax1.hist(theta_rutherford[theta_rutherford < 20], bins=bins, density=True, alpha=0.7,
         label='卢瑟福模型', edgecolor='black')
ax1.set_xlabel('散射角 θ (度)')
ax1.set_ylabel('概率密度')
ax1.set_title('小角度区域对比')
ax1.legend()

# 对数坐标看大角度
ax2 = axes[1]
bins = np.linspace(0, 180, 37)
ax2.hist(theta_thomson, bins=bins, density=True, alpha=0.7,
         label='汤姆孙模型', edgecolor='black')
ax2.hist(theta_rutherford, bins=bins, density=True, alpha=0.7,
         label='卢瑟福模型', edgecolor='black')
ax2.set_xlabel('散射角 θ (度)')
ax2.set_ylabel('概率密度')
ax2.set_title('全角度范围对比 (对数坐标)')
ax2.set_yscale('log')
ax2.set_ylim(1e-8, 1)
ax2.legend()

plt.tight_layout()
plt.show()

# 统计对比
print("大角度散射比例对比:")
print(f"汤姆孙模型: θ > 10° 的比例 = {np.sum(theta_thomson > 10) / N:.2e}")
print(f"卢瑟福模型: θ > 10° 的比例 = {np.sum(theta_rutherford > 10) / N:.2e}")
print(f"\n汤姆孙模型: θ > 90° 的比例 = {np.sum(theta_thomson > 90) / N:.2e}")
print(f"卢瑟福模型: θ > 90° 的比例 = {np.sum(theta_rutherford > 90) / N:.2e}")
```

这个对比清楚地展示了两种模型的本质区别。在汤姆孙模型中，由于正电荷均匀分布在整个原子体积内，穿过原子的粒子只受到较弱的平均力，因此只会发生很小的偏转，大角度散射几乎不可能发生。而在卢瑟福模型中，由于正电荷集中在一个点状的原子核上，靠近原子核的粒子会受到极强的库仑力，可以发生大角度甚至180度的散射。盖革和马斯顿观察到的大角度散射事件，正是支持卢瑟福模型、否定汤姆孙模型的关键证据。

## 本节小结

本节我们详细讨论了卢瑟福对原子结构的探索。汤姆孙提出的"葡萄干布丁"模型假设正电荷均匀分布在原子中，但这个模型无法解释盖革和马斯顿观察到的大角度α粒子散射。卢瑟福提出了原子的核式结构模型：正电荷和绝大部分质量集中在一个极小的原子核中，电子在核外运动。

卢瑟福不仅提出了定性模型，还推导出了精确的散射公式。这个公式预言散射截面与 $\sin^{-4}(\theta/2)$ 成正比，与实验结果完美吻合。通过分析卢瑟福公式的适用范围，还可以估计原子核的大小。

从方法论的角度看，卢瑟福的工作展示了如何通过精心设计的实验来探测不可见的微观结构。输入已知的探测信号，分析输出的响应，然后用物理模型来解释输入输出关系，这是原子物理学乃至整个微观物理学的基本研究范式。

## 思考题

1. 卢瑟福散射公式是基于经典力学推导的。当α粒子能量足够高，能够"触及"原子核表面时，会发生什么？这如何帮助我们测量原子核的大小？

2. 为什么卢瑟福用α粒子而不是电子来探测原子结构？如果用电子会有什么不同？(提示：考虑质量比和散射角的关系。)

3. 汤姆孙的"葡萄干布丁"模型预言大角度散射的概率极小，但卢瑟福实验观测到了。这个"意外"说明了什么科学方法论问题？预期之外的实验结果往往更有价值吗？

4. 卢瑟福模型解释了大角度散射，但它本身也有致命缺陷(电子绕核运动会辐射能量而坍缩)。为什么物理学家仍然接受了这个"有问题"的模型？
