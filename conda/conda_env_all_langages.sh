ENV_CONDA=$1

bash miniconda3/bin/conda init
bash 

# Python and Jupyter Lab
conda install -y -c conda-forge mamba
conda create -y -n $ENV_CONDA
source activate $ENV_CONDA
mamba install -y jupyterlab

# C++
mamba install -y xeus-cling -c conda-forge
mamba install -y xeus -c conda-forge
mamba install -y jupyterlab
conda install -y -c conda-forge go

# Go
GOPATH=$CONDA_PREFIX_1/envs/$1/go/
env GO111MODULE=off go get -d -u github.com/wangfenjin/gopyter
cd "$(go env GOPATH)"/src/github.com/wangfenjin/gopyter
env GO111MODULE=on go install
mkdir -p ~/.local/share/jupyter/kernels/gopyter
cp kernel/* ~/.local/share/jupyter/kernels/gopyter
cd ~/.local/share/jupyter/kernels/gopyter
chmod +w ./kernel.json # in case copied kernel.json has no write permission
sed "s|gopyter|$(go env GOPATH)/bin/gopyter|" < kernel.json.in > kernel.json

# R
conda install -y r-essentials r-base
conda install -y -c r r-irkernel

# Julia
conda install -y -c mjohnson541 julia
julia -e 'using Pkg;Pkg.add("IJulia")'

# Octave
conda install -y -c conda-forge octave
pip install octave_kernel
conda install -y texinfo


# Pytoch && OpenCV
conda install -y pytorch torchvision torchaudio cpuonly -c pytorch
conda install -c conda-forge opencv
