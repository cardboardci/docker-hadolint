FROM hadolint/hadolint:latest AS official 
FROM alpine:latest
COPY --from=official /bin/hadolint /bin/hadolint