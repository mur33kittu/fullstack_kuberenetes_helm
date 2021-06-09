echo "Creating Dashboard"
kubectl apply -f dashboard-admin.yaml
echo "Getting Secret key...."
secretKey=$(kubectl get secret -n kubernetes-dashboard $(kubectl get serviceaccount admin-user -n kubernetes-dashboard -o jsonpath="{.secrets[0].name}") -o jsonpath="{.data.token}" | base64 --decode)
echo "Starting dashboard. use the below token to connect to dashboard"
echo $secretKey
kubectl proxy

echo "To delete a dashboard issue below commands"
echo "kubectl delete -f dashboard-admin.yaml"