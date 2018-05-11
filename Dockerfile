FROM jupyter/r-notebook

# give NB_USER rights in the installation directory
ENV STENCILA_DIR /opt/stencila
USER root
RUN mkdir -p ${STENCILA_DIR} && chown -R ${NB_USER} ${STENCILA_DIR}

# install Stencila as NB_USER
USER ${NB_USER}
WORKDIR ${STENCILA_DIR}
ADD package.json package.json
RUN npm install
ADD stencila.js stencila.js
ADD stencila-host.js stencila-host.js
ADD index.html index.html
ADD app.js app.js

WORKDIR ${HOME}
ADD requirements.txt /tmp/requirements.txt
RUN pip install --no-cache -r /tmp/requirements.txt

# https://github.com/r-lib/devtools/issues/1722
ENV TAR /bin/tar

ADD install.R install.R
RUN Rscript install.R

#RUN test -d ${HOME}/.jupyter/ || mkdir ${HOME}/.jupyter/
#ADD jupyter_notebook_config.py ${HOME}/.jupyter/jupyter_notebook_config.py

#RUN pip install git+https://github.com/jupyterhub/nbserverproxy.git
#RUN jupyter serverextension enable --sys-prefix --py nbserverproxy

RUN pip install git+https://github.com/nuest/nbstencilaproxy.git
RUN jupyter serverextension enable --sys-prefix --py nbstencilaproxy
RUN jupyter nbextension install    --sys-prefix --py nbstencilaproxy
RUN jupyter nbextension enable     --sys-prefix --py nbstencilaproxy
