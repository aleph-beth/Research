# Pytoch && OpenCV
conda install -y pytorch torchvision torchaudio cpuonly -c pytorch
conda install -y -c conda-forge opencv

pip install scikit-image

julia -E 'using Pkg; Pkg.add("CUDA")'
