#!/bin/bash 

###################################################################
#Script Name : create_pytorch.sh
#Description : Create a conda env for common use
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

echo $SHELL
wget https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh
bash Miniconda3-latest-Linux-x86_64.sh -b

conda init bash
source .bashrc

conda create -y -n cg_pytorch python=3.10 numpy=1.21
conda activate cg_pytorch
conda install -y pytorch torchvision torchaudio cudatoolkit=11.3 -c pytorch
conda install -y -c conda-forge matplotlib=3 cartopy scipy scikit-learn numba ipykernel
conda install -y -c conda-forge xarray netcdf4
conda install -y -c conda-forge jupyterlab
python -m ipykernel install --user --name pytorch
conda deactivate
echo 'conda enviroment for pytorch created!'
exit

