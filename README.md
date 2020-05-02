# ml-stack

:fire: Machine learning Docker images for Ruby

Spin up a machine learning environment in a single command

## Getting Started

- [Docker](#docker)
- [Paperspace](#paperspace)

### Docker

Start a container

```sh
docker run -p 8888:8888 ankane/ml-stack:standard
```

And visit `http://127.0.0.1:8888/?token=...`.

Share a volume with the container

```sh
-v /path/on/host:/notebooks
```

For GPU images, install the NVIDIA driver and [container toolkit](https://github.com/NVIDIA/nvidia-docker) on the host machine. Then use:

```sh
--gpus all
```

### Paperspace

Use a [custom container](https://docs.paperspace.com/gradient/notebooks/notebook-containers) for your notebook. Set the container name to the image you want to use, like:

```text
ankane/ml-stack:torch-gpu
```

And leave the other fields in that section blank.

## Images

There are a few images to choose from:

- [Standard](#standard)
- [Torch GPU](#torch-gpu)

### Standard

Tag: `standard`

- [Daru](https://github.com/SciRuby/daru)
- [fastText](https://github.com/ankane/fastText)
- [LIBMF](https://github.com/ankane/libmf)
- [LightGBM](https://github.com/ankane/lightgbm)
- [Numo](https://github.com/ruby-numo/numo-narray)
- [Nyaplot](https://github.com/domitry/nyaplot)
- [Prophet](https://github.com/ankane/prophet)
- [Rumale](https://github.com/yoshoku/rumale)
- [XGBoost](https://github.com/ankane/xgb)
- [xLearn](https://github.com/ankane/xlearn)

### Torch GPU

Tag: `torch-gpu`

Designed for deep learning with Torch

- [Torch.rb](https://github.com/ankane/torch.rb)
- [TorchVision](https://github.com/ankane/torchvision)

## Contributing

Everyone is encouraged to help improve this project. Here are a few ways you can help:

- [Report bugs](https://github.com/ankane/ml-stack/issues)
- Fix bugs and [submit pull requests](https://github.com/ankane/ml-stack/pulls)
- Write, clarify, or fix documentation
- Suggest or add new features

To get started with development:

```sh
git clone https://github.com/ankane/ml-stack.git
cd ml-stack

# build specific images
docker build -f standard/Dockerfile -t ankane/ml-stack:standard .
docker build -f torch-gpu/Dockerfile -t ankane/ml-stack:torch-gpu .
```
