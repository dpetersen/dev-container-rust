FROM dpetersen/dev-container-base:v1.9
MAINTAINER Don Petersen <don@donpetersen.net>

RUN CACHE_BUST=1.29.1 curl https://sh.rustup.rs -sSf | sh -s -- -y

RUN export PATH=/home/dev/.cargo/bin:$PATH && \
# Racer needs rust-src for completion
  rustup component add rls-preview rust-analysis rust-src && \
# Racer needs nightly, at least for now. RLS needs Racer.
  rustup toolchain add nightly && \
  cargo +nightly install racer && \
  rustup toolchain remove nightly

COPY S99_cargo_unversioned /home/dev/.zsh.d/
