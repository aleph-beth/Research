bash miniconda3/bin/conda init
bash 
conda activate Research

# Pytoch && OpenCV
conda install -y pytorch torchvision torchaudio cpuonly -c pytorch
conda install -c conda-forge opencv