# Introduction

This project contains a tutorial and examples for operating Matlab on clusters at Yale.

*author: David Huberdeau*
*Post-doctoral Fellow, YCRC*


# Tutorials Curriculum

1. Brief overview of Matlab
1. Running Matlab with graphic user interface (GUI) on a cluster
2. Operating Matlab interactively without a GUI
1. Submitting Matlab batch jobs on the clusters
2. Parallelizing code in general and on the clusters

# Planned examples

- Matlab Desktop (example.m)
- GUI mode (example_gui.m)
- Interactive mode (example_interactive.m)
- Batch scripting (example_batch.sh)
- Parallelizing (example_parallel.m)

# Matlab overview

- High level scripting programming language

`example`

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

# Running Matlab without a user interface

Log on to the cluster of choice

`ssh dmh87@milgram.hpc.yale.edu`

_this time, the -Y is unneccesary_

Log on to a compute node

`srun --pty -p interactive bash`

_note that the "--x11" isn't necessary when no GUI is used_

Then load the Matlab version of choice (or the default)

`module load MATLAB`

Finally, start MATLAB without the user interface

`matlab -nodesktop -nosplash -nojvm`

Now, you can run your code or do other things

`example_interactive`

## Summary:

```
ssh dmh87@milgram.hpc.yale.edu,
srun --pty -p interactive bash,
module load MATLAB,
matlab -nodesktop -nosplash -nojvm,
example_interactive
```

- _the "-nojvm" option is not necessary but I like including it to avoid potential java errors_
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

Specify inputs to a function using bash scripting.
- Variables can be defined in your batch job, then referenced by including a leading $

```

```

## Some tips:
- explicitly specify output files and directories to save any outputs to.
  - variables
  - figures
- Achieve simple parallelization by using a job array
  - [how to do that here]





## Summary
```
sbatch example_batch.sh
 ```
