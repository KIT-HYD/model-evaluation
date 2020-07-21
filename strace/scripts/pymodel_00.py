import numpy as np
import pandas as pd
q_host_mean = np.float64(4.8646)
output_00 = pd.DataFrame(0 + q_host_mean, index=np.arange(43802), columns=['output'], dtype=np.float64)
output_00.to_csv('../data/model_00_out.csv', header=False, index=False)