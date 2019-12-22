FROM cardboardci/ci-core@sha256:5b93f4c8cc1ddaa809f9c27d0a865a974ccb43e5e3d38334df1b0d77ea1843fb
USER root

ARG DEBIAN_FRONTEND=noninteractive

ARG VERSION=v1.17.2

COPY provision/pkglist /cardboardci/pkglist
RUN apt-get update \
    && xargs -a /cardboardci/pkglist apt-get install -y \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

ADD https://github.com/lukasmartinelli/hadolint/releases/download/v${VERSION}/hadolint_linux_amd64 /usr/bin/hadolint
RUN chmod +x /usr/bin/hadolint

USER cardboardci
##
## Image Metadata
##
ARG build_date
ARG version
ARG vcs_ref
LABEL maintainer="CardboardCI"
LABEL org.label-schema.schema-version="1.0"
LABEL org.label-schema.name="hadolint"
LABEL org.label-schema.version="${version}"
LABEL org.label-schema.build-date="${build_date}"
LABEL org.label-schema.release="CardboardCI version:${version} build-date:${build_date}"
LABEL org.label-schema.vendor="cardboardci"
LABEL org.label-schema.architecture="amd64"
LABEL org.label-schema.summary="Dockerfile linter"
LABEL org.label-schema.description="Dockerfile linter, validate inline bash, written in Haskell"
LABEL org.label-schema.url="https://gitlab.com/cardboardci/images/hadolint"
LABEL org.label-schema.changelog-url="https://gitlab.com/cardboardci/images/hadolint/releases"
LABEL org.label-schema.authoritative-source-url="https://cloud.docker.com/u/cardboardci/repository/docker/cardboardci/hadolint"
LABEL org.label-schema.distribution-scope="public"
LABEL org.label-schema.vcs-type="git"
LABEL org.label-schema.vcs-url="https://gitlab.com/cardboardci/images/hadolint"
LABEL org.label-schema.vcs-ref="${vcs_ref}"
