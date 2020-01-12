#!/bin/bash

kubectl apply -f airflow/tiller.yaml

helm upgrade --install airflow airflow/ --namespace airflow --values airflow/values.yaml

echo 192.168.99.100:`kubectl describe service airflow-web --namespace=airflow | grep NodePort | sed -n 's/.*web  \([0-9]\+\)\/TCP/\1/p' `