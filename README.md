# otel-collector-traces

This docker container runs OpenTelemetry collector with the most common receivers (`jaeger` `opencensus` `otlp` `zipkin`) and exports traces to Logz.io
Current OpenTelmetry exec version: 0.42.0

### Pull docker image:

```
docker pull logzio/otel-collector-traces
```

### Run the container

When running on a Linux host, use the `--network host` flag to publish the collector ports:

```
docker run \
-e LOGZIO_REGION=<<LOGZIO_REGION>> \
-e LOGZIO_TRACES_TOKEN=<<LOGZIO_TRACES_TOKEN>> \
--network host \
logzio/otel-collector-traces
```

When running on MacOS or Windows hosts, publish the ports using the `-p` flag:

```
docker run \
-e LOGZIO_REGION=<<LOGZIO_REGION>> \
-e LOGZIO_TRACES_TOKEN=<<LOGZIO_TRACES_TOKEN>> \
-p 55678-55680:55678-55680 \
-p 1777:1777 \
-p 9411:9411 \
-p 9943:9943 \
-p 6831:6831 \
-p 6832:6832 \
-p 14250:14250 \
-p 14268:14268 \
-p 4317:4317 \
-p 55681:55681 \
logzio/otel-collector-traces
```

### receiver ports

- Jaeger
    - thrift_compact -> 6831
    - thrift_binary -> 6832
    - grpc -> 14250
    - thrift_http -> 14268

- Opencensus
    - 55678
    
- Otlp
    - grpc -> 4317
    - http -> 55681

- Zipkin
    - 9411


