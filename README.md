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

## Requirements

| Name | Version |
|------|---------|
| terraform | >= 0.13 |
| aws | >= 3.13, < 4.0 |
| helm | >= 1.0, < 1.4.0 |
| kubernetes | >= 1.10.0 |

## Providers

| Name | Version |
|------|---------|
| aws | >= 3.13, < 4.0 |
| helm | >= 1.0, < 1.4.0 |
| kubernetes | >= 1.10.0 |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| aws\_region | AWS region where secrets are stored. | `string` | n/a | yes |
| cluster\_identity\_oidc\_issuer | The OIDC Identity issuer for the cluster. | `string` | n/a | yes |
| cluster\_identity\_oidc\_issuer\_arn | The OIDC Identity issuer ARN for the cluster that can be used to associate IAM roles with a service account. | `string` | n/a | yes |
| cluster\_name | The name of the cluster | `string` | n/a | yes |
| create\_namespace | Whether to create Kubernetes namespace with name defined by `namespace`. | `bool` | `true` | no |
| enabled | Variable indicating whether deployment is enabled. | `bool` | `true` | no |
| helm\_chart\_name | Cluster Autoscaler Helm chart name to be installed | `string` | `"cluster-autoscaler"` | no |
| helm\_chart\_release\_name | Helm release name | `string` | `"cluster-autoscaler"` | no |
| helm\_chart\_repo | Cluster Autoscaler repository name. | `string` | `"https://kubernetes.github.io/autoscaler"` | no |
| helm\_chart\_version | Cluster Autoscaler Helm chart version. | `string` | `"9.3.0"` | no |
| mod\_dependency | Dependence variable binds all AWS resources allocated by this module, dependent modules reference this variable. | `any` | `null` | no |
| namespace | Kubernetes namespace to deploy Cluster Autoscaler Helm chart. | `string` | `"kube-system"` | no |
| service\_account\_name | Cluster Autoscaler service account name | `string` | `"cluster-autoscaler"` | no |
| settings | Additional settings which will be passed to the Helm chart values. | `map(any)` | `{}` | no |

## Outputs

No output.

<!--- END_TF_DOCS --->

## Authors

Module managed by [DNX Solutions](https://github.com/DNXLabs).

## License

Apache 2 Licensed. See [LICENSE](https://github.com/DNXLabs/terraform-aws-eks-cluster-autoscaler/blob/master/LICENSE) for full details.
