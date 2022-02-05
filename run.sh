Deployment -> ReplicaSet -> Pod

# lista os nodes
kubectl get nodes

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

##########
# SERVICES
##########

kubectl apply -f k8s/service.yaml

kubectl get services
kubectl get service
kubectl get svc

kubectl delete svc <NAME>

kubectl port-forward svc/goserver-service 9000:80

#######
# OTHER
#######

# adiciona um mapping da porta 8000 do host para a porta 80 do pod de nome pod/goserver
kubectl port-forward pod/goserver 8000:80

# imprime as infos do pod
kubectl describe pod <NAME>

# rodando a API do k8s
# http://localhost:8080/api/v1/namespaces/default/services/goserver-service
kubectl proxy --port=8080
