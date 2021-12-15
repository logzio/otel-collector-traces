#!/bin/bash
python config.py
chmod +x otelcontribcol
./otelcontribcol --config /etc/otel/config.yaml
