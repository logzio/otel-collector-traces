FROM alpine:latest as certs
RUN apk --update add ca-certificates && apk --no-cache add curl
RUN curl -L https://github.com/open-telemetry/opentelemetry-collector-releases/releases/download/v0.48.0/otelcol-contrib_0.48.0_linux_amd64.tar.gz -o otelcontribcol.tar.gz \
    && tar -xf otelcontribcol.tar.gz \
    && chmod +x otelcol-contrib
FROM python:3.10-slim
COPY ./otel-config.yml /etc/otel/config.yaml
RUN pip install pyyaml flask
COPY ./config.py config.py
COPY ./entrypoint.sh entrypoint.sh
COPY --from=certs /etc/ssl/certs/ca-certificates.crt /etc/ssl/certs/ca-certificates.crt
COPY --from=certs otelcol-contrib /otelcontribcol
EXPOSE 4317 55680 55679 8888 6060 7276 9411 9943 1234 6831 6832 14250 14268 4318 8888
RUN ["chmod", "+x", "/entrypoint.sh"]
ENTRYPOINT ["/entrypoint.sh"]

