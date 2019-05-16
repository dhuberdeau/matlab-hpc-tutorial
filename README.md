# Introduction

This project contains a tutorial and examples for operating Matlab on clusters at Yale.

*author: David Huberdeau*,
*Post-doctoral Fellow, YCRC*


# Tutorial Curriculum

1. Brief overview of Matlab
2. Operating Matlab interactively without a GUI
1. Submitting Matlab batch jobs on the clusters
2. Parallelizing code in general and on the clusters
1. Running Matlab with graphic user interface (GUI) on a cluster

# Planned examples

- Simple Matlab example (example.m)
- Interactive mode (example_interactive.m)
- Batch scripting (example_batch.sh)
- GUI mode (example_gui.m)
- Parallelizing (example_parallel.m, example_parallel_batch.sh)

# Overview of Matlab


# Running Matlab on a cluster

Log on to the cluster of choice

`ssh [netid]@[your_cluster].hpc.yale.edu`

Log on to a compute node

`srun --pty -p interactive bash`

Then load the Matlab version of choice (or the default)

`module load MATLAB`

Finally, start MATLAB without the user interface

`matlab -nodesktop -nosplash`

Now, you can run your code or do other things

`example_interactive`

## Summary:

```
ssh [netid]@[your_cluster].hpc.yale.edu,
srun --pty -p interactive bash,
module load MATLAB,
matlab -nodesktop -nosplash,
example_interactive
```

- _the "-nodesktop" option keeps the GUI from opening. If you do not include this and you have not logged on to the cluster (ssh) using the "-Y" option, then it will default to openning in interactive mode"_

# Submitting batch jobs on the clusters

Create a script that can be submitted as a batch job.
For example: example_batch.sh

```
#!/bin/bash
#SBATCH -J my_matlab_job
#SBATCH -c 4
#SBATCH -t 1:00:00
#SBATCH -p short

module load Apps/Matlab/R2016b
matlab -nodisplay -nosplash -r example_batch < /dev/null
```

*The script that you run (e.g. example_batch.m) can be anything, although certain features (like plotting) will not work properly without a GUI. There are relatively simple ways to modify a script to avoid plotting.*

```
sbatch example_batch.sh
```

Specify inputs to a function using batch scripting.
- Variables can be defined in your batch job, then referenced by including a leading $

```
#!/bin/bash
#SBATCH -J my_matlab_job
#SBATCH -c 4
#SBATCH -t 1:00:00
#SBATCH -p short

INPUT=10

module load Apps/Matlab/R2016b
matlab -nodisplay -nosplash -r example_batch($INPUT) < /dev/null
```

## Some tips:
- explicitly specify output files and directories to save any outputs to.
  - variables
  - figures
- Achieve simple parallelization by using a job array


## Summary
```
sbatch example_batch.sh
 ```

 # Running Matlab GUI on the clusters

 Log on to the cluster of choice

 `ssh -Y dmh87@milgram.hpc.yale.edu`

 _don't forget the -Y_

 Log on to a compute node

 `srun --pty --x11 -p interactive bash`

 Then load the Matlab version of choice (or the default)

 `module load MATLAB`

 Finally, start MATLAB

 `matlab`

 Now, you can run your code, edit files, plot things, or anything else that you would normally do.

 `example_gui`

 ## Summary:

 ```
 ssh -Y dmh87@milgram.hpc.yale.edu,
 srun --pty --x11 -p interactive bash,
 module load MATLAB,
 matlab
 example_gui
 ```


 # Parallelization in MATLAB

 Create a script that parallelizes operations or functions.
 For example: example_parallel.m

```
example_parallel
```
