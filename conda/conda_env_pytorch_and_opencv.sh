# Pytoch && OpenCV

conda env list

if $1 == "GPU"
	conda install pytorch torchvision torchaudio cudatoolkit=10.2 -c pytorch
	julia -E 'using Pkg; Pkg.add("CUDA")'

if $1 == "CPU"
	conda install pytorch torchvision torchaudio cpuonly -c pytorch

conda install -y -c conda-forge opencv
pip install scikit-image
