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
&&	pip install jupyterlab featuretools compose evalml

### Add Julia 
RUN 	export PATH=$HOME_CONDA/bin:$PATH \	
&&	conda install -c mjohnson541 julia \
&& 	julia -E "using Pkg; Pkg.add(\"IJulia\")" \
&&	julia -E "using Pkg; Pkg.add(\"CUDA\")"


### Add R
RUN 	export PATH=$HOME_CONDA/bin:$PATH \
&&	conda install r-essentials r-base \
&&	Rscript -e "install.packages('IRkernel', ask = TRUE, repos = c(CRAN = 'https://cloud.r-project.org/'))" \
&&	Rscript -e "IRkernel::installspec()"  \
&&	jupyter labextension install @techrah/text-shortcuts
