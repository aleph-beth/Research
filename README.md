# Research
Docker with Miniconda with Python + Julia + R + Octave languages

# BUILD 
docker build  -t alephbeth\research .

# RUN IMAGE
docker run -i -t alephbeth/research /bin/bash

docker run -i -t --volume <local path>:/home/user/Dev alephbeth/research /bin/bash


# RUN JUPYTER
jupyter-lab --ip=* --allow-root --port=8080
