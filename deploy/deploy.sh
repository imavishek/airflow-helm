#!/bin/bash

helm upgrade --install airflow airflow/ --values airflow/values.yaml

echo 192.168.99.100:`kubectl describe service airflow-web | grep NodePort | sed -n 's/.*web  \([0-9]\+\)\/TCP/\1/p' `