import matplotlib.pyplot as plt
import numpy as np

def f(x):
    return 4*x

x = np.linspace(-5,5, 100)

y = f(x)

y2 = y - 2

plt.plot(x, y, label="4x")

plt.plot(x, y2, label="4x - 2")

plt.fill_between(x, y, color="red", alpha=.4)

plt.grid(True)
plt.margins(False)

plt.legend()
plt.show()