variable "aws_region" {
  default = "ap-northeast-2"
} # provider 에서 사용하는 값(region 결정)

variable "cluster_name" {
  default = "tubeplus-eks-cluster" # cluster name
  type    = string
}