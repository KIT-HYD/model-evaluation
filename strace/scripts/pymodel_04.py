import numpy as np
import pandas as pd
p_ebni_int = pd.read_csv('../data/p_ebni_int.csv', header=None, names=['input'], dtype=np.int8)
len_p_ebni_int = p_ebni_int.shape[0]
K = np.int8(55)
qsim = pd.DataFrame(0, index=np.arange(len_p_ebni_int), columns=['output'], dtype=np.int8)
S = np.int8(0)
for t in range(1, len_p_ebni_int):
    S = S + p_ebni_int.iloc[t, 0]
    qsim.iloc[t, 0] = S / K
    S = S - qsim.iloc[t, 0]
output_04 = np.round((qsim['output'] * 31.8888888), 4)
output_04.to_csv('../data/model_04_out.csv', header=False, index=False)
