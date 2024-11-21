import matplotlib.pyplot as plt
import numpy as np

x = np.loadtxt("PoligonoCoordX.txt")[1:]
y = np.loadtxt("PoligonoCoordY.txt")[1:]

print(x)

plt.scatter(x, y, color = "red")
plt.plot(x, y, label = "triangle")

P1 = {'x':x[3], 'y':y[3]}
P2 = {'x':x[1], 'y':y[1]}

plt.plot([0,P1["x"]],[0,P1["y"]], color="green")
plt.plot([0,P2["x"]],[0,P2["y"]], color="purple")

PM = {'x':np.mean([P1["x"], P2["x"]]), 'y':np.mean([P1["y"], P2["y"]])}

plt.scatter(PM['x'], PM['y'], s=100, color="red", marker='+', linewidths=2)

plt.plot([0, PM['x']], [0, PM['y']], color="orange")

plt.grid()
plt.show()
