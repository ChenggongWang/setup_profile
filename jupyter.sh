#!/bin/bash
#SBATCH --nodes=1
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=10
#SBATCH --mem=40G
#SBATCH --time=3:00:00
#SBATCH --job-name=jupyter

###################################################################
#Script Name : open jupyter lab and establish ssh tunnel
#Description : ref: https://researchcomputing.princeton.edu/support/knowledge-base/jupyter 
#Args        : 
#Author      : Chenggong Wang 
#Email       : c.wang@princeton.edu  
###################################################################

# get tunneling info
XDG_RUNTIME_DIR=""
node=$(hostname -s)
user=$(whoami)
cluster="tigercpu"
port=31234

# print tunneling instructions jupyter-log
echo -e "
Command to create ssh tunnel:
ssh -N -f -L ${port}:${node}:${port} tiger

Use a Browser on your local machine to go to:
http://localhost:${port}  (prefix w/ https:// if using password)

Check for opened local ssh tunnel (will show pid):
ps aux | grep tiger

Close unused tunnel:
kill <pid>
"

# load modules or conda environments here
source /usr/share/Modules/init/bash
module purge
module load anaconda3/2020.11
source /usr/licensed/anaconda3/2020.11/etc/profile.d/conda.sh
conda activate cg37

# Run Jupyter
jupyter lab --no-browser --port=${port} --ip=0.0.0.0

rm slurm-${SLURM_JOB_ID}.out
