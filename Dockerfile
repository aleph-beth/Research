FROM 	ubuntu:21.04

ARG     HOME_CONDA=/opt/minicondda3

### Add gcc and g++
RUN 	apt-get update \
&&	apt-get install -y wget gcc g++ 

### Add Miniconda
RUN 	mkdir Download \
&&	wget https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh \
&&	chmod +x Miniconda3-latest-Linux-x86_64.sh \
&&	bash ./Miniconda3-latest-Linux-x86_64.sh -b -p $HOME_CONDA

### Add Jupyter and Feature Tools with environement
RUN 	export PATH=$HOME_CONDA/bin:$PATH \
&&	chmod +x $HOME_CONDA/etc/profile.d/conda.sh \
&&	$HOME_CONDA/etc/profile.d/conda.sh \	
&&	conda create -n Research python=3.8 \
&&	conda install -c r r-essentials r-base r-irkernel \
&& 	conda install -c conda-forge jupyterlab \
&&	pip install jupyter jupyterlab featuretools compose evalml

### Add Julia 
RUN 	export PATH=$HOME_CONDA/bin:$PATH \	
&&	conda install -c mjohnson541 julia \
&& 	julia -E "using Pkg; Pkg.add(\"IJulia\")" \
&&	julia -E "using Pkg; Pkg.add(\"CUDA\")"

### Add Node.js
RUN 	 export PATH=$HOME_CONDA/bin:$PATH \
&&	conda install -c conda-forge nodejs

### Add R
RUN 	export PATH=$HOME_CONDA/bin:$PATH \
&&	conda install -c r r-essentials r-base r-irkernel

### Jupyter
EXPOSE	8080
# CMD 	export PATH=$HOME_CONDA/bin:$PATH \
# &&	conda activate Research \
# œ&& 	jupyter notebook --ip=*
