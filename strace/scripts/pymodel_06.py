import numpy as np
import pandas as pd
p_ebni = pd.read_csv('../data/p_ebni.csv', header=None, names=['input'], dtype=np.float64)
len_p_ebni = p_ebni.shape[0]
epsilon = np.float64(0.001)
K = np.float64(55)
qsim = pd.DataFrame(0, index=np.arange(len_p_ebni), columns=['output'], dtype=np.float64)
S = np.float64(0)
for t in range(1, len_p_ebni):
    S = S + p_ebni.iloc[t, 0]
    qsim_old = S / K
    done_flag = False
    while not done_flag:
        S_old = S - qsim_old
        qsim_new = S_old / K
        if abs((qsim_old - qsim_new) / qsim_old) < epsilon:
            done_flag = True
        else:
            qsim_old = (qsim_old + qsim_new) / np.float64(2)
    qsim.iloc[t, 0] = qsim_new
    S = S - qsim_new
output_06 = np.round((qsim['output'] * 31.8888888), 4)
output_06.to_csv('../data/model_06_out.csv', header=False, index=False)
