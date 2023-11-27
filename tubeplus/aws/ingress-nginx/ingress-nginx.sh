# name space 만들기
kubectl create ns ingress-nginx

# helm 이용해서 설치
helm upgrade --install ingress-nginx ingress-nginx \
  --repo https://kubernetes.github.io/ingress-nginx \
  --namespace ingress-nginx --create-namespace

# 포트 확인
kubectl -n ingress-nginx get pod -o yaml


# 
kubectl apply -f https://raw.githubusercontent.com/kubernetes/ingress-nginx/controller-v1.8.2/deploy/static/provider/aws/deploy.yaml