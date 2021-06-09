Prerequisites to run the app locally.

install docker desktop
install hyperv to run minikube
install minikube
install kubectl 

next steps:

1.) create VM in hyperv with name minikube
2.) minikube start
3.) cd kubernetes-dashboard
4.) run ./setup.sh to create dashboard
5.) take secret key and provide the token to login using http://localhost:8081
6.) go to redis folder
7.) ./setup.sh to install sentinel redis using helm and can verify the same in kubernetes dashboard
8.) go to back-end folder
9.) run ./setup.sh . (it will perform below steps.)
    a.) create container for backend service
    b.) login into docker
    c.) push the container to docker
    d.) create helm charts for deployment
    e.) install the docker container into kubernetes by creating a pod
10.) go to react-app folder(take from different github for frontend)
        https://github.com/mur33kittu/fullstack_kuberenetes_helm_frontend
    a.) docker run -i -t --rm -p 3001:80 mur33kittu/react-app to test the docker running locally and can be access in
        http://localhost:3001
    b.) once u are able to acess react webpage, go to step 11.
11.) run ./setup.sh will do the same that was done by step 9.
12.) verify kubernetes dashboard to see verify all are deployed
13.) COmmunication between different pods and a fullstack.

    