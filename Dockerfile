ARG BITNAMI_POSTGRES_TAG=15.10.0
FROM pgvector/pgvector:pg15 AS builder

FROM bitnami/postgresql:${BITNAMI_POSTGRES_TAG}

COPY --from=builder /usr/lib/postgresql/15/lib/vector.so /opt/bitnami/postgresql/lib/
COPY --from=builder /usr/share/postgresql/15/extension/vector* /opt/bitnami/postgresql/share/extension/
