#!/bin/bash 

###################################################################
#Script Name : create_cg37.sh
#Description : Create a conda env for common use
#Args        : 
#Author      : Chenggong Wang 
#Email       : c.wang@princeton.edu  
###################################################################
echo $SHELL
conda create -y -n cg37 python=3.7 numpy=1.21 xarray=0.20 dask
conda activate cg37 
conda install -y -c conda-forge  esmpy=7.1.0 xesmf=0.3  netCDF4 h5py h5netcdf 
conda install -y -c conda-forge cartopy=0.20 matplotlib 
conda install -y -c conda-forge nc-time-axis ipympl scipy scikit-learn line_profiler numba ipykernel 
python -m ipykernel install --user --name cg37 --display-name "cg37" # Register the kernel for jupyter
