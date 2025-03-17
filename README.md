# setup

### prereq
1. need nvidia gpu to run
2. make sure to have up to date nvidia drivers
### docker setup
1. create Dockerfile
```Dockerfile
 FROM nvidia/cuda:12.8.0-base-ubuntu22.04
# Install development tools and libraries
RUN apt-get update && apt-get install -y \
    build-essential \
    cmake \
    git \
    python3 \
    python3-pip \
    wget \
    gcc \
    g++ \
    curl \
    gdb \
    neovim \
    && rm -rf /var/lib/apt/lists/*

# Set up working directory
WORKDIR /workspace

RUN pip3 install numpy torch torchvision

# Set a default command
CMD ["/bin/bash"]
```

2. build image and run container (create aliases if you want)
Example:

```bash
# bashrc
alias buildlinuxdock='docker buildx build -t cuda-dev .'
alias runlinuxdock='docker run --gpus all -it --rm -v $(pwd):/workspace cuda-dev'
```
```bash
buildlinuxdock && runlinuxdock
```
3. access container from vscode (optional)
- Install Remote Development extension
- Bottom left click on the remote window icon "><" and select 'attach to running container'
- select the container you just ran via docker run and build the next 3T market cap company :>
