FROM ubuntu:24.04

ENV RUBY_VERSION=4.0.1

# install packages
RUN apt-get update && apt-get install -y --no-install-recommends \
        autoconf \
        automake \
        build-essential \
        libczmq-dev \
        libffi-dev \
        libpython3.10 \
        libreadline-dev \
        libssl-dev \
        libtool \
        libyaml-dev \
        libzmq3-dev \
        make \
        python3 \
        python3-dev \
        python3-pip \
        python3-setuptools \
        unzip \
        wget \
        zlib1g-dev \
        && \
    rm -rf /var/lib/apt/lists/*

# install Ruby
RUN cd /tmp && \
    wget -O ruby.tar.gz -q https://cache.ruby-lang.org/pub/ruby/4.0/ruby-$RUBY_VERSION.tar.gz && \
    mkdir ruby && \
    tar xfz ruby.tar.gz -C ruby --strip-components=1 && \
    rm ruby.tar.gz && \
    cd ruby && \
    ./configure --disable-install-doc --enable-shared && \
    make -j && \
    make install && \
    cd .. && \
    rm -r ruby && \
    ruby --version && \
    bundle --version

# install Jupyter
RUN pip3 install jupyter matplotlib --break-system-packages && \
    jupyter kernelspec remove -f python3 && \
    mkdir /root/.jupyter && \
    echo 'c.KernelSpecManager.ensure_native_kernel = False' > ~/.jupyter/jupyter_notebook_config.py

# install gems
RUN gem install \
        daru \
        ffi-rzmq \
        informers \
        iruby \
        libmf \
        lightgbm \
        matplotlib \
        numo-narray \
        nyaplot \
        polars-df \
        prophet-rb \
        rover-df \
        rumale \
        vega \
        xgb \
        xlearn \
        && \
    gem install fasttext -- --with-optflags="" && \
    iruby register

WORKDIR /notebooks

COPY standard/Forecasting.ipynb ./

CMD ["jupyter", "notebook", "--no-browser", "--ip=0.0.0.0", "--allow-root"]
