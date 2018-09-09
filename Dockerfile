FROM dpetersen/dev-container-base:v1.8
MAINTAINER Don Petersen <don@donpetersen.net>

RUN curl https://sh.rustup.rs -sSf | sh -s -- -y

COPY S99_cargo_unversioned /home/dev/.zsh.d/
