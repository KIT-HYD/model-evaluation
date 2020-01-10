import numpy as np
import pandas as pd
from scipy.signal import lfilter
p_ebni_min = pd.read_csv('../data/p_ebni_min.csv', header=None, names=['input'], dtype=np.float64)
len_p_ebni_min = p_ebni_min.shape[0]
K = np.float64(55 * 60)
qsim = pd.DataFrame(0, index=np.arange(len_p_ebni_min), columns=['output'], dtype=np.float64)
S = np.float64(0)
for t in range(1, len_p_ebni_min):
    S = S + p_ebni_min.iloc[t, 0]
    qsim.iloc[t, 0] = S / K
    S = S - qsim.iloc[t, 0]
dummy = lfilter(np.ones(60), 1, qsim['output'], axis=0)
output_03 = pd.DataFrame(dummy[59::60], columns=['output'], dtype=np.float64)
output_03 = np.round((output_03['output'] * 31.8888888), 4)
output_03.to_csv('../data/model_03_out.csv', header=False, index=False)
