Deployment -> ReplicaSet -> Pod

######
# PODS
######

# liga o pod definido em k8s/pod.yaml
kubectl apply -f k8s/pod.yaml

# lista todos os pods
kubectl get pods
kubectl get pod
kubectl get po

# deletes a pod
kubectl delete pod <NAME>

# debugging pod with bash
kubectl exec -it <POD_NAME> -- bash

# check pod's memory and cpu usage
kubectl top pod <POD_NAME>

# imprime as infos do pod
kubectl describe pod <NAME>

# adiciona um mapping da porta 8000 do host para a porta 80 do pod de nome pod/goserver
kubectl port-forward pod/goserver 8000:80

#############
# REPLICASETS
#############

# cria o replicaset
kubectl apply -f k8s/replicaset.yaml

# lista replicasets
kubectl get replicasets
kubectl get replicaset

# deletes a replicaset
kubectl delete replicaset <NAME>

#############
# DEPLOYMENTS
#############

# cria o deployment
kubectl apply -f k8s/deployment.yaml

# list todos os deployments
kubectl get deployments
kubectl get deployment

# deletes a deployment
kubectl delete deployment <NAME>

# describe a deployment
kubectl describe deployment <NAME>

# lista as versões do deployment
kubectl rollout history deployment <NAME>

# reverte o último deployment
kubectl rollout undo deployment goserver

# reverte o último deployment para uma versão específica
kubectl rollout undo deployment goserver --to-revision=<NUMBER>

# start with watch
kubectl apply -f k8s/deployment.yaml && watch -n1 kubectl get pods

##########
# SERVICES
##########

kubectl apply -f k8s/service.yaml

kubectl get services
kubectl get service
kubectl get svc

kubectl delete svc <NAME>

kubectl port-forward svc/goserver-service 9000:80

#########
# VOLUMES
#########

# check storage classes
# changes based on provider (AWS, GCP, etc)
kubectl get storageclass

# list persisent volume claims
kubectl get pvc

##########
# CONTEXTS
##########

# contexts is basically a cluster, user and namespace
kubectl config get-contexts

# change current context
kubectl config use-context <CONTEXT_NAME>

#####################################
# LIVENESS, READINESS, STARTUP PROBES
#####################################

LivenessProbe -> knows when to restart a container
ReadinessProbe -> knows when a container is ready to start accepting traffic
StartupProbe -> knows when an application has started

#############
# STRESS TEST
#############

# run a stress test with fortio
# -c -> connections
# -t -> how long to run
# -qps -> queries per second
kubectl run -it fortio --rm --image=fortio/fortio -- load -qps 800 -t 120s -c 70 "http://goserver-service/healthz"

########
# RANDOM
########

# lista os nodes
kubectl get nodes
kubectl get node
kubectl get no

# rodando a API do k8s
# http://localhost:8080/api/v1/namespaces/default/services/goserver-service
kubectl proxy --port=8080

# mostra todos os serviços disponíveis na API
kubectl get apiservices

# manualy scale pods
kubectl scale statefulset mysql --replicas=5
