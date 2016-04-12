# Pull base image.
FROM chainlex/eris-base
MAINTAINER Eris Industries <support@erisindustries.com>

#-----------------------------------------------------------------------------
# dependencies
RUN apt-get update && \
  apt-get install -y --no-install-recommends \
    libgmp3-dev jq && \
  rm -rf /var/lib/apt/lists/*

#-----------------------------------------------------------------------------
# install epm

# set the repo and install epm
ENV REPO $GOPATH/src/github.com/eris-ltd/eris-pm
COPY . $REPO
WORKDIR $REPO/cmd/epm
RUN go build -o /usr/local/bin/epm
RUN chown --recursive $USER:$USER $REPO

#-----------------------------------------------------------------------------
# root dir

# persist data, set user
RUN chown --recursive $USER:$USER /home/$USER
VOLUME /home/$USER/.eris
WORKDIR /home/$USER/.eris
USER $USER
CMD ["epm", "--chain", "chain:46657", "--sign", "keys:4767" ]
