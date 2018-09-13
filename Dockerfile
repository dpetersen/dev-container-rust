FROM dpetersen/dev-container-base:v1.8
MAINTAINER Don Petersen <don@donpetersen.net>

RUN CACHE_BUST=1.29.0 curl https://sh.rustup.rs -sSf | sh -s -- -y

# You should probably check this periodically to see if Racer stops requiring
# rust nightly
RUN export PATH=/home/dev/.cargo/bin:$PATH && \
# Racer needs rust-src for completion
  rustup component add rust-src && \
  rustup toolchain add nightly && \
  cargo +nightly install racer && \
  rustup toolchain remove nightly

COPY S99_cargo_unversioned /home/dev/.zsh.d/
