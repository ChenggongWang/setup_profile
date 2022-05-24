# How to Create Conda Environment:
## Shell
have to use interactive bash to find conda PATH etc.

> bash -i create_cg37.sh

## From yml file
### 1 solve dependencies with conda (good for across platfrom, about 6 min)
> conda env create --file cg37_required.yml
### 2 fully solved environment (~1min)
> conda env create --file cg37_explicit.yml


# Packages 

ipykernel: enable multiple IPython kernels for different virtualenvs or conda environments
https://ipython.readthedocs.io/en/stable/install/kernel_install.html

numba: can be as fast as any compiled language (add JIT just in time compiler to python)
https://numba.pydata.org/

Matplotlib: plotting lib for python

Xarray: for labelled multi-dimensional arrays. Netcdf files

Xesmf: regridding 

CuPY: CUDA with a numpy interface (uses GPU and speeds up the calculation for free)
