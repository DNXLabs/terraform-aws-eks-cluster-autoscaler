# terraform-aws-eks-cluster-autoscaler

[![Lint Status](https://github.com/DNXLabs/terraform-aws-eks-cluster-autoscaler/workflows/Lint/badge.svg)](https://github.com/DNXLabs/terraform-aws-eks-cluster-autoscaler/actions)
[![LICENSE](https://img.shields.io/github/license/DNXLabs/terraform-aws-eks-cluster-autoscaler)](https://github.com/DNXLabs/terraform-aws-eks-cluster-autoscaler/blob/master/LICENSE)


Terraform module for deploying Kubernetes [Cluster Autoscaler](https://github.com/kubernetes/autoscaler/tree/master/cluster-autoscaler) inside a pre-existing EKS cluster. Cluster Autoscaler is a tool that automatically adjusts the size of the Kubernetes cluster when one of the following conditions is true:

- There are pods that failed to run in the cluster due to insufficient resources.
- There are nodes in the cluster that have been underutilized for an extended period of time and their pods can be placed on other existing nodes.

## Usage

```
module "cluster_autoscaler" {
  source = "git::https://github.com/DNXLabs/terraform-aws-eks-cluster-autoscaler.git"

  enabled = true

  cluster_name                     = module.eks_cluster.cluster_id
  cluster_identity_oidc_issuer     = module.eks_cluster.cluster_oidc_issuer_url
  cluster_identity_oidc_issuer_arn = module.eks_cluster.oidc_provider_arn
  aws_region                       = data.aws_region.current.name
}
```

<!--- BEGIN_TF_DOCS --->

<!--- END_TF_DOCS --->

## Authors

Module managed by [DNX Solutions](https://github.com/DNXLabs).

## License

Apache 2 Licensed. See [LICENSE](https://github.com/DNXLabs/terraform-aws-eks-cluster-autoscaler/blob/master/LICENSE) for full details.
