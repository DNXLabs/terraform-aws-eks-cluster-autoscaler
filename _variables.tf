variable "enabled" {
  type        = bool
  default     = true
  description = "Variable indicating whether deployment is enabled."
}

variable "cluster_name" {
  type        = string
  description = "The name of the cluster"
}

variable "aws_region" {
  type        = string
  description = "AWS region where secrets are stored."
}

variable "cluster_identity_oidc_issuer" {
  type        = string
  description = "The OIDC Identity issuer for the cluster."
}

variable "cluster_identity_oidc_issuer_arn" {
  type        = string
  description = "The OIDC Identity issuer ARN for the cluster that can be used to associate IAM roles with a service account."
}

variable "service_account_name" {
  type        = string
  default     = "cluster-autoscaler"
  description = "Cluster Autoscaler service account name"
}

variable "helm_chart_name" {
  type        = string
  default     = "cluster-autoscaler"
  description = "Cluster Autoscaler Helm chart name to be installed"
}

variable "helm_chart_release_name" {
  type        = string
  default     = "cluster-autoscaler"
  description = "Helm release name"
}

variable "fullname_override" {
  type        = string
  default     = "aws-cluster-autoscaler"
  description = "Helm fullnameOverride"
}

variable "helm_chart_version" {
  type        = string
  default     = "9.9.2"
  description = "Cluster Autoscaler Helm chart version."
}

variable "helm_chart_repo" {
  type        = string
  default     = "https://kubernetes.github.io/autoscaler"
  description = "Cluster Autoscaler repository name."
}

variable "create_namespace" {
  type        = bool
  default     = true
  description = "Whether to create Kubernetes namespace with name defined by `namespace`."
}

variable "namespace" {
  type        = string
  default     = "kube-system"
  description = "Kubernetes namespace to deploy Cluster Autoscaler Helm chart."
}

variable "mod_dependency" {
  default     = null
  description = "Dependence variable binds all AWS resources allocated by this module, dependent modules reference this variable."
}

variable "settings" {
  default     = {}
  description = "Additional settings which will be passed to the Helm chart values."
}