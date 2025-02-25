ARG BITNAMI_POSTGRES_TAG=15
FROM pgvector/pgvector:pg${BITNAMI_POSTGRES_TAG} AS builder

FROM bitnami/postgresql-repmgr:${BITNAMI_POSTGRES_TAG}

COPY --from=builder /usr/lib/postgresql/${BITNAMI_POSTGRES_TAG}/lib/vector.so /opt/bitnami/postgresql/lib/
COPY --from=builder /usr/share/postgresql/${BITNAMI_POSTGRES_TAG}/extension/vector* /opt/bitnami/postgresql/share/extension/
