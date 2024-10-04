#!/bin/bash
docker run --rm --link pgs_cohmetrix:pgs_cohmetrix -v /app/text_metrics:/opt/text_metrics python_app bash -c "python3 run_min.py \"$1\""