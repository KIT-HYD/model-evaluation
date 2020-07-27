import numpy as np
import pandas as pd
from keras.models import load_model
def rolling_window(a, window_size):
    shape = (a.shape[0] - window_size + 1, window_size) + a.shape[1:]
    strides = (a.strides[0],) + a.strides
    return np.lib.stride_tricks.as_strided(a, shape=shape, strides=strides)
p_ebni_val = np.loadtxt('../data/p_ebni_val.csv')
len_p_ebni = p_ebni_val.shape[0]
model = load_model('../data/lstm_model.h5')
rolling_windows = np.expand_dims(rolling_window(p_ebni_val, 20), axis=2)[:-1]
model_out = model.predict(rolling_windows)
output_08 = pd.DataFrame(0, index=np.arange(len_p_ebni), columns=['output'], dtype=np.float64)
output_08[0:20] = np.float64(4.86)
output_08[20:] = model_out
output_08 = np.round(output_08['output'], 4)
output_08.to_csv('../data/model_08_out.csv', header=False, index=False)