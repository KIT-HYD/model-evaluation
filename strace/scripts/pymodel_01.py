import numpy as np
import pandas as pd
q_host_val = pd.read_csv('../data/q_host_val.csv', header=None, names=['input'], dtype=np.float64)
output_01 = q_host_val
output_01.to_csv('../data/model_01_out.csv', header=False, index=False)