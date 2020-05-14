# For Binder
FROM ankane/ml-stack:standard

ARG NB_USER
ARG NB_UID

RUN adduser --disabled-password --gecos '' --uid ${NB_UID} ${NB_USER}

RUN rm *.ipynb

COPY standard/Forecasting.ipynb ./

RUN chown -R ${NB_USER}:${NB_USER} .

USER ${NB_USER}

RUN mkdir ~/.jupyter && \
    echo 'c.KernelSpecManager.ensure_native_kernel = False' > ~/.jupyter/jupyter_notebook_config.py && \
    iruby register
