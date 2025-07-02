docker build -t arjunkhadka5docker/multi-client:latest -t arjunkhadka5docker/multi-client:$SHA -f ./client/Dockerfile ./client
docker build -t arjunkhadka5docker/multi-server:latest -t arjunkhadka5docker/multi-server:$SHA -f ./server/Dockerfile ./server
docker build -t arjunkhadka5docker/multi-worker:latest -t arjunkhadka5docker/multi-worker:$SHA -f ./worker/Dockerfile ./worker
docker push arjunkhadka5docker/multi-client:latest
docker push arjunkhadka5docker/multi-client:$SHA
docker push arjunkhadka5docker/multi-server:latest
docker push arjunkhadka5docker/multi-server:$SHA
docker push arjunkhadka5docker/multi-worker:latest
docker push arjunkhadka5docker/multi-worker:$SHA
kubectl apply -f k8s
kubectl set image deployments/server-deployment server=arjunkhadka5docker/multi-server:$SHA
kubectl set image deployments/client-deployment client=arjunkhadka5docker/multi-client:$SHA
kubectl set image deployments/worker-deployment worker=arjunkhadka5docker/multi-worker:$SHA

