import numpy as np
import matplotlib.pyplot as plt
import pdb
import pandas as pd
import h5py

Fs =  10000
f = 5
sample = 100000
x = np.arange(sample)
y = np.sin(2 * np.pi * f * (x / Fs))/100.0

plt.plot(x,y)
plt.show()

amp = np.zeros(100000)
amp[:] = np.random.normal(0.05, 0.01, sample)
plt.plot(x, amp)
plt.show()

plt.plot(x, y+amp)
plt.show()

#amp = y

dts = [1]
gids = "all"

hf = h5py.File("PN_IClamp/inputs/amps.h5", 'w')

hf.create_dataset("amplitudes", data=[amp + y])
#hf.create_dataset("gids", data=gids)
#hf.create_dataset("dts", data=dts)

hf.close()

#df = pd.DataFrame(y)
#df.to_csv('./PN_IClamp/components/templates/5Hz_nonoise.csv',index=False)