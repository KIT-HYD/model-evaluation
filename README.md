# A Practical and General Approach for Model Evaluation
This repository contains all source codes and data files used in the experiments of the manuscript "Technical note: “Bit by bit”: A practical and general approach for evaluating model computational complexity vs. model performance".

## Requirements
- Matlab
- Python >= 3
    - Numpy
    - Pandas
    - Scipy
    - Keras
    - H5py
- Strace
    - Available at linux software repositories 

## Get started
Strace commands and the related files can be found in the strace directory. First run "bash_pymodel.sh" that may take long, since the evaluation code is repeated for 100 times. After having all results in the logs directory, run "bash_logsum.sh" to sum up all read operations and obtain a "avg_read.log" file as a final result. Run the scripts as root.

In order to make the plots, add the whole project into the Matlab path and first run the "evaluate_model_output.m" from scripts to calculate the conditional entropy of target given the model output. Then, run the other plot scripts to make the related plots saved at output directory.

## Contact
Uwe Ehret: uwe.ehret@kit.edu <br/>
Elnaz Azmi: elnaz.azmi@kit.edu
