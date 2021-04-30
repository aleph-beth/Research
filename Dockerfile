FROM 	ubuntu:21.04

ARG     HOME_CONDA=/opt/minicondda3

RUN 	apt-get update \
&&	apt-get install -y wget gcc g++ 

RUN 	mkdir Download \
&&	wget https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh \
&&	chmod +x Miniconda3-latest-Linux-x86_64.sh \
&&	bash ./Miniconda3-latest-Linux-x86_64.sh -b -p $HOME_CONDA

RUN 	export PATH=$HOME_CONDA/bin:$PATH \
&&	chmod +x $HOME_CONDA/etc/profile.d/conda.sh \
&&	$HOME_CONDA/etc/profile.d/conda.sh \	
&&	conda create -n Research python=3.8 \
&&	pip install jupyterlab featuretools compose evalml

RUN 	export PATH=$HOME_CONDA/bin:$PATH \	
&&	conda install -c mjohnson541 julia \
&& 	julia -E "using Pkg; Pkg.add(\"IJulia\")" \
&&	julia -E "using Pkg; Pkg.add(\"CUDA\")"


RUN 	export PATH=$HOME_CONDA/bin:$PATH \
&&	conda install r-essentials r-base \
&&	R -e "install.packages('IRkernel')" \
&&	R -e "IRkernel::installspec()"  \
&&	jupyter labextension install @techrah/text-shortcuts
