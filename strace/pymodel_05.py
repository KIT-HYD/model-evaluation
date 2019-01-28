import csv
import numpy as np
from scipy.signal import lfilter
p_ebni_len = len(open('data/p_ebni.csv').readlines())
P_threshold = np.float64(2)
K_fast = np.float64(10)
K = np.float64(55)
qsim = np.zeros((p_ebni_len, 1))
S_fast = np.float64(0)
S = np.float64(0)
t = 1
with open('data/p_ebni.csv', 'r') as csvfile:
    for item in csv.reader(csvfile):
        if t in range(2, p_ebni_len+1):
            if np.float64(item[0]) > P_threshold:
                p_fast = np.float64(item[0]) - P_threshold
                p_rest = P_threshold
            else:
                p_fast = np.float64(0)
                p_rest = np.float64(item[0])
            S_fast = S_fast + p_fast
            q_reservoir_fast = S_fast / K_fast
            S_fast = S_fast - q_reservoir_fast
            S = S + p_rest
            q_reservoir = S / K
            S = S - q_reservoir
            qsim[t-1] = q_reservoir_fast + q_reservoir
        t+=1
output_05 = np.round((qsim * 31.8888888), 5)
with open('data/pymodel_05_out.csv', 'w') as csvsave:
    for item in output_05:
        csv.writer(csvsave).writerow(item)
