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

# 1.3 行星模型的困难

## 一个看似完美的图景

卢瑟福散射实验确立了原子的核式结构：一个极小但极重的原子核占据中心，带有全部正电荷和绝大部分质量，电子在核外广阔的空间中运动。这个图景与太阳系惊人地相似——原子核如同太阳，电子如同行星，库仑引力取代万有引力将系统束缚在一起。因此，这个模型常被称为"行星模型"或"太阳系模型"。

让我们来检验一下这个类比是否成立。在太阳系中，行星绑太阳运动的动力学方程是

$$
\frac{GMm}{r^2} = \frac{mv^2}{r}
$$

其中 $M$ 是太阳质量，$m$ 是行星质量，$r$ 是轨道半径，$v$ 是轨道速度。在原子中，电子绑原子核运动的方程类似：

$$
\frac{Ze^2}{4\pi\varepsilon_0 r^2} = \frac{m_e v^2}{r}
$$

其中 $Z$ 是原子核电荷数，$e$ 是电子电荷，$m_e$ 是电子质量。两个方程在数学形式上完全相同，都是平方反比的向心力。根据牛顿力学，这样的系统应该有稳定的圆轨道（或更一般的椭圆轨道）解。行星可以绑太阳运动亿万年而不坠落，电子似乎也应该能够稳定地绑原子核运动。

从能量的角度看，电子在轨道上的总能量是动能与势能之和：

$$
E = \frac{1}{2}m_e v^2 - \frac{Ze^2}{4\pi\varepsilon_0 r}
$$

利用轨道条件，可以得到

$$
E = -\frac{Ze^2}{8\pi\varepsilon_0 r}
$$

总能量为负值，表明电子被束缚在原子核附近。轨道半径越小，能量越低（绝对值越大），这与行星系统的情况完全一致。

一切看起来都很完美。然而，这个美丽的图景隐藏着一个致命的缺陷。

## 经典电磁学的判决

行星与电子有一个关键的区别：行星是电中性的，而电子带电。根据麦克斯韦电磁理论，做加速运动的带电粒子必然向外辐射电磁波。绕核做圆周运动的电子具有指向圆心的向心加速度，因此它必须不断地向外辐射能量。

辐射功率由拉莫尔公式给出：

$$
P = \frac{e^2 a^2}{6\pi\varepsilon_0 c^3}
$$

其中 $a$ 是加速度，$c$ 是光速。对于氢原子（$Z = 1$）中处于玻尔半径 $a_0 = 5.29 \times 10^{-11}$ 米轨道上的电子，向心加速度为

$$
a = \frac{v^2}{r} = \frac{e^2}{4\pi\varepsilon_0 m_e r^2} \approx 9 \times 10^{22} \text{ m/s}^2
$$

这是一个惊人的数字，比地球表面重力加速度大了约 $10^{22}$ 倍。代入拉莫尔公式，辐射功率约为

$$
P \approx 4.6 \times 10^{-8} \text{ W}
$$

虽然这个功率看起来很小，但对于一个原子来说却是灾难性的。电子在基态轨道上的总能量约为 $-13.6$ eV $\approx 2.2 \times 10^{-18}$ J。以 $4.6 \times 10^{-8}$ W 的速率损失能量，电子将在极短的时间内耗尽全部能量。

让我们更仔细地分析这个坍缩过程。当电子辐射能量时，它的总能量变得更负，这意味着它必须落到更小的轨道上。但轨道越小，加速度越大，辐射功率越强，能量损失越快。这是一个正反馈过程：辐射导致轨道缩小，轨道缩小导致更强的辐射，形成恶性循环。电子将以越来越快的速度螺旋坠入原子核。

通过求解能量损失方程，可以估算坍缩所需的时间。设电子在半径为 $r$ 的轨道上，其能量为 $E = -e^2/(8\pi\varepsilon_0 r)$。能量对时间的变化率等于负的辐射功率：

$$
\frac{dE}{dt} = -P = -\frac{e^2 a^2}{6\pi\varepsilon_0 c^3}
$$

将加速度用半径表示，$a = e^2/(4\pi\varepsilon_0 m_e r^2)$，经过计算可以得到

$$
\frac{dr}{dt} = -\frac{e^4}{12\pi^2\varepsilon_0^2 m_e^2 c^3 r^2}
$$

这是一个可分离变量的微分方程，积分后得到

$$
r^3 - r_0^3 = -\frac{e^4 t}{4\pi^2\varepsilon_0^2 m_e^2 c^3}
$$

当 $r \to 0$ 时，坍缩时间为

$$
\tau = \frac{4\pi^2\varepsilon_0^2 m_e^2 c^3 r_0^3}{e^4}
$$

将玻尔半径 $r_0 = a_0$ 代入，得到

$$
\tau \approx 1.6 \times 10^{-11} \text{ s}
$$

也就是说，根据经典电磁理论，氢原子中的电子将在约 16 皮秒内坍缩到原子核上。这比我们日常经验中的任何时间尺度都要短得多。如果这是真的，原子将是极不稳定的，物质根本不可能存在。你现在坐的椅子、呼吸的空气、组成你身体的每一个原子，都应该在万亿分之一秒内坍缩成一团高密度物质。

但事实并非如此。原子是稳定的。物质存在了138亿年，还将继续存在下去。

## 光谱的困惑

经典理论的困难不仅体现在稳定性问题上，还体现在原子光谱上。

根据上面的分析，螺旋坠落的电子会持续辐射电磁波。随着轨道半径不断缩小，电子的圆周运动频率不断增大，辐射出的电磁波频率也应该连续变化。如果用棱镜或光栅分析这种辐射，应该看到一个连续的光谱，就像白炽灯泡发出的光一样。

然而，实验事实完全不同。当氢气被加热或放电激发时，它发出的光不是连续谱，而是一系列离散的亮线，称为线光谱。每条谱线对应一个确定的波长（或频率），彼此之间有明确的间隔。1885年，瑞士数学教师巴尔末发现，氢原子可见光区的四条谱线的波长可以用一个简单的公式表示：

$$
\frac{1}{\lambda} = R_H \left(\frac{1}{2^2} - \frac{1}{n^2}\right), \quad n = 3, 4, 5, 6
$$

其中 $R_H = 1.097 \times 10^7$ m$^{-1}$ 是里德伯常数。后来人们发现，氢原子的全部谱线都可以用更一般的公式描述：

$$
\frac{1}{\lambda} = R_H \left(\frac{1}{n_1^2} - \frac{1}{n_2^2}\right), \quad n_2 > n_1 = 1, 2, 3, \ldots
$$

这个公式的规律性令人惊叹。它表明，原子辐射的频率不是任意的，而是由两个整数的组合决定的。但是，从经典物理的角度完全无法理解为什么会出现这种离散性。在经典图景中，电子可以处于任意半径的轨道上，对应于连续变化的能量和辐射频率。整数从何而来？离散性从何而来？

这个问题困扰了物理学家们很多年，直到玻尔提出他的量子化假设才得到解答。这将是下一章的主题。

## 硅基视角：系统稳定性分析

从系统工程的角度看，行星模型的问题可以精确地表述为一个稳定性分析问题。我们有一个动力系统（电子绑原子核运动），需要判断它的平衡态是否稳定。

在控制理论中，判断系统稳定性的基本方法是分析系统的能量耗散。一个孤立系统如果没有能量耗散，可以保持在任意能量状态（边界稳定）。如果有能量耗散到环境中，系统会趋向于最低能量状态（渐近稳定）。关键问题是：最低能量状态是什么？

对于经典的行星模型原子，电子可以通过电磁辐射向环境耗散能量。能量越低对应轨道半径越小，而轨道半径可以无限趋近于零。因此，"最低能量状态"应该是 $r = 0$，即电子坍缩到原子核上。这意味着任何有限半径的轨道都不是稳定的平衡态，系统必然会演化到 $r = 0$ 的状态。

用更正式的语言说，经典原子是一个开放的耗散系统（通过电磁辐射与环境交换能量），它的相空间没有吸引子（除了 $r = 0$ 这个奇点），因此没有稳定的周期轨道。

这个分析揭示了问题的本质：经典物理允许能量和轨道半径连续变化，不存在一个"最低能级"来阻止电子无限接近原子核。要解决这个问题，必须引入某种机制来禁止电子处于某些状态，从而定义一个有限的最低能量——这正是量子化假设的核心思想。

让我们用数值模拟来直观地展示电子的螺旋坠落过程。

```{code-cell} ipython3
:tags: [hide-input]

import numpy as np
import matplotlib.pyplot as plt

# 物理常数 (SI)
e = 1.602e-19       # C
m_e = 9.109e-31     # kg
c = 3e8             # m/s
epsilon_0 = 8.854e-12
a0 = 5.29e-11       # 玻尔半径 (m)

def spiral_collapse():
    """
    模拟经典电子的螺旋坠落

    基于能量损失率方程:
    dr/dt = -e⁴ / (12π²ε₀²m_e²c³r²)
    """
    r = a0          # 初始半径 = 玻尔半径
    dt = 1e-14      # 时间步长 (s)
    t = 0

    # 预计算常数
    coeff = e**4 / (12 * np.pi**2 * epsilon_0**2 * m_e**2 * c**3)

    radii = [r]
    times = [t]
    powers = []  # 辐射功率
    frequencies = []  # 辐射频率

    while r > 1e-14 and t < 2e-11:
        # 向心加速度
        a = e**2 / (4 * np.pi * epsilon_0 * m_e * r**2)

        # 拉莫尔辐射功率
        P = e**2 * a**2 / (6 * np.pi * epsilon_0 * c**3)
        powers.append(P)

        # 轨道频率
        v = np.sqrt(e**2 / (4 * np.pi * epsilon_0 * m_e * r))
        f = v / (2 * np.pi * r)
        frequencies.append(f)

        # 半径变化率
        dr_dt = -coeff / r**2
        dr = dr_dt * dt
        r += dr
        t += dt

        if r > 0:
            radii.append(r)
            times.append(t)

    return np.array(times), np.array(radii), np.array(powers), np.array(frequencies)

times, radii, powers, frequencies = spiral_collapse()

# 绘图
fig, axes = plt.subplots(2, 2, figsize=(12, 10))

# (1) 轨道半径随时间变化
ax1 = axes[0, 0]
ax1.plot(times * 1e12, radii / a0, 'b-', linewidth=2)
ax1.set_xlabel('时间 (ps)')
ax1.set_ylabel('轨道半径 / 玻尔半径')
ax1.set_title('电子的螺旋坠落')
ax1.axhline(y=0, color='r', linestyle='--', alpha=0.5, label='原子核')
ax1.set_xlim(0, 20)
ax1.legend()
ax1.grid(True, alpha=0.3)

# (2) 辐射功率随时间变化
ax2 = axes[0, 1]
ax2.plot(times[:-1] * 1e12, powers * 1e9, 'r-', linewidth=2)
ax2.set_xlabel('时间 (ps)')
ax2.set_ylabel('辐射功率 (nW)')
ax2.set_title('辐射功率的演化')
ax2.set_yscale('log')
ax2.grid(True, alpha=0.3)

# (3) 辐射频率随时间变化
ax3 = axes[1, 0]
ax3.plot(times[:-1] * 1e12, frequencies / 1e15, 'g-', linewidth=2)
ax3.set_xlabel('时间 (ps)')
ax3.set_ylabel('辐射频率 (PHz)')
ax3.set_title('辐射频率的演化')
ax3.set_yscale('log')
ax3.grid(True, alpha=0.3)

# (4) 螺旋轨迹可视化（相空间）
ax4 = axes[1, 1]
# 只取前半段数据以便于可视化
n_points = min(len(times), 2000)
theta = np.cumsum(np.ones(n_points) * 0.1)  # 假设相位均匀增长
r_vis = radii[:n_points]
x = r_vis * np.cos(theta)
y = r_vis * np.sin(theta)
ax4.plot(x / a0, y / a0, 'b-', linewidth=0.5, alpha=0.7)
ax4.plot(0, 0, 'ro', markersize=8, label='原子核')
ax4.set_xlabel('x / 玻尔半径')
ax4.set_ylabel('y / 玻尔半径')
ax4.set_title('螺旋坠落轨迹示意')
ax4.set_aspect('equal')
ax4.legend()
ax4.grid(True, alpha=0.3)

plt.tight_layout()
plt.show()

# 输出关键数据
collapse_time = times[-1]
print(f"计算的坍缩时间: τ ≈ {collapse_time*1e12:.2f} ps = {collapse_time*1e11:.2f} × 10⁻¹¹ s")

# 理论值
tau_theory = 4 * np.pi**2 * epsilon_0**2 * m_e**2 * c**3 * a0**3 / e**4
print(f"理论坍缩时间:  τ = {tau_theory*1e12:.2f} ps = {tau_theory*1e11:.2f} × 10⁻¹¹ s")
```

从图中可以清楚地看到：轨道半径随时间快速减小，辐射功率不断增强（因为加速度增大），辐射频率也不断增加（因为轨道周期缩短）。整个坍缩过程只需要约 16 皮秒。这与原子的实际稳定性形成了鲜明的矛盾。

## 辐射频谱的模拟

让我们进一步模拟一下，如果经典理论是正确的，原子发出的光谱应该是什么样子。

```{code-cell} ipython3
:tags: [hide-input]

import numpy as np
import matplotlib.pyplot as plt

# 使用前面计算的频率数据
# 绘制"经典光谱"——一个连续谱
fig, axes = plt.subplots(1, 2, figsize=(12, 5))

# (1) 经典预言：连续光谱
ax1 = axes[0]
# 频率范围从初始值到坍缩前
wavelengths_nm = c / frequencies * 1e9  # 转换为纳米
ax1.hist(wavelengths_nm, bins=100, density=True, alpha=0.7, edgecolor='black')
ax1.set_xlabel('波长 (nm)')
ax1.set_ylabel('相对强度')
ax1.set_title('经典理论预言：连续光谱')
ax1.set_xlim(0, 1000)
ax1.axvline(x=656.3, color='r', linestyle='--', alpha=0.5)
ax1.axvline(x=486.1, color='g', linestyle='--', alpha=0.5)
ax1.axvline(x=434.0, color='b', linestyle='--', alpha=0.5)
ax1.axvline(x=410.2, color='purple', linestyle='--', alpha=0.5)

# (2) 实验观测：线光谱
ax2 = axes[1]
# 巴尔末系列的谱线
balmer_wavelengths = [656.3, 486.1, 434.0, 410.2]  # nm
balmer_names = ['Hα', 'Hβ', 'Hγ', 'Hδ']
colors = ['red', 'cyan', 'blue', 'violet']

for wl, name, color in zip(balmer_wavelengths, balmer_names, colors):
    ax2.axvline(x=wl, color=color, linewidth=3, label=f'{name} ({wl:.1f} nm)')

ax2.set_xlabel('波长 (nm)')
ax2.set_ylabel('强度')
ax2.set_title('实验观测：离散线光谱（巴尔末系列）')
ax2.set_xlim(380, 700)
ax2.set_ylim(0, 1)
ax2.legend()
ax2.set_yticks([])

plt.tight_layout()
plt.show()

print("对比说明:")
print("左图：经典理论预言电子螺旋坠落时应辐射连续光谱")
print("右图：实验观测到的是离散的线光谱")
print("\n这个矛盾无法在经典物理框架内解决")
```

对比图清楚地展示了经典理论与实验观测之间的矛盾。经典理论预言原子应该发出连续光谱（左图），而实验观测到的是离散的线光谱（右图）。这个矛盾是深刻的、根本性的，无法通过对经典理论做小的修正来解决。

## 总结与展望

让我们总结一下行星模型面临的困难。卢瑟福通过散射实验确立的原子核式结构是正确的，这一点毫无疑问。问题在于，当我们试图用经典物理学来描述这个结构中电子的运动时，遇到了两个无法逾越的障碍。

第一是稳定性问题。根据经典电磁理论，绑核运动的电子必须辐射能量，导致轨道螺旋收缩，在约 $10^{-11}$ 秒内坍缩到原子核上。但原子实际上是稳定的，可以存在亿万年。

第二是光谱问题。经典理论预言原子应该发出连续光谱，但实验观测到的是离散的线光谱，而且谱线的频率满足简单的整数关系。

这两个问题的根源是相同的：经典物理允许能量和轨道半径取任意连续值，没有一个机制来阻止电子落到任意低的能量状态，也没有一个机制来解释为什么只有特定的能量（对应特定的谱线频率）是允许的。

解决这些问题需要一个革命性的新思想：能量不是连续的，而是量子化的。电子只能处于特定的"允许轨道"上，对应于特定的能量值。在最低能量的轨道上，电子不再辐射能量，这定义了一个稳定的基态。电子从一个轨道跃迁到另一个轨道时，发射或吸收的光子能量等于两个轨道的能量差，这解释了线光谱的离散性。

这些思想由玻尔在1913年正式提出，开创了量子理论在原子结构中的应用。玻尔模型是如何建立的？它能解释哪些实验事实？它本身又有什么局限性？这些问题将在下一章详细讨论。

## 思考题

1. 计算氢原子中处于第一激发态（玻尔半径的4倍）的电子的辐射功率，并估算它坍缩到基态轨道所需的时间。

2. 根据经典理论，电子在螺旋坠落过程中辐射的电磁波频率应该连续变化。计算电子从玻尔半径坍缩到玻尔半径的一半时，辐射频率的变化范围。

3. 思考题：万有引力也是平方反比力，行星绕太阳运动时也有加速度，为什么行星系统没有"辐射坍缩"问题？提示：计算一下地球绕太阳运动时引力波辐射的功率，与太阳的光度相比如何。

4. 思考题：经典电磁理论是1865年麦克斯韦建立的，行星模型是1911年卢瑟福提出的，为什么物理学家们花了这么长时间才意识到行星模型与经典电磁理论之间的矛盾？

5. 编程题：修改本节的螺旋坍缩模拟代码，计算电子在坍缩过程中辐射的总能量，验证它等于初始轨道的总能量（取绝对值）。
