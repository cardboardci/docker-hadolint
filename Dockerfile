FROM hadolint/hadolint:v1.15.0 AS official 
FROM alpine:3.8
COPY --from=official /bin/hadolint /bin/hadolint

##
## Image Metadata
##
ARG build_date
ARG version
ARG vcs_ref
LABEL maintainer = "CardboardCI" \
    \
    org.label-schema.schema-version = "1.0" \
    \
    org.label-schema.name = "hadolint" \
    org.label-schema.version = "${version}" \
    org.label-schema.build-date = "${build_date}" \
    org.label-schema.release= = "CardboardCI version:${version} build-date:${build_date}" \
    org.label-schema.vendor = "cardboardci" \
    org.label-schema.architecture = "amd64" \
    \
    org.label-schema.summary = "Dockerfile linter" \
    org.label-schema.description = "Dockerfile linter, validate inline bash, written in Haskell" \
    \
    org.label-schema.url = "https://gitlab.com/cardboardci/images/hadolint" \
    org.label-schema.changelog-url = "https://gitlab.com/cardboardci/images/hadolint/releases" \
    org.label-schema.authoritative-source-url = "https://cloud.docker.com/u/cardboardci/repository/docker/cardboardci/hadolint" \
    org.label-schema.distribution-scope = "public" \
    org.label-schema.vcs-type = "git" \
    org.label-schema.vcs-url = "https://gitlab.com/cardboardci/images/hadolint" \
    org.label-schema.vcs-ref = "${vcs_ref}" \