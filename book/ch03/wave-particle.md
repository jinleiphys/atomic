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

# 3.1 对象的类继承

> **Algorithm Goal:** 理解微观粒子如何同时实现"粒子"和"波"两套接口，以及实验条件如何决定调用哪个接口。

---

## Carbon Story：光到底是什么？

### 三百年的争论

- **牛顿(1672)**：光是粒子流(微粒说)，可以解释反射和直线传播。
- **惠更斯(1678)**：光是波(波动说)，可以解释衍射和干涉。
- **杨氏双缝实验(1801)**：明确显示了干涉条纹，波动说获胜。
- **麦克斯韦(1865)**：光是电磁波，理论预言与实验完美吻合，波动说彻底胜出。

到 19 世纪末，似乎一切都已尘埃落定。然后：

- **光电效应(1905)**：爱因斯坦指出，光在与物质交换能量时表现为一份一份的"光量子"(光子)，能量 $E = h\nu$。
- **康普顿散射(1923)**：X 射线与电子碰撞时，行为完全像两个粒子的弹性碰撞，光子具有动量 $p = h/\lambda$。

光既是波，又是粒子。

### 德布罗意的推广

1924 年，德布罗意(Louis de Broglie)在他的博士论文中提出了一个大胆的对称性论证：

> 如果光波具有粒子性，那么粒子也应该具有波动性。

任何具有动量 $p$ 的粒子，都对应一个波长：

$$
\lambda = \frac{h}{p} = \frac{h}{mv}
$$

这就是**德布罗意波长**。对于宏观物体(如棒球)，$\lambda \sim 10^{-34}$ m，远小于任何可观测尺度，波动性无法被检测。但对于电子，$\lambda \sim 10^{-10}$ m，与原子尺度相当，波动性应该是可观测的。

1927 年，戴维森和革末的电子衍射实验证实了这一预言。

---

## Silicon Perspective：多重继承

### 对象建模

在面向对象编程中，一个类可以同时继承多个父类的属性和方法。微观粒子的波粒二象性，恰好可以用**多重继承(Multiple Inheritance)**来建模：

```python
class Particle:
    """粒子基类"""
    def __init__(self, mass, charge):
        self.mass = mass
        self.charge = charge
        self.position = None  # 可以有确定的位置
        self.momentum = None  # 可以有确定的动量

    def scatter(self, target):
        """粒子散射：遵循动量守恒和能量守恒"""
        ...

class Wave:
    """波基类"""
    def __init__(self, frequency, wavelength):
        self.frequency = frequency
        self.wavelength = wavelength

    def interfere(self, other_wave):
        """波的干涉：振幅叠加"""
        ...

    def diffract(self, slit_width):
        """波的衍射：当缝宽 ~ 波长时显著"""
        ...

class Electron(Particle, Wave):
    """电子：同时继承粒子和波的属性"""
    def __init__(self, momentum):
        Particle.__init__(self, mass=9.109e-31, charge=-1.602e-19)
        self.momentum = momentum
        # 德布罗意关系：波长由动量决定
        self.wavelength = 6.626e-34 / abs(momentum)
        self.frequency = abs(momentum)**2 / (2 * self.mass * 6.626e-34)

    def observe(self, experiment_type):
        """实验条件决定调用哪个接口"""
        if experiment_type == "double_slit":
            return self.interfere(...)   # 调用 Wave 接口
        elif experiment_type == "collision":
            return self.scatter(...)     # 调用 Particle 接口
```

### 关键洞察

这个类比揭示了一个重要的点：**波粒二象性不是矛盾，而是同一个对象的两套接口。** "波"和"粒子"是人类语言(经典概念)的局限，微观世界的对象本身既不是经典波也不是经典粒子，它是一种新的实体，我们只能在不同的实验场景下分别看到它的不同侧面。

用编程术语说：我们没有直接描述 `Electron` 对象全貌的语言，我们只能通过调用它的不同方法(不同实验)，获得它的不同投影。

---

## 思考题

1. 为什么宏观物体的波动性不可观测？仅仅是波长太短这一个原因吗？(提示：考虑退相干效应和环境的影响。)

2. 德布罗意在1924年提出物质波假说时，还没有任何实验证据。他凭什么相信这个想法是对的？"对称性"在物理学猜想中扮演什么角色？

3. 电子既是粒子又是波，这两种描述如何共存？波粒二象性是说电子"有时是粒子，有时是波"，还是说它"既不是粒子也不是波"？
