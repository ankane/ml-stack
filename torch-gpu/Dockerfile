FROM nvidia/cuda:11.3.1-cudnn8-devel-ubuntu20.04

ENV RUBY_VERSION 3.1.2

# install packages
RUN apt-get update && \
    DEBIAN_FRONTEND=noninteractive TZ=Etc/UTC apt-get install -y --no-install-recommends \
        autoconf \
        automake \
        build-essential \
        imagemagick \
        libczmq-dev \
        libffi-dev \
        libreadline-dev \
        libsox-dev \
        libsox-fmt-all \
        libssl-dev \
        libtool \
        libvips \
        libyaml-dev \
        libzmq3-dev \
        make \
        python3 \
        python3-pip \
        python3-setuptools \
        sox \
        unzip \
        wget \
        zlib1g-dev \
        && \
    rm -rf /var/lib/apt/lists/*

# install Ruby
RUN cd /tmp && \
    wget -O ruby.tar.gz -q https://cache.ruby-lang.org/pub/ruby/3.1/ruby-$RUBY_VERSION.tar.gz && \
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
RUN pip3 install jupyter && \
    jupyter kernelspec remove -f python3 && \
    mkdir /root/.jupyter && \
    echo 'c.KernelSpecManager.ensure_native_kernel = False' > ~/.jupyter/jupyter_notebook_config.py

# install LibTorch
RUN cd /opt && \
    wget -O libtorch.zip -q https://download.pytorch.org/libtorch/cu113/libtorch-cxx11-abi-shared-with-deps-1.12.0%2Bcu113.zip && \
    unzip -q libtorch.zip && \
    rm libtorch.zip

# install gems
RUN gem install \
        ffi-rzmq \
        iruby \
        mini_magick \
        numo-narray \
        rice \
        && \
    gem install --verbose -v 0.11.1 torch-rb -- --with-torch-dir=/opt/libtorch && \
    gem install torchaudio -- --with-torch-dir=/opt/libtorch && \
    gem install torchrec torchtext torchvision && \
    iruby register

WORKDIR /notebooks

COPY torch-gpu/MNIST.ipynb ./

CMD ["jupyter", "notebook", "--no-browser", "--ip=0.0.0.0", "--allow-root"]
