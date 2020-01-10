import numpy as np
import pandas as pd
q_host = pd.read_csv('../data/q_host.csv', header=None, names=['input'], dtype=np.float64)
len_q_host = q_host.shape[0]
c = np.float64(0.0549)
ar_1 = np.float64(1.9266)
ar_2 = np.float64(-1.2071)
ar_3 = np.float64(0.2685)
output_07 = pd.DataFrame(0, index=np.arange(len_q_host), columns=['output'], dtype=np.float64)
for t in range(3, len_q_host):
    output_07.iloc[t, 0] = c + ar_1 * q_host.iloc[t-1, 0] + ar_2 * q_host.iloc[t-2, 0] + ar_3 * q_host.iloc[t-3, 0]
output_07 = np.round(output_07['output'], 4)
output_07.to_csv('../data/model_07_out.csv', header=False, index=False)
