NAMESPACE=aahva-namespace
echo "Starting deployment of backend server"
echo "Building the app into an container"
docker build . -t mur33kittu/back-end
echo "List all images"
docker images
echo "connecting to docker hub"
docker login
echo "pushing to docker"
docker push mur33kittu/back-end
echo "creating the helm chart for deployment to kubernetes"
helm create back-end-chart
cd back-end-chart
echo "updating dependencies"
helm dependency update
cd ..
helm repo update
echo "deploying app using helm"
helm install backend -n $NAMESPACE back-end-chart --debug

#   export POD_NAME=$(kubectl get pods --namespace aahva-namespace -l "app.kubernetes.io/name=back-end-chart,app.kubernetes.io/instance=backend" -o jsonpath="{.items[0].metadata.name}")
#   export CONTAINER_PORT=$(kubectl get pod --namespace aahva-namespace $POD_NAME -o jsonpath="{.spec.containers[0].ports[0].containerPort}")
#   echo "Visit http://127.0.0.1:8080 to use your application"
#   kubectl --namespace aahva-namespace port-forward $POD_NAME 8080:$CONTAINER_PORT
kubectl get all --namespace $NAMESPACE