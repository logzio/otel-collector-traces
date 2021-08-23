# otel-collector-traces
Wrapped open telemetry collector image for traces

```
docker run \
-e LOGZIO_REGION=<<LOGZIO_REGION>> \
-e LOGZIO_TRACES_TOKEN=<<LOGZIO_TRACES_TOKEN>> \
-p 55678-55680:55678-55680 \
-p 6060:6060 \
-p 7276:7276 \
-p 9411:9411 \
-p 9943:9943 \
-p 1234:1234 \
-p 6831:6831 \
-p 6832:6832 \
-p 14250:14250 \
-p 14268:14268 \
-p 4317:4317 \
-p 5001:5001 \
-p 55681:55681 \
config-otel-py
```
