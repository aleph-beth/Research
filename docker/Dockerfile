FROM    continuumio/miniconda3	

EXPOSE	8080

ADD 	https://raw.githubusercontent.com/aleph-beth/Research/main/conda/conda_env_all_langages.sh . 
RUN 	chmod +x conda_env_all_langages.sh \
&&      bash conda_env_all_langages.sh Research

CMD	conda activate Research \
&& 	jupyter-lab --ip=*
