variable "customer_name" {
  description = "The name of the customer, used for the root management group. This will be transformed to lowercase and spaces replaced by dashes."
  type        = string
}

variable "hub_subscription_id" {
  description = "The subscription ID to be assigned to the Connectivity management group."
  type        = string
}

variable "mgmt_subscription_id" {
  description = "The subscription ID to be assigned to the Management management group."
  type        = string
}

variable "id_subscription_id" {
  description = "The subscription ID to be assigned to the Identity management group."
  type        = string
}

variable "prod_subscription_id" {
  description = "The subscription ID to be assigned to the Corp management group for production workloads."
  type        = string
}

variable "dev_subscription_id" {
  description = "The subscription ID to be assigned to the Corp management group for development workloads."
  type        = list(string)
  default     = [] # Default to an empty list if not specified
}

variable "uat_subscription_id" {
  description = "The subscription ID to be assigned to the Corp management group for UAT workloads."
  type        = list(string)
  default     = [] # Default to an empty list if not specified
}

