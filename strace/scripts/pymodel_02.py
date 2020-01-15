import numpy as np
import pandas as pd
p_ebni = pd.read_csv('data/p_ebni.csv', header=None, names=['input'], dtype=np.float64)
len_p_ebni = p_ebni.shape[0]
K = np.float64(55)
qsim = pd.DataFrame(0, index=np.arange(len_p_ebni), columns=['output'], dtype=np.float64)
S = np.float64(0)
for t in range(1, len_p_ebni):
    S = S + p_ebni.iloc[t, 0]
    qsim.iloc[t, 0] = S / K
    S = S - qsim.iloc[t, 0]
output_02 = np.round((qsim['output'] * 31.8888888), 4)
output_02.to_csv('data/model_02_out.csv', header=False, index=False)
