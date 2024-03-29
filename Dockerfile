FROM registry.access.redhat.com/ubi9 AS ubi-micro-build
RUN mkdir -p /mnt/rootfs
RUN dnf install --installroot /mnt/rootfs curl jq --releasever 9 --setopt install_weak_deps=false --nodocs -y && \
    dnf --installroot /mnt/rootfs clean all && \
    rpm --root /mnt/rootfs -e --nodeps setup

# -----------------------------------------------------------------

FROM quay.io/keycloak/keycloak:23.0.3
COPY --from=ubi-micro-build /mnt/rootfs /

ENV KC_HEALTH_ENABLED true

HEALTHCHECK --retries=10 --timeout=20s \
  CMD curl --head -fsS http://localhost:8080/health/ready || exit 1

