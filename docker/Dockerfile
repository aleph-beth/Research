FROM    continuumio/miniconda3	

EXPOSE	8080

ADD 	https://raw.githubusercontent.com/aleph-beth/Research/main/conda/conda_env_all_langages.sh . 
RUN 	chmod +x conda_env_all_langages.sh \
&&      bash conda_env_all_langages.sh Research

RUN useradd -ms /bin/bash user
RUN mv /conda_env_all_langages.sh /home/user 


ADD     https://raw.githubusercontent.com/aleph-beth/Research/main/conda/conda_env_pytorch_and_opencv.sh .
RUN     chmod +x conda_env_pytorch_and_opencv.sh \
&&      bash conda_env_pytorch_and_opencv.sh 

RUN mv *.sh /home/user

USER user
RUN conda init --all \
&& bash

WORkDIR /home/user

VOLUME /home/user/Dev
