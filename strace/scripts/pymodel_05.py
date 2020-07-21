import numpy as np
import pandas as pd
p_ebni_val = pd.read_csv('../data/p_ebni_val.csv', header=None, names=['input'], dtype=np.float64)
len_p_ebni = p_ebni_val.shape[0]
P_threshold = np.float64(3.5)
K_fast = np.float64(10)
K = np.float64(80)
qsim = pd.DataFrame(0, index=np.arange(len_p_ebni), columns=['output'], dtype=np.float64)
S_fast = np.float64(0)
S = np.float64(0)
for t in range(1, len_p_ebni):
    if p_ebni_val.iloc[t, 0] > P_threshold:
        p_fast = p_ebni_val.iloc[t, 0] - P_threshold
        p_rest = P_threshold
    else:
        p_fast = np.float64(0)
        p_rest = p_ebni_val.iloc[t, 0]
    S_fast = S_fast + p_fast
    q_reservoir_fast = S_fast / K_fast
    S_fast = S_fast - q_reservoir_fast
    S = S + p_rest
    q_reservoir = S / K
    S = S - q_reservoir
    qsim.iloc[t, 0] = q_reservoir_fast + q_reservoir
output_05 = np.round((qsim['output'] * 31.8888888), 4)
output_05.to_csv('../data/model_05_out.csv', header=False, index=False)