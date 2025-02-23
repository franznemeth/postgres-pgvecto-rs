ARG BITNAMI_POSTGRES_TAG=15.10.0-debian-12-r2
FROM busybox AS builder
ADD https://github.com/tensorchord/pgvecto.rs/releases/download/v0.2.1/vectors-pg15_x86_64-unknown-linux-gnu_0.2.1.zip /tmp/vectors.zip
RUN unzip /tmp/vectors.zip -d /tmp/vectors


FROM docker.io/bitnami/postgresql:${BITNAMI_POSTGRES_TAG}

USER root
COPY --from=builder /tmp/vectors/vectors.so /opt/bitnami/postgresql/lib/
COPY --from=builder /tmp/vectors/vectors--* /opt/bitnami/postgresql/share/extension/
COPY --from=builder /tmp/vectors/vectors.control /opt/bitnami/postgresql/share/extension/

USER 1001
