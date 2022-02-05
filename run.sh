# liga o pod definido em k8s/pod.yaml
kubectl apply -f k8s/pod.yaml

# lista todos os pods
kubectl get pods
kubectl get pod
kubectl get po

# adiciona um mapping da porta 8000 do host para a porta 80 do pod de nome pod/goserver
kubectl port-forward pod/goserver 8000:80

# deleta o pod de nome `goserver`
kubectl delete pod goserver

# cria o replicaset
kubectl apply -f k8s/replicaset.yaml

# lista replicasets
kubectl get replicasets
