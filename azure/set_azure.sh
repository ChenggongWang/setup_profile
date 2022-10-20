#!/bin/bash 

###################################################################
#Script Name : set_azure.sh
#Description : install mininconda and create env
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
wget -O install_miniconda.sh https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh
bash install_miniconda.sh -b
export PATH="/home/azurecw55/miniconda3/bin:$PATH"
echo $PATH
conda init bash
source .bashrc

echo "
conda create -y -n cg_pytorch python=3.10 numpy jupyterlab
conda activate cg_pytorch
conda install -y pytorch torchvision torchaudio cudatoolkit=11.6 -c pytorch -c conda-forge
conda install -y -c conda-forge matplotlib=3 cartopy scipy scikit-learn numba ipykernel
conda install -y -c conda-forge xarray netcdf4
python -m ipykernel install --user --name pytorch
conda deactivate
" > pytorch_env.sh
bash -i pytorch_env.sh
echo 'conda enviroment for pytorch created!'
exit
