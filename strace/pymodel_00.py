import csv
import numpy as np
from scipy.signal import lfilter
q_host_mean = np.float64(4.5998)
output_00 = np.ones((87650,1)) + q_host_mean
with open('data/pymodel_00_out.csv', 'w') as csvsave:
    for item in output_00:
        csv.writer(csvsave).writerow(item)
