import numpy as np
import pandas as pd
from keras.models import load_model
p_ebni = pd.read_csv('data/p_ebni.csv', header=None, names=['input'], dtype=np.float64)
model = load_model('data/ann_model.h5')
output_08 = model.predict(p_ebni)
output_08 = pd.DataFrame(output_08, columns=['output'], dtype=np.float64)
output_08 = np.round(output_08['output'], 4)
output_08.to_csv('data/model_08_out.csv', header=False, index=False)
