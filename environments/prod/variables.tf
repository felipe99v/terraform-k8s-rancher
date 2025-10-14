#VPC Variables
variable "Name_VPC" {
  type        = string
  description = "Name of vpc to prod envorioment"
  default     = "VPC-terraform-k8s-rancher-Prod"
}
variable "CIDR_VPC" {
  description = "CIDR Block to Prod vpc"
  default     = "10.20.0.0/16"
}

variable "Name_Public_Subnet" {
  description = "Name Public Subnet"
  type        = string
  default     = "Public-Subnet-Prod"
}

variable "Name_private_app_Subnet" {
  description = "Name private app Subnet"
  type        = string
  default     = "APP-Private-Subnet-Prod"
}

variable "Name_private_db_Subnet" {
  description = "Name private db Subnet"
  type        = string
  default     = "DB-Private-Subnet-Prod"
}

variable "public_subnet_cidrs" {
  type        = list(string)
  description = "Public APP Subnet CIDR values"
  default     = ["10.20.1.0/24", "10.20.2.0/24"]
}

variable "private_subnet_cidrs" {
  type        = list(string)
  description = "Private APP Subnet CIDR values"
  default     = ["10.20.3.0/24", "10.20.4.0/24"]
}

variable "private_subnet_DB_cidrs" {
  type        = list(string)
  description = "Private Balancer Subnet CIDR values"
  default     = ["10.20.5.0/24", "10.20.6.0/24", "10.20.7.0/24"]
}

variable "Name_IG" {
  description = "Name Internet Gateway"
  type        = string
  default     = "terraform-k8s-rancher-IG-Prod"
}

variable "Name_public_RT" {
  description = "Name Public Route Table"
  type        = string
  default     = "RT-Public-Prod"
}

variable "Name_private_RT" {
  description = "Name Private Route Table"
  type        = string
  default     = "RT-Private-APP-Prod"
}

variable "Name_private_BD_RT" {
  description = "Name Private BD Route Table"
  type        = string
  default     = "RT-Private-DB-Prod"
}

variable "Name_Nat" {
  description = "Name Nat Gateway"
  type        = string
  default     = "terraform-k8s-rancher-NAT-Prod"
}

variable "Create_Nat_Gateway" {
  description = "Allow Nat Gateway"
  type        = bool
  default     = true #false default
}

#EKS Variables
variable "Name_EKS" {
  description = "Name EKS Cluster"
  type        = string
  default     = "terraform-k8s-rancher-Cluster-Prod"
}

variable "Version_EKS" {
  description = "Version EKS"
  type        = number
  default     = 1.33
}

variable "Name_EKS_Role" {
  description = "Name VPC"
  type        = string
  default     = "terraform-k8s-rancher-EKS-Role-Prod"
}

variable "Authentication_Mode_EKS" {
  description = "Authentication Mode EKS"
  type        = string
  default     = "API_AND_CONFIG_MAP"
}

variable "Name_Node_Group_EKS" {
  description = "Name Node Group"
  type        = string
  default     = "EKS-Node-Group-Prod"
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
  default     = "EKS-Node-Role-Prod"
}

variable "eks_principal_access" {
  description = "ARN principal access"
  type        = string
  default     = "arn:aws:iam::363664571315:user/fvarela@produccion"
}

variable "access_entry_policy_access" {
  description = "ARN policy access"
  type        = string
  default     = "arn:aws:eks::aws:cluster-access-policy/AmazonEKSClusterAdminPolicy"
}