import numpy as np
import matplotlib.pyplot as plt

# Funktion definieren
def f(x):
    return 10 * np.sin(x)**2

# Wertebereich und Schrittweite für x
x_values = np.arange(0, 10, 0.1)

# Berechnung der Funktionswerte
y_values = f(x_values)

# Wertetabelle ausgeben
print(" x    |  f(x)")
print("----------------")
for x, y in zip(x_values, y_values):
    print(f"{x:.2f}  |  {y:.2f}")

# Visualisierung mit Matplotlib
plt.plot(x_values, y_values, label=r'$f(x) = 10 \cdot (\sin(x))^2$')
plt.title('Funktionsplot')
plt.xlabel('x')
plt.ylabel('f(x)')
plt.legend()
plt.grid(True)
plt.show()
