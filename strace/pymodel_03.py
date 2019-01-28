import csv
import numpy as np
from scipy.signal import lfilter
p_ebni_min_len = len(open('data/p_ebni_min.csv').readlines())
K = np.float64(55 * 60)
qsim = np.zeros((p_ebni_min_len, 1))
S = np.float64(0)
t = 1
with open('data/p_ebni_min.csv', 'r') as csvfile:
    for item in csv.reader(csvfile):
        if t in range(2, p_ebni_min_len+1):
            S = S + np.float64(item[0])
            qsim[t-1] = S / K
            S = S - qsim[t-1]
        t+=1
dummy = lfilter(np.ones(60), 1, qsim, axis=0)
qsim = dummy[59::60]
output_03 = np.round((qsim * 31.8888888), 5)
with open('data/pymodel_03_out.csv', 'w') as csvsave:
    for item in output_03:
        csv.writer(csvsave).writerow(item)
