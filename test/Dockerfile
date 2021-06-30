FROM python:3.6.8-stretch as base

RUN apt-get update
RUN apt-get install -y curl
RUN curl -sL https://deb.nodesource.com/setup_12.x | bash -

RUN apt-get install -y nodejs sudo build-essential libssl-dev git cmake libtool-bin gettext 

WORKDIR /home/neoformat
ADD test/install_docker.sh test/
RUN test/install_docker.sh

ADD test/requirements.txt test/
RUN pip3 install -r test/requirements.txt


FROM base as nvim_source
ARG NVIM_VERSION
ENV NVIM_VERSION ${NVIM_VERSION:-0.3.5}
ARG NVIM_TARBALL
ENV NVIM_TARBALL ${NVIM_TARBALL:-v${NVIM_VERSION}.tar.gz}
WORKDIR /home/nvim
RUN wget https://github.com/neovim/neovim/archive/${NVIM_TARBALL} && \
    tar -zxvf ${NVIM_TARBALL} && \
    cd neovim-${NVIM_VERSION} && \
    make CMAKE_BUILD_TYPE=RelWithDebInfo &&  make install && \
    cd .. && rm -rf neovim-${NVIM_VERSION} ${NVIM_TARBALL}
WORKDIR /home/neoformat
ADD . .
CMD cd test && pytest -v test.py


FROM base as nvim_system
RUN apt-get install -y neovim
WORKDIR /home/neoformat
ADD . .
CMD cd test && pytest -v test.py


FROM base as vim_source
ARG VIM_VERSION
ENV VIM_VERSION ${VIM_VERSION:-8.1.1234}
ARG VIM_TARBALL
ENV VIM_TARBALL ${VIM_TARBALL:-v${VIM_VERSION}.tar.gz}
WORKDIR /home/vim
RUN wget https://github.com/vim/vim/archive/${VIM_TARBALL} && \
    tar -zxvf ${VIM_TARBALL} && \
    cd vim-${VIM_VERSION} && \
    ./configure && make install && \
    cd .. && rm -rf vim-${VIM_VERSION} ${VIM_TARBALL}
WORKDIR /home/neoformat
ADD . .
CMD cd test && pytest -v test.py
