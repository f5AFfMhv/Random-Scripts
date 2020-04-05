#!/usr/bin/env python

import numpy as np
import matplotlib.pyplot as plt

plt.rcParams["font.family"] = "Humor Sans" #Neveikia
x = np.linspace(0, 12, 1000)
y = np.sin(x)

plt.xkcd(scale=5, length=400)
plt.xticks([])
plt.yticks([])
plt.ylabel('y=sin(x)')
plt.xlabel('testinis testas is testo')
plt.plot(x, y)
plt.show()
#plt.gca().set_aspect(2*9/16)
#plt.savefig('xkcd_plot.png', dpi=300)