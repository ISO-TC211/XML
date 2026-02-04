#!/bin/sh

# validation using https://www.npmjs.com/package/ajv-cli and https://www.npmjs.com/package/ajv-formats
# NOTE: strict must be false, otherwise "$anchor" is not recognized; see https://github.com/ajv-validator/ajv/issues/1854

ajv validate -d C1-19115-4-JSON-example.json -s "19115-4.json" --spec=draft2020 --validateFormats=true --strict=false -c ajv-formats -r "mdj.json" -r "dqc.json" -r "Feature.json"
