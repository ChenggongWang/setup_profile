# SETUP files for azure VM

## standard VM with GPU

install NVIDIA driver via NVIDIA GPU Driver Extension for Linux on Azure portal

ref:https://learn.microsoft.com/en-us/azure/virtual-machines/extensions/hpccompute-gpu-linux

Then, download and run setup_azure.sh to install conda and pytorch env.

`wget https://raw.githubusercontent.com/ChenggongWang/setup_profile/main/azure/set_azure.sh`

`bash setup_azure.sh`

## data science VM

automatically setup jupyterhub server and gpu driver

ref: https://learn.microsoft.com/en-us/azure/machine-learning/data-science-virtual-machine/dsvm-ubuntu-intro?source=recommendations


## Note
### solve: torch.cuda.is_available() false
ref: https://discuss.pytorch.org/t/pytorch-installation-issue-nvidia-driver-470-cuda-11-3/158849/6
sudo nvidia-smi -i 0-mig 0
sudo nvidia-smi -i 0--query-gpu=pci.bus_id,mig.mode.current --format=csv
sudo reboot
