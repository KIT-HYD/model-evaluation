import csv
import numpy as np
from scipy.signal import lfilter
p_ebni_len = len(open('data/p_ebni.csv').readlines())
epsilon = np.float64(0.001)
K = np.float64(55)
qsim = np.zeros((p_ebni_len, 1))
S = np.float64(0)
t = 1
with open('data/p_ebni.csv', 'r') as csvfile:
    for item in csv.reader(csvfile):
        if t in range(2, p_ebni_len+1):
            S = S + np.float64(item[0])
            qsim_old = S / K
            done_flag = False
            while not done_flag:
                S_old = S - qsim_old
                qsim_new = S_old / K
                if abs((qsim_old - qsim_new) / qsim_old) < epsilon:
                    done_flag = True
                else:
                    qsim_old = (qsim_old + qsim_new) / np.float64(2)
            qsim[t-1] = qsim_new
            S = S - qsim_new
        t+=1
output_06 = np.round((qsim * 31.8888888), 5)
with open('data/pymodel_06_out.csv', 'w') as csvsave:
    for item in output_06:
        csv.writer(csvsave).writerow(item)
