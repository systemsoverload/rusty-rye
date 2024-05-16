FROM rust:1.74

ENV HOME="/home/user"
ENV PATH="$HOME/.rye/shims:$PATH"

RUN apt-get update \
	&& apt-get install -y --no-install-recommends \
		ca-certificates \
		curl \
		git \
	&& apt-get clean \
	&& rm -rf /var/lib/apt/lists/* \
	&& mkdir -p $HOME

RUN curl -sSf https://rye-up.com/get | RYE_INSTALL_OPTION="--yes" bash

CMD ["rye", "--version"]

