import numpy as np
import pandas as pd
p_ebni_int_val = pd.read_csv('../data/p_ebni_int_val.csv', header=None, names=['input'], dtype=np.uint8)
len_p_ebni_int = p_ebni_int_val.shape[0]
K = np.uint8(64)
qsim = pd.DataFrame(0, index=np.arange(len_p_ebni_int), columns=['output'], dtype=np.uint8)
S = np.uint8(0)
for t in range(1, len_p_ebni_int):
    S = S + p_ebni_int_val.iloc[t, 0]
    qsim.iloc[t, 0] = np.uint8((S / K) + 0.5)
    S = S - qsim.iloc[t, 0]
output_04 = qsim['output'] * np.uint8(32.8888888)
output_04.to_csv('../data/model_04_out.csv', header=False, index=False)