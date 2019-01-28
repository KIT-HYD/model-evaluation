import csv
import numpy as np
from scipy.signal import lfilter
p_ebni_int_len = len(open('data/p_ebni_int.csv').readlines())
K = np.int8(55)
qsim = np.zeros((p_ebni_int_len, 1), dtype=np.int8)
S = np.int8(0)
t = 1
with open('data/p_ebni_int.csv', 'r') as csvfile:
    for item in csv.reader(csvfile):
        if t in range(2, p_ebni_int_len+1):
            S = S + np.int8(item[0])
            qsim[t-1] = S / K
            S = S - qsim[t-1]
        t+=1
output_04 = np.int8(np.round((qsim * 31.8888888), 0))
with open('data/pymodel_04_out.csv', 'w') as csvsave:
    for item in output_04:
        csv.writer(csvsave).writerow(item)
