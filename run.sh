Deployment -> ReplicaSet -> Pod

#########
# LISTING
#########

# lista replicasets
kubectl get replicasets
kubectl get replicaset

# lista todos os pods
kubectl get pods
kubectl get pod
kubectl get po

# list todos os deployments
kubectl get deployments
kubectl get deployment

##########
# STARTING
##########

# liga o pod definido em k8s/pod.yaml
kubectl apply -f k8s/pod.yaml

# cria o replicaset
kubectl apply -f k8s/replicaset.yaml

# cria o deployment
kubectl apply -f k8s/deployment.yaml

##########
# DELETING
##########

kubectl delete pod <NAME>

kubectl delete replicaset <NAME>

########
# RANDOM
########

# adiciona um mapping da porta 8000 do host para a porta 80 do pod de nome pod/goserver
kubectl port-forward pod/goserver 8000:80

# imprime as infos do pod
kubectl describe pod <NAME>
