FROM quay.io/jupyter/base-notebook:latest

USER root
RUN apt-get update && apt-get install -y --no-install-recommends ruby-full build-essential libssl-dev libreadline-dev zlib1g-dev \
		   && apt-get clean \
		   && rm -rf /var/lib/apt/lists/*

RUN gem install iruby
RUN iruby register --force

USER ${NB_UID}

