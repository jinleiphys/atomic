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

# 2.3 硬件级验证——弗兰克-赫兹实验

> **Algorithm Goal:** 通过阈值测试，直接验证原子能级的离散性——证明原子的能量输入端口是阶梯状的而非线性的。

---

## Carbon Story：用电子敲门

### 实验设计

1914 年，弗兰克（James Franck）和赫兹（Gustav Hertz）设计了一个简洁而深刻的实验：

1. 在充满汞蒸气的管中，用热阴极发射电子。
2. 电子被加速电压 $V$ 加速后，穿过汞蒸气区域，与汞原子碰撞。
3. 在收集极前设置一个小的反向电压（约 0.5 V），只允许有足够动能的电子到达。
4. 测量收集极电流 $I$ 随加速电压 $V$ 的变化。

### 令人惊讶的结果

如果原子的能量吸收是连续的，电流应该随电压单调增加。但实验结果是：

- 当 $V < 4.9$ V 时，电流随电压增大而平稳增加——电子与汞原子发生弹性碰撞，几乎不损失能量。
- 当 $V \approx 4.9$ V 时，电流**突然下降**——电子获得了足够的动能，恰好能激发汞原子的第一激发态，在碰撞中把 4.9 eV 的能量整体交给汞原子，自身动能骤减，无法通过反向电压到达收集极。
- 当 $V$ 继续增加，电流恢复上升，直到 $V \approx 9.8$ V 时再次下降（电子在路径上经历了两次非弹性碰撞）。

电流-电压曲线呈现出周期为 4.9 V 的**锯齿形振荡**。

### 物理意义

弗兰克-赫兹实验直接证明了：

- 汞原子只能吸收**特定大小**的能量（4.9 eV），对应第一激发态。
- 能量吸收不是连续的，而是**全有或全无**。
- 玻尔的定态假设是正确的——原子确实拥有离散的能级结构。

这为弗兰克和赫兹赢得了 1925 年诺贝尔物理学奖。

---

## Silicon Perspective：阈值测试

### 数字端口 vs 模拟端口

想象你在测试一个未知的硬件设备。你给它的输入端口施加不同大小的电压，观察输出：

- **模拟端口**：输出随输入线性变化——说明内部是线性电路。
- **数字端口**：输出只在特定输入值处发生跳变——说明内部是数字逻辑，有离散的阈值。

弗兰克-赫兹实验就是对原子的**阈值测试（Threshold Testing）**。实验结果明确显示：原子的能量输入端口是**数字的**，不是模拟的。

```
输入能量 E < 4.9 eV  →  原子无响应 (弹性碰撞)
输入能量 E = 4.9 eV  →  触发状态跳变 (非弹性碰撞)
输入能量 4.9 < E < 9.8 eV  →  一次跳变 + 残余动能
输入能量 E = 9.8 eV  →  两次跳变
...
```

这与数字电路中的**施密特触发器（Schmitt Trigger）**在行为上是同构的——只有当输入超过阈值时，系统才会翻转状态。

### 代码示例：模拟弗兰克-赫兹曲线

```{code-cell} ipython3
import numpy as np
import matplotlib.pyplot as plt

def franck_hertz_current(V, V_threshold=4.9, V_retard=0.5):
    """
    简化的弗兰克-赫兹电流模型
    V: 加速电压
    V_threshold: 激发电位 (汞的第一激发态 = 4.9 V)
    V_retard: 反向阻止电压
    """
    I = np.zeros_like(V)
    for i, v in enumerate(V):
        if v <= V_retard:
            I[i] = 0
            continue

        # 电子在路径上可能经历多次非弹性碰撞
        n_collisions = int(v / V_threshold)  # 碰撞次数
        E_residual = v - n_collisions * V_threshold  # 剩余动能 (eV)

        # 只有剩余动能 > 反向电压时才能到达收集极
        if E_residual > V_retard:
            I[i] = (E_residual - V_retard) * (1 + 0.1 * v)
        else:
            I[i] = 0.01 * v  # 微小的漏电流

    # 加一些噪声使其更真实
    I += np.random.normal(0, 0.02 * I.max(), len(I))
    I = np.maximum(I, 0)
    return I

V = np.linspace(0, 25, 1000)
I = franck_hertz_current(V)

plt.figure(figsize=(10, 5))
plt.plot(V, I, 'b-', linewidth=1)
plt.xlabel('加速电压 V (V)')
plt.ylabel('收集极电流 I (a.u.)')
plt.title('弗兰克-赫兹实验模拟 (汞)')

# 标注阈值
for n in range(1, 6):
    plt.axvline(x=n*4.9, color='red', linestyle='--', alpha=0.4)
    plt.text(n*4.9, plt.ylim()[1]*0.95, f'{n*4.9:.1f}V',
             ha='center', fontsize=8, color='red')

plt.grid(True, alpha=0.3)
plt.tight_layout()
plt.savefig('franck_hertz.png', dpi=150)
plt.show()
```

---

## 习题

1. **[传统]** 汞原子的第一激发电位为 4.9 V，计算当汞原子从第一激发态退激到基态时发出的光子波长。它处于什么波段？实验上是否已观测到这条谱线？
2. **[传统]** 如果用氖气代替汞蒸气，已知氖的第一激发电位约为 16.6 eV，预测弗兰克-赫兹曲线的振荡周期。
3. **[计算]** 改进上面的模拟代码，加入更真实的物理效果：电子的热运动展宽（用高斯分布替代阶跃函数）、电子在汞蒸气中的平均自由程效应。
4. **[思考]** 弗兰克-赫兹实验能否观测到汞原子的更高激发态？如果能，需要什么实验条件？
