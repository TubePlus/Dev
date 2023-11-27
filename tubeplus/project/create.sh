kubectl create namespace etc
kubectl create namespace community
kubectl create namespace user
kubectl create namespace board
# 서비스 생성
kubectl apply -f service/service-nodeport.yaml

# CONFIG MAP 생성
kubectl create configmap port-config -n board --from-file=configs/BOARD_HTTP_PORT 
kubectl create configmap port-config -n community --from-file=configs/COMMUNITY_HTTP_PORT 
kubectl create configmap port-config -n etc --from-file=configs/ETC_HTTP_PORT 
kubectl create configmap port-config -n user --from-file=configs/USER_HTTP_PORT 


# 각 네임스페이스의 port-config 라는 ConfigMap 조회
kubectl get configmap port-config -n board
kubectl get configmap port-config -n community
kubectl get configmap port-config -n etc
kubectl get configmap port-config -n user

# diployment 배포
kubectl apply -f deployment/deployment-board.yaml
kubectl apply -f deployment/deployment-etc.yaml
kubectl apply -f deployment/deployment-community.yaml
kubectl apply -f deployment/deployment-user.yaml
# 2-3. order 디플로이먼트 조회
kubectl get deployment -n etc

# 2-5. order-app 서비스(80)를 통한 order 파드 응답 확인
kubectl port-forward service/etc-app 8080:80 -n etc
curl localhost:8080

# 응답 확인하기
curl --request GET http://localhost:8080/etc/welcome \
--header 'Content-Type: application/json' \