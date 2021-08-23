import os
import yaml

with open("/etc/otel/config.yaml") as f:
    config = yaml.safe_load(f)
config["exporters"]["logzio"]["region"] = os.getenv("LOGZIO_REGION")
config["exporters"]["logzio"]["account_token"] = os.getenv("LOGZIO_TRACES_TOKEN")
with open("/etc/otel/config.yaml", "w") as f:
    yaml.dump(config, f)

