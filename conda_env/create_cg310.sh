#!/bin/bash 

###################################################################
#Script Name : create_cg310.sh
#Description : Create a conda env for common use
#Args        : 
#Author      : Chenggong Wang 
#Email       : c.wang@princeton.edu  
###################################################################

set -e #end with any error
#set -x #expands variables and prints a little + sign before the line
# load modules or conda environments here
source /usr/share/Modules/init/bash

module purge
module load anaconda3/2023.3

source /usr/licensed/anaconda3/2023.3/etc/profile.d/conda.sh

echo $SHELL
conda create -y -n cg310 python=3.10 numpy
conda activate cg310
conda install -y -c conda-forge xarray dask netCDF4 bottleneck cftime
conda install -y -c conda-forge xesmf=0.7.1 esmpy h5py h5netcdf 
conda install -y -c conda-forge cartopy matplotlib seaborn
conda install -y -c conda-forge nc-time-axis ipympl scipy scikit-learn line_profiler numba ipykernel 
python -m ipykernel install --user --name cg310 --display-name "cg310" # Register the kernel for jupyter
