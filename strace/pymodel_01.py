import csv
import numpy as np
from scipy.signal import lfilter
with open('data/q_host.csv', 'r') as csvfile:
    output_01 = csv.reader(csvfile)
    with open('data/pymodel_01_out.csv', 'w') as csvsave:
        for item in output_01:
            csv.writer(csvsave).writerow(np.float64(item))
