import numpy as np
import pandas as pd
from keras.models import load_model
q_host_val = pd.read_csv('../data/q_host_val.csv', header=None, names=['input']).to_numpy()
p1 = np.roll(q_host_val, 1)
p2 = np.roll(q_host_val, 2)
p3 = np.roll(q_host_val, 3)
x = np.hstack((p1, p2, p3))
model = load_model('../data/ann_model.h5')
model_out = model.predict(x)
output_09 = pd.DataFrame(model_out, index=np.arange(model_out.shape[0]), columns=['output'], dtype=np.float64)
output_09 = np.round(output_09['output'], 4)
output_09.to_csv('../data/model_09_out.csv', header=False, index=False)