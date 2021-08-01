# Pytoch && OpenCV
CUDA=$1

if [ $CUDA == "GPU" ]
then
	conda install pytorch torchvision torchaudio cudatoolkit=10.2 -c pytorch
	julia -E 'using Pkg; Pkg.add("CUDA")'
fi

if [ $CUDA == "CPU" ]
then
	conda install pytorch torchvision torchaudio cpuonly -c pytorch
fi

conda install -y -c conda-forge opencv
pip install scikit-image
