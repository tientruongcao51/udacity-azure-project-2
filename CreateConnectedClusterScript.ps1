# This script creates an Azure Arc resource to connect a Kubernetes cluster to Azure
# Documentation: https://aka.ms/AzureArcK8sDocs

# Log into Azure
az login

# Set Azure subscription
az account set --subscription 93f1e475-b364-4a28-b3cd-fd01e87b2d33

# Create connected cluster
az connectedk8s connect --name truongct2udacity --resource-group rs-group-us --location eastus --correlation-id c18ab9d0-685e-48e7-ab55-12588447b0ed     

docker build -t webapi . 
docker tag
docker push

docker login truongct2udacity.azurecr.io --username 00000000-0000-0000-0000-000000000000 --password 93f1e475-b364-4a28-b3cd-fd01e87b2d33 -p eyJhbGciOiJSUzI1NiIsInR5cCI6IkpXVCIsImtpZCI6IlZJUkk6S0ZZRToySVZHOlVOU0U6UEFEUTpYU0NQOkpXQU06WkFBRzpPN0FVOkU3NlU6SVBPUDoyNzQ3In0.eyJqdGkiOiJjYzRjNmVlOS1mZjQ5LTQ1MzMtODlhOS01MjUzOGEyMmYyMDQiLCJzdWIiOiJUcnVvbmdDVDJAZnNvZnQuY29tLnZuIiwibmJmIjoxNjYyMjIzOTA2LCJleHAiOjE2NjIyMzU2MDYsImlhdCI6MTY2MjIyMzkwNiwiaXNzIjoiQXp1cmUgQ29udGFpbmVyIFJlZ2lzdHJ5IiwiYXVkIjoidHJ1b25nY3QydWRhY2l0eS5henVyZWNyLmlvIiwidmVyc2lvbiI6IjEuMCIsInJpZCI6ImNhZGI5OGJlZDA4YzQ2NWQ5NjgwNDQ2ZDlkMGZmZWI5IiwiZ3JhbnRfdHlwZSI6InJlZnJlc2hfdG9rZW4iLCJhcHBpZCI6IjA0YjA3Nzk1LThkZGItNDYxYS1iYmVlLTAyZjllMWJmN2I0NiIsInRlbmFudCI6ImYwMWU5MzBhLWI1MmUtNDJiMS1iNzBmLWE4ODgyYjVkMDQzYiIsInBlcm1pc3Npb25zIjp7IkFjdGlvbnMiOlsicmVhZCIsIndyaXRlIiwiZGVsZXRlIiwiZGVsZXRlZC9yZWFkIiwiZGVsZXRlZC9yZXN0b3JlL2FjdGlvbiJdLCJOb3RBY3Rpb25zIjpudWxsfSwicm9sZXMiOltdfQ.W4-YaKGMDwp8Y23z4v_Kvhu4j-upQ1Q1UV0mFlMNUwUrQLbljMQNU00238YjX1TmcYJfmH4e5RuXgi36n7_C9QoSRCXDPPSeqE9-qpNQS9qVt7C420VNI8T5QOorET32I6m_sLM9jWtKD5WKGZlqKO-0JovEat9STZiu1DB3Ff_XxzckUyrYcZ4rrJ74AsjXVL7bp8-l5VhRgjM8w3HfSPkUbT4PeKbwX8aYB_0wlDrIrLTfeletA80e6wAaL51e-wYg7ZFIb41nHTnqbchgJc7ffKeHv8KXI_BL33LQR9GhLD84Yas03kxyF4NfN9vnUrc2hP22DY7zjPPC01hFew


# Needs 'az login'
# Create an Azure Kubernetes cluster
az aks create --name k8struongct2 --resource-group rs-group-us --node-count 2 --generate-ssh-keys --attach-acr truongct2udacity --location eastus 

# Get credentials for your container service
az aks get-credentials  --name k8struongct2  --resource-group rs-group-us