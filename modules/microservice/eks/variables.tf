#pass variables from module vpc to aurora module
variable "subnet_id" {}

variable "Name_EKS" {
  description = "Name EKS Cluster"
  type        = string
  default     = "EKS-env"
}

variable "Version_EKS" {
  description = "Version EKS"
  type        = number
  default     = 1.31
}

variable "Authentication_Mode_EKS" {
  description = "Authentication Mode EKS"
  type        = string
  default     = "API_AND_CONFIG_MAP"
}

variable "Name_EKS_Role" {
  description = "Name EKS Role"
  type        = string
  default     = "EKS-Role-env"
}


variable "Name_Node_Group_EKS" {
  description = "Name Node Group"
  type        = string
  default     = "EKS-Node-Group-env"
}

variable "Capacity_Node_Group_EKS" {
  description = "Capacity type"
  type        = string
  default     = "ON_DEMAND"
}

variable "Instance_Type_Node_Group_EKS" {
  description = "Instance type"
  type        = string
  default     = "t3.medium"
}

variable "Desired_Size_Node_Group_EKS" {
  description = "Desired Size Node"
  type        = number
  default     = 2
}

variable "Max_Size_Node_Group_EKS" {
  description = "Max Size Node"
  type        = number
  default     = 2
}

variable "Min_Size_Node_Group_EKS" {
  description = "Min Size Node"
  type        = number
  default     = 2
}

variable "label_Node_Group_EKS" {
  description = "Labeld Node"
  type        = string
  default     = "prod"
}

variable "Name_EKS_Node_Role" {
  description = "Name Node role"
  type        = string
  default     = "EKS-Node-Role-env"
}