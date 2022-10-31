#!/bin/bash 
  
###################################################################
#Script Name : create_pytorch.sh
#Description : create env for pytorch
#Args        : 
#Author      : Chenggong Wang 
#Email       : c.wang@princeton.edu  
###################################################################

# exit when any command fails
set -e
# keep track of the last executed command
trap 'last_command=$current_command; current_command=$BASH_COMMAND' DEBUG
# echo an error message before exiting
trap 'echo "\"${last_command}\" command filed with exit code $?."' EXIT
# command starts here

conda create -y -n cg_pytorch python=3.9 numpy
conda activate cg_pytorch
conda install -y pytorch torchvision torchaudio pytorch-cuda=11.7 -c pytorch -c nvidia
conda install -y -c conda-forge matplotlib=3 cartopy scipy scikit-learn numba ipykernel
conda install -y -c conda-forge xarray netcdf4
python -m ipykernel install --user --name cg_pytorch
conda deactivate

echo 'conda enviroment for pytorch created!'
exit
