# How to Create Conda Environment:
## From yml file
### 1 solve dependencies with conda (good for across platfrom, about 6 min)
conda env create --file cg37_required.yml
### 2 fully solved environment (~1min)
conda env create --file cg37_explicit.yml
## Shell

have to use interactive bash to find conda PATH etc.

bash -i create_cg37.sh


# Packages 

ipykernel -- multi kernel for jupyter
