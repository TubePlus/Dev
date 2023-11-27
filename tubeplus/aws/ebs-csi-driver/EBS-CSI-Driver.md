# AWS EBS CSI Driver 설치 방법

oidc : oidc.eks.ap-northeast-2.amazonaws.com/id/18457520CEF1D01F9FD82B754CF11A62
(1) IAM Role 및 EKS내 서비스 어카운트 생성
* 명령어
```
eksctl create iamserviceaccount \
    --name ebs-csi-controller-sa \
    --namespace kube-system \
    --cluster tubeplus-eks-cluster \
    --role-name AmazonEKS_EBS_CSI_DriverRole \
    --role-only \
    --attach-policy-arn arn:aws:iam::aws:policy/service-role/AmazonEBSCSIDriverPolicy \
    --approve
```

(2) eksctl 애드온을 통한 설치
* 명령어
```
eksctl create addon --name tubeplus-aws-ebs-csi-driver --cluster tubeplus-eks-cluster --service-account-role-arn arn:aws:iam::928933996765:role/AmazonEKS_EBS_CSI_DriverRole --force

$ eksctl create addon --name tubeplus-aws-ebs-csi-driver --cluster tubeplus-eks-cluster \
    --service-account-role-arn arn:aws:iam::928933996765:role/AmazonEBSCSIDriverPolicyClusterN --force

    eksctl create addon --name tubeplus-aws-ebs-csi-driver --cluster tubeplus-eks-cluster --service-account-role-arn arn:aws-us-gov:iam::928933996765:role/AmazonEKS_EBS_CSI_DriverRole --force

    eksctl delete addon --cluster tubeplus-eks-cluster --name tubeplus-aws-ebs-csi-driver --preserve
```
kubectl delete -k "github.com/kubernetes-sigs/aws-ebs-csi-driver/deploy/kubernetes/overlays/stable/?ref=release-1.28"

aws eks create-addon --cluster-name tubeplus-eks-cluster --addon-name tubeplus-aws-ebs-csi-driver \
  --service-account-role-arn arn:aws:iam::928933996765:role/AmazonEKS_EBS_CSI_DriverRole

(3) eksctl 애드온을 통한 설치 상태 확인
* 명령어
```
$ eksctl get addon --name tubeplus-aws-ebs-csi-driver --cluster tubeplus-eks-cluster
```

(4) AWS EBS CSI Driver 설치 확인
* 명령어
```
$ kubectl get pods -n kube-system | grep ebs-csi-controller
```