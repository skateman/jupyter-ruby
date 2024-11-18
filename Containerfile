FROM quay.io/jupyter/base-notebook:latest

USER root
RUN apt-get update && apt-get install -y --no-install-recommends ruby-full build-essential libssl-dev libreadline-dev zlib1g-dev libzmq3-dev \
		   && apt-get clean \
		   && rm -rf /var/lib/apt/lists/* \
                   && gem install iruby \
                   && gem update irb \
                   && iruby register --force \
                   && chown -R ${NB_UID}:${NB_GID} /home/jovyan

USER ${NB_UID}

