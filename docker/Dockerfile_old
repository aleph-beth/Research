FROM 	ubuntu:20.04

ARG     HOME_CONDA=/opt/minicondda3
ARG 	HOME_USER=/home/user
ARG 	HOME_CONDA=$HOME_USER/miniconda3

### Add user
RUN	useradd -ms /bin/bash user \
&&	mkdir -p $HOME_USER \
&&	chown -R user:user $HOME_USER
USER	user
WORKDIR $HOME_USER

### Add Miniconda
ADD	--chown=user:user https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh .
RUN	chmod +x ./Miniconda3-latest-Linux-x86_64.sh \
&&	bash ./Miniconda3-latest-Linux-x86_64.sh -b

### Add CONDA environement
ADD 	--chown=user:user https://raw.githubusercontent.com/aleph-beth/Research/main/conda/conda_setup.sh .
RUN 	chmod +x $HOME_USER/conda_setup.sh
RUN 	bash $HOME_USER/conda_setup.sh \
&& 	bash 

ADD 	--chown=user:user https://raw.githubusercontent.com/aleph-beth/Research/main/conda/conda_env_all_langages.sh . 
RUN 	$HOME_CONDA/bin/conda init bash \
&& 	bash \
&& 	chmod +x $HOME_USER/conda_env_all_langages.sh
ENTRYPOINT ["bash", "conda_env_all_langages.sh", "Research", "$HOME_USER"]

### Jupyter
EXPOSE	8080
CMD 	export PATH=$HOME_CONDA/bin:$PATH \
&&	conda activate Research \
&& 	jupyter notebook --ip=*
