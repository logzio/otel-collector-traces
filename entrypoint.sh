#!/bin/bash
python config.py
./otelcontribcol --config /etc/otel/config.yaml & python api.py
