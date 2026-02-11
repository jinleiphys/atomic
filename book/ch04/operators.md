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

# 4.2 算符与期望值

## 动量为什么变成了微分？

在经典力学中，位置 $x$、动量 $p$、能量 $E$ 都是明确的数值，你可以在任何时刻精确地测量并记录它们。然而，当物理学家在二十世纪初试图描述原子尺度的现象时，他们逐渐意识到这种简单的图景不再适用。量子力学的建立迫使人们重新思考"物理量"的含义，最终导致了一个深刻的观念转变：物理量不再是数，而是**算符**——作用在波函数上的运算规则。

这一转变并非一蹴而就。1925 年至 1926 年间，海森堡(Heisenberg)和薛定谔(Schrodinger)分别从不同的路径抵达了同一目的地。海森堡从可观测量的矩阵表示出发，构建了矩阵力学；薛定谔则从波动方程出发，构建了波动力学。1926 年，薛定谔证明了这两种看似截然不同的理论实际上是数学等价的。在薛定谔的波动力学框架中，每一个经典物理量都对应一个算符：位置算符 $\hat{x}$ 就是简单地乘以 $x$；动量算符 $\hat{p} = -i\hbar \dfrac{\partial}{\partial x}$ 是一个微分运算；动能算符 $\hat{T} = -\dfrac{\hbar^2}{2m}\dfrac{\partial^2}{\partial x^2}$ 是二阶微分；角动量的 $z$ 分量算符 $\hat{L}_z = -i\hbar \dfrac{\partial}{\partial \phi}$ 则涉及对方位角的微分。

为什么动量偏偏变成了微分算符？这个问题的答案深藏在德布罗意关系之中。回顾德布罗意关系 $p = \hbar k$($k$ 是波矢)，而平面波 $e^{ikx}$ 的空间导数给出 $ik \cdot e^{ikx}$。所以 $-i\hbar \frac{d}{dx} e^{ikx} = \hbar k \cdot e^{ikx} = p \cdot e^{ikx}$。动量算符作用在平面波上，恰好返回动量值乘以该平面波本身。这不是巧合——德布罗意关系将粒子的动量与波的空间振荡频率联系起来，而微分运算恰恰是提取空间振荡频率的数学工具。从这个角度看，动量算符的微分形式是波粒二象性的自然结果。

有了算符的概念，我们就可以定义物理量 $A$ 在量子态 $\psi$ 中的**期望值(平均值)**：

$$
\langle A \rangle = \int_{-\infty}^{\infty} \psi^*(x) \, \hat{A} \, \psi(x) \, dx
$$

这是对 $\hat{A}$ 在状态 $\psi$ 上的"加权平均"，权重由 $|\psi|^2$ 给出。例如，位置的期望值为

$$
\langle x \rangle = \int_{-\infty}^{\infty} \psi^*(x) \, x \, \psi(x) \, dx = \int_{-\infty}^{\infty} x \, |\psi(x)|^2 \, dx
$$

这正是概率论中随机变量的数学期望。量子力学之所以用这个积分公式来计算期望值，是因为 $|\psi(x)|^2$ 扮演了概率密度的角色——波函数的模方告诉我们粒子出现在某个位置的概率有多大。动量的期望值同样可以类似地计算，只不过需要将动量算符夹在 $\psi^*$ 和 $\psi$ 之间：$\langle p \rangle = \int \psi^* (-i\hbar \frac{d}{dx}) \psi \, dx$。

算符理论中一个极为重要的概念是**本征值与本征态**。当波函数恰好是某个算符的本征态时，测量结果是确定的：

$$
\hat{A}\psi_a = a\psi_a \quad \Longrightarrow \quad \text{测量 } A \text{ 一定得到 } a
$$

这里 $a$ 称为本征值，$\psi_a$ 称为对应的本征态。本征值方程的含义是：算符作用在本征态上，只是将它乘以一个常数(本征值)，而不改变其函数形式。如果波函数不是本征态，而是多个本征态的叠加 $\psi = c_1\psi_1 + c_2\psi_2 + \cdots$，那么测量结果是随机的，得到 $a_n$ 的概率为 $|c_n|^2$。这就是量子力学中概率性的数学根源——叠加态中蕴含着多种可能的测量结果，每种结果对应一个本征值，其出现的概率由叠加系数的模方决定。

值得强调的是，量子力学要求物理可观测量对应的算符必须是**厄米算符**(Hermitian operator)，即满足 $\int \psi_1^* (\hat{A} \psi_2) dx = \int (\hat{A} \psi_1)^* \psi_2 dx$。厄米算符的本征值都是实数，这保证了测量结果总是实数——一个物理上合理的要求。此外，厄米算符的不同本征值对应的本征态彼此正交，它们构成了一组完备基，任意波函数都可以在这组基上展开。这种数学结构使得量子力学具有了优雅的线性代数框架。

## 硅基视角：查询接口(Query Interface)

在经典力学中，粒子的位置、动量等属性是"预存"在粒子上的标量值，你随时可以读取，就像访问一个对象的属性字段一样。但在量子力学中，物理量不是预存的数据，而是**操作(Operation)**。观测一个物理量，等于对波函数执行一个算符函数调用。波函数是包含全部信息的"数据库"，而算符是从数据库中提取特定信息的"查询语句"。这个类比非常深刻：你不能直接"看到"数据库里的数据，你只能通过查询来获取信息，而不同的查询可能会影响数据库本身的状态。

```python
class QuantumState:
    def __init__(self, psi):
        self.psi = psi  # 波函数：包含全部信息的数据库

    def query(self, operator):
        """
        对波函数执行算符查询
        返回: 期望值 <A>
        """
        return integrate(conj(self.psi) * operator(self.psi))

    def measure(self, operator):
        """
        执行一次量子测量
        返回: 某个本征值 (概率性的)
        副作用: 波函数坍缩到对应本征态!
        """
        eigenvalues, eigenstates = operator.eigen_decompose()
        probabilities = [abs(overlap(self.psi, es))**2
                         for es in eigenstates]
        result_index = random_choice(probabilities)
        self.psi = eigenstates[result_index]  # 坍缩!
        return eigenvalues[result_index]
```

注意 `measure()` 方法有一个**副作用**：它改变了 `self.psi`(波函数坍缩)。这一点至关重要。`query()`(计算期望值)是非破坏性的，它在数学上对波函数进行积分运算，但不改变波函数本身，就像对数据库执行一次只读查询。而 `measure()`(实际测量)是破坏性的，它不仅返回一个结果，还将波函数不可逆地坍缩到某个本征态，就像一次带有写操作的事务(transaction)。这就是量子力学中"观测者效应"的精确表述：测量不是被动地读取信息，而是主动地改变系统状态。在数据库的语言中，量子测量是一个带有不可回滚的副作用的查询操作。

两个算符 $\hat{A}$ 和 $\hat{B}$ 的**对易子**定义为 $[\hat{A}, \hat{B}] = \hat{A}\hat{B} - \hat{B}\hat{A}$。对易关系在量子力学中扮演着核心角色，它可以被理解为查询的顺序依赖性。如果 $[\hat{A}, \hat{B}] = 0$(对易)，则查询顺序无关紧要，两个物理量可以同时精确测量，就像两个只读查询可以以任意顺序执行而不影响结果。如果 $[\hat{A}, \hat{B}] \neq 0$(不对易)，则查询顺序影响结果，最著名的例子就是位置和动量的对易关系 $[\hat{x}, \hat{p}] = i\hbar$。这正是不确定关系的算符表述：位置和动量不能同时精确确定，因为测量其中一个必然扰动另一个——两个查询操作之间存在不可消除的冲突。

## 思考题

1. 为什么量子力学中物理量要用算符表示？经典力学中位置和动量只是数，量子力学中它们变成了算符，这意味着什么？

2. 位置算符和动量算符不对易($[\hat{x}, \hat{p}] = i\hbar$)，这与不确定关系有什么联系？对易关系是不确定关系的"原因"还是"等价表述"？

3. 为什么量子测量会导致波函数坍缩？这是薛定谔方程本身所描述的过程吗？"测量问题"为什么至今仍有争议？

4. 量子力学的形式体系(希尔伯特空间、算符、本征值)看起来非常抽象。这种数学形式主义是"必要的"还是"偶然的"？有没有其他等价的表述方式？
