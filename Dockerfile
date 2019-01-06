FROM hadolint/hadolint:v1.15.0 AS official 
FROM alpine:3.8
COPY --from=official /bin/hadolint /bin/hadolint