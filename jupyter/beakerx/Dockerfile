FROM 	jupyter/minimal-notebook

LABEL 	maintainer="Thijs Broersen"

USER 	root

RUN 	apt-get update && apt-get upgrade -y

RUN 	apt-get install gnupg2 curl openjdk-8-jdk -y && \
        curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | sudo apt-key add - && \
        echo "deb https://dl.yarnpkg.com/debian/ stable main" | sudo tee /etc/apt/sources.list.d/yarn.list && \
        apt-get update && apt-get install yarn -y

RUN 	apt-get clean && rm -rf /var/lib/apt/lists/*

USER 	$NB_UID

RUN 	pip install --upgrade pip && \
        conda update -n base conda && \
        conda create -y -n labx 'python>=3' && \
        /bin/bash -c "source activate labx" && \
        conda config --env --add pinned_packages 'openjdk=8.0.152' && \
        conda install -y -c conda-forge ipywidgets jupyterlab beakerx && \
        jupyter labextension install @jupyter-widgets/jupyterlab-manager --no-build && \
        jupyter labextension install @jupyterlab/hub-extension --no-build && \
        jupyter labextension install beakerx-jupyterlab --no-build && \
        jupyter labextension install @jupyterlab/theme-dark-extension --no-build && \
        jupyter labextension install @jupyterlab/theme-light-extension --no-build && \
        jupyter labextension install @oriolmirosa/jupyterlab_materialdarker --no-build && \
        jupyter labextension install @jupyterlab/git --no-build && \
        jupyter labextension install @jupyterlab/plotly-extension --no-build && \
        jupyter labextension install @jupyterlab/toc --no-build && \
        jupyter labextension install @jupyterlab/vega3-extension --no-build && \
        jupyter labextension install jupyterlab-drawio --no-build && \
	jupyter labextension install jupyter-leaflet --no-build && \
        jupyter labextension install jupyterlab_voyager --no-build && \
        export NODE_OPTIONS=--max-old-space-size=16000 && jupyter lab build
