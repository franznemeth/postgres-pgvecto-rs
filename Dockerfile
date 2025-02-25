ARG BITNAMI_POSTGRES_TAG=15
FROM pgvector/pgvector:pg${BITNAMI_POSTGRES_TAG} AS builder

FROM bitnami/postgresql-repmgr:${BITNAMI_POSTGRES_TAG}

COPY --from=builder /usr/lib/postgresql/15/lib/vector.so /opt/bitnami/postgresql/lib/
COPY --from=builder /usr/share/postgresql/15/extension/vector* /opt/bitnami/postgresql/share/extension/
