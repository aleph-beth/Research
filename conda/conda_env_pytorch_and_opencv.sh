# Pytoch && OpenCV

conda env list

if $1 == "GPU"
then
	conda install pytorch torchvision torchaudio cudatoolkit=10.2 -c pytorch
	julia -E 'using Pkg; Pkg.add("CUDA")'
fi

if $1 == "CPU"
then
	conda install pytorch torchvision torchaudio cpuonly -c pytorch
fi

conda install -y -c conda-forge opencv
pip install scikit-image
