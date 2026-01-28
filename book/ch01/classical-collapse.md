# 1.2 经典系统的崩溃——行星模型的困难

> **Algorithm Goal:** 对卢瑟福行星模型进行稳定性分析，证明在经典电磁学框架下该模型存在不可修复的致命 Bug。

---

## Carbon Story：10⁻¹¹ 秒的噩梦

### 一个看似完美的模型

卢瑟福散射实验确立了原子的"太阳系"图景：

- 原子核占据中心，集中了 99.97% 以上的质量和全部正电荷。
- 电子在核外绕行，库仑力提供向心力：

$$
\frac{Ze^2}{r^2} = \frac{m_e v^2}{r}
$$

这与行星绕太阳运行的万有引力情形在数学上完全同构。牛顿力学告诉我们，行星轨道是稳定的——那电子轨道也应该稳定，对吗？

### 经典电磁学的判决

**不。** 行星是电中性的，但电子带电。根据麦克斯韦电磁理论，做加速运动的带电粒子**必然辐射电磁波**。绕核做圆周运动的电子具有向心加速度，因此它会不断辐射能量。

辐射功率由拉莫尔公式给出：

$$
P = \frac{2e^2 a^2}{3c^3}
$$

其中 $a$ 是加速度。对于氢原子基态轨道上的电子，辐射功率约为 $4.6 \times 10^{-8}$ W。

后果是灾难性的：

1. 电子不断失去能量，轨道半径持续缩小。
2. 半径缩小 → 速度增大 → 加速度增大 → 辐射更强 → 螺旋加速坠落。
3. 计算表明，电子将在约 $10^{-11}$ 秒内坠入原子核。
4. 辐射频率随轨道缩小而连续变化，应该产生**连续光谱**。

但现实是：

- 原子是稳定的（否则物质不可能存在）。
- 原子发出的是**离散的线光谱**，而不是连续谱。

**经典物理在原子尺度上彻底失败了。**

---

## Silicon Perspective：系统稳定性分析

从系统工程的角度看，行星模型的问题可以精确表述为**稳定性分析（Stability Analysis）**。

### 经典操作系统的 Bug Report

```
BUG REPORT: Classical Atom Runtime Error
==========================================
System:     Rutherford Planetary Model v1.0
OS:         Classical Electrodynamics (Maxwell Equations)
Status:     FATAL

Description:
  Electron process running in circular orbit leaks energy
  via electromagnetic radiation channel.

  Energy drain rate: P = 2e²a²/(3c³)
  Time to crash:     ~10⁻¹¹ seconds
  Expected behavior: Stable orbit (infinite lifetime)
  Actual behavior:   Spiral collapse into nucleus

Root Cause:
  The classical OS treats energy as a continuous variable.
  Any orbit radius is allowed, and the radiation channel
  is always open. There is no mechanism to define a
  "ground state" — a minimum-energy stable configuration.

Proposed Fix:
  Upgrade from analog logic (continuous energy) to
  digital logic (quantized energy levels).
  See: Bohr Model Patch v2.0 (Chapter 2)
```

### 关键洞察

这个 Bug 不是实现层面的——不是某个参数算错了，不是某个近似太粗糙。它是**架构层面**的：经典电磁学（"模拟电路逻辑"）根本不允许稳定的束缚态存在。

解决方案不是修补旧系统，而是更换底层架构：**从连续（模拟）到离散（数字）**。这正是下一章的主题。

### 能量耗散的数值模拟

```python
import numpy as np
import matplotlib.pyplot as plt

# 物理常数 (SI)
e = 1.602e-19      # C
m_e = 9.109e-31    # kg
c = 3e8             # m/s
epsilon_0 = 8.854e-12
a0 = 5.29e-11       # 玻尔半径 (m)

def spiral_collapse():
    """模拟经典电子的螺旋坠落"""
    r = a0          # 初始半径 = 玻尔半径
    dt = 1e-14      # 时间步长 (s)
    t = 0

    radii = [r]
    times = [t]

    while r > 1e-14 and t < 2e-11:
        # 向心加速度
        a = e**2 / (4 * np.pi * epsilon_0 * m_e * r**2)
        # 拉莫尔辐射功率
        P = e**2 * a**2 / (6 * np.pi * epsilon_0 * c**3)
        # 轨道总能量
        E_total = -e**2 / (8 * np.pi * epsilon_0 * r)
        # 能量损失 → 半径变化: dE = (e²/8πε₀r²) dr
        dr = -P * dt * (8 * np.pi * epsilon_0 * r**2) / e**2
        r += dr
        t += dt

        if r > 0:
            radii.append(r)
            times.append(t)

    return np.array(times), np.array(radii)

times, radii = spiral_collapse()

plt.figure(figsize=(8, 5))
plt.plot(times * 1e12, radii / a0)
plt.xlabel('时间 (ps)')
plt.ylabel('轨道半径 / 玻尔半径')
plt.title('经典电子的螺旋坠落')
plt.axhline(y=0, color='r', linestyle='--', label='原子核')
plt.legend()
plt.grid(True, alpha=0.3)
plt.savefig('spiral_collapse.png', dpi=150)
plt.show()

print(f"坠落时间: {times[-1]*1e12:.2f} ps = {times[-1]*1e11:.2f} × 10⁻¹¹ s")
```

---

## 习题

1. **[传统]** 推导氢原子中电子的经典轨道坍缩时间。提示：利用辐射功率 $P = 2e^2a^2/(3c^3)$ 和轨道能量 $E = -e^2/(2r)$ 建立 $dr/dt$ 的微分方程。
2. **[思考]** 为什么行星绕太阳运行不存在"辐射坍缩"问题？引力波辐射的功率与电磁辐射相比如何？
3. **[计算]** 修改上面的模拟代码，绘制电子坠落过程中辐射频率随时间的变化曲线，验证它确实是连续的而非离散的。
