FROM quay.io/jupyter/base-notebook:latest

# Install Ruby and dependencies
USER root
RUN apt-get update && apt-get install -y --no-install-recommends ruby-full build-essential libssl-dev libreadline-dev zlib1g-dev \
		   && apt-get clean \
		   && rm -rf /var/lib/apt/lists/*

# Install IRuby kernel
RUN gem install iruby
RUN iruby register --force

# Switch back to notebook user
USER ${NB_UID}

