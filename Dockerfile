# Choose an image
FROM ankane/ml-stack:standard

# Remove example notebooks
RUN rm *.ipynb

# Copy your notebooks
COPY standard/Forecasting.ipynb ./

# The rest is specific to Binder
ARG NB_USER
ARG NB_UID
RUN apt-get update && \
    apt-get install adduser && \
    adduser --disabled-password --gecos '' --uid ${NB_UID} ${NB_USER} && \
    chown -R ${NB_USER}:${NB_USER} .
USER ${NB_USER}
RUN mkdir ~/.jupyter && \
    echo 'c.KernelSpecManager.ensure_native_kernel = False' > ~/.jupyter/jupyter_notebook_config.py && \
    iruby register
