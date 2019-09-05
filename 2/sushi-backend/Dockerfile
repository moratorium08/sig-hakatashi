FROM rustlang/rust:nightly

RUN rustup toolchain uninstall nightly && rustup toolchain install nightly

RUN groupadd -r user && useradd -r -g user user -d /home/user
USER user

COPY --chown=user:user . /home/user/api

WORKDIR /home/user/api
EXPOSE 8000

RUN cargo run --release
