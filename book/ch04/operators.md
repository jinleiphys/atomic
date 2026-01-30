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

# 4.2 数据提取工具——算符与平均值

> **Algorithm Goal:** 理解物理可观测量如何通过算符从波函数中提取，掌握期望值的计算方法。

---

## Carbon Story：动量为什么变成了微分？

### 观测量的算符化

在经典力学中，位置 $x$、动量 $p$、能量 $E$ 都是明确的数值。在量子力学中，它们变成了**算符**——作用在波函数上的运算规则：

| 经典物理量 | 量子力学算符 |
|-----------|------------|
| 位置 $x$ | $\hat{x} = x$(乘以 $x$)|
| 动量 $p$ | $\hat{p} = -i\hbar \dfrac{\partial}{\partial x}$ |
| 动能 $T$ | $\hat{T} = -\dfrac{\hbar^2}{2m}\dfrac{\partial^2}{\partial x^2}$ |
| 角动量 $L_z$ | $\hat{L}_z = -i\hbar \dfrac{\partial}{\partial \phi}$ |

为什么动量变成了微分算符？回顾德布罗意关系 $p = \hbar k$($k$ 是波矢)，而平面波 $e^{ikx}$ 的空间导数给出 $ik \cdot e^{ikx}$。所以 $-i\hbar \frac{d}{dx} e^{ikx} = \hbar k \cdot e^{ikx} = p \cdot e^{ikx}$。动量算符作用在平面波上，恰好返回动量值。

### 期望值

物理量 $A$ 在量子态 $\psi$ 中的**期望值(平均值)**：

$$
\langle A \rangle = \int_{-\infty}^{\infty} \psi^*(x) \, \hat{A} \, \psi(x) \, dx
$$

这是对 $\hat{A}$ 在状态 $\psi$ 上的"加权平均"——权重由 $|\psi|^2$ 给出。

例如，位置的期望值：

$$
\langle x \rangle = \int_{-\infty}^{\infty} \psi^*(x) \, x \, \psi(x) \, dx = \int_{-\infty}^{\infty} x \, |\psi(x)|^2 \, dx
$$

这正是概率论中随机变量的数学期望。

### 本征值与本征态

当波函数恰好是某个算符的**本征态**时，测量结果是确定的：

$$
\hat{A}\psi_a = a\psi_a \quad \Longrightarrow \quad \text{测量 } A \text{ 一定得到 } a
$$

如果波函数不是本征态，而是多个本征态的叠加：

$$
\psi = c_1\psi_1 + c_2\psi_2 + \cdots
$$

那么测量结果是随机的，得到 $a_n$ 的概率为 $|c_n|^2$。

---

## Silicon Perspective：查询接口(Query Interface)

### 物理量不是预存的，而是运算的结果

在经典力学中，粒子的位置、动量等属性是"预存"在粒子上的标量值，你随时可以读取。

在量子力学中，物理量不是预存的数据，而是**操作(Operation)**。观测一个物理量，等于对波函数执行一个算符函数调用：

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

### 测量的不可逆性

注意 `measure()` 方法有一个**副作用**：它改变了 `self.psi`(波函数坍缩)。这意味着：

- `query()`(计算期望值)是非破坏性的——数据库不变。
- `measure()`(实际测量)是破坏性的——数据库被修改了。

这就是量子力学中"观测者效应"的精确表述：测量不是被动地读取信息，而是主动地改变系统状态。

### 对易关系 = 查询顺序依赖性

两个算符 $\hat{A}$ 和 $\hat{B}$ 的**对易子**：

$$
[\hat{A}, \hat{B}] = \hat{A}\hat{B} - \hat{B}\hat{A}
$$

如果 $[\hat{A}, \hat{B}] = 0$(对易)，则查询顺序无关紧要，两个物理量可以同时精确测量。

如果 $[\hat{A}, \hat{B}] \neq 0$(不对易)，则查询顺序影响结果。例如：

$$
[\hat{x}, \hat{p}] = i\hbar
$$

这正是不确定关系的算符表述。

---

## 习题

1. **[传统]** 验证 $[\hat{x}, \hat{p}] = i\hbar$。提示：计算 $\hat{x}\hat{p}\psi - \hat{p}\hat{x}\psi$ 对任意 $\psi(x)$。
2. **[传统]** 对于一维无限深方势阱的基态 $\psi_1(x) = \sqrt{2/L}\sin(\pi x/L)$，计算 $\langle x \rangle$、$\langle x^2 \rangle$、$\langle p \rangle$ 和 $\langle p^2 \rangle$，并验证不确定关系 $\Delta x \cdot \Delta p \geq \hbar/2$。
3. **[思考]** 为什么量子测量会导致波函数坍缩？这是薛定谔方程本身所描述的过程吗？(提示：考虑"测量问题"的不同解释。)
4. **[计算]** 编写一个 Python 函数，数值计算给定波函数的 $\langle x \rangle$、$\langle p \rangle$、$\Delta x$、$\Delta p$，并验证不确定关系。
