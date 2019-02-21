# A Generalized Approach for Model Evaluation
This repository contains all source codes and data files used for the experiments that has been done for the preperation of manuscript "A Generalized Approach for Model Evaluation by Comparing Invested Data versus Obtained Information".

## Requirements
- Matlab R2018b
- Python 3.6.5
    - Numpy 1.16.0
    - Scipy 1.2.0
- Strace
    - Available at linux software repositories 

## Get started
Strace commands and the related files can be found in the strace directory. First run "bash_pymodel.sh" that may take long, since the evaluation code is repeated for 100 times. After having all results in the logs directory, run "bash_logsum.sh" to sum up all read operations and obtain a "avg_read.log" file as a final result. Run the scripts as root.

In order to make the plots, add the whole project into the Matlab path and first run the "evaluate_model_output.m" from scripts to calculate the conditinal entropy of target given the model output. Then, run the other plot scripts to make the related plots saved at output directory.

## Contact
Uwe Ehret: uwe.ehret@kit.edu <br/>
Elnaz Azmi: elnaz.azmi@kit.edu
