# nbstencilaproxy

**nbstencilaproxy** provides Jupyter server and notebook extensions to proxy Stencila.
It is based on [**nbrsessionproxy**](https://github.com/jupyterhub/nbrsessionproxy).

If you have a JupyterHub deployment, nbstencilaproxy can take advantage of JupyterHub's existing authenticator and spawner to launch Stencila in users' Jupyter environments. You can also run this from within Jupyter.

## Installation

### Pre-reqs

#### Install Stencila

...

### Install nbstencilaproxy 

Install the library:

```
pip install git+https://github.com/nuest/nbstencilaproxy
```

Either install the extensions for the user:

```
jupyter serverextension enable  --py nbstencilaproxy
jupyter nbextension     install --py nbstencilaproxy
jupyter nbextension     enable  --py nbstencilaproxy
```

Or install the extensions for all users on the system:

```
jupyter serverextension enable  --py --sys-prefix nbstencilaproxy
jupyter nbextension     install --py --sys-prefix nbstencilaproxy
jupyter nbextension     enable  --py --sys-prefix nbstencilaproxy
```

For JupyterLab first clone this repository to a known location and
install from the directory.

```
git clone https://github.com/nuest/nbstencilaproxy /opt/nbstencilaproxy
pip install -e /opt/nbstencilaproxy
jupyter serverextension enable --py nbstencilaproxy
jupyter labextension link /opt/nbstencilaproxy/jupyterlab-nbstencilaproxy
```

The Dockerfile contains an example installation on top of [jupyter/r-notebook](https://github.com/jupyter/docker-stacks/tree/master/r-notebook).
