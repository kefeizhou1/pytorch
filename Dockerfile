# 1. 拉取运行时环境
FROM bitnami/pytorch:1.11.0-debian-10-r50
# 2. 设定workdir
WORKDIR /temp
# 3. 安装必要依赖比如git
RUN apt update && \
    apt install -y \
        wget build-essential zlib1g-dev libncurses5-dev libgdbm-dev libnss3-dev libssl-dev \
        libreadline-dev libffi-dev libsqlite3-dev libbz2-dev liblzma-dev git && \
    apt clean && \
    rm -rf /var/lib/apt/lists/*
# 4. git拉取代码仓库，这里面的代码就是你写的flask后端代码和前端代码
RUN git clone https://github.com/kefeizhou1/pytorch.git
# 5. 设定工作目录为拉取后的目录
WORKDIR /temp/pytorch
# 6. 运行index.py或者index.html
RUN python index.py

