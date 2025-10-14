
variable "Name_VPC" {
  description = "Name VPC"
  type        = string
  default     = "VPC-env"
}

variable "CIDR_VPC" {
  description = "CIDR Block to VPC"
  type        = string
  default     = "10.0.0.0/16"
}

variable "Name_Public_Subnet" {
  description = "Name Public Subnet"
  type        = string
  default     = "Public APP Subnet"
}

variable "Name_private_app_Subnet" {
  description = "Name private app Subnet"
  type        = string
  default     = "private APP Subnet"
}

variable "Name_private_db_Subnet" {
  description = "Name private db Subnet"
  type        = string
  default     = "private db Subnet"
}

variable "public_subnet_cidrs" {
  type        = list(string)
  description = "Public APP Subnet CIDR values"
  default     = ["10.0.1.0/24", "10.0.2.0/24"]
}

variable "private_subnet_cidrs" {
  type        = list(string)
  description = "Private APP Subnet CIDR values"
  default     = ["10.0.5.0/24", "10.0.6.0/24"]
}

variable "private_subnet_DB_cidrs" {
  type        = list(string)
  description = "Private DB Subnet CIDR values"
  default     = ["10.0.7.0/24", "10.0.8.0/24", "10.0.9.0/24"]
}

variable "azs" {
  type        = list(string)
  description = "Availability Zones"
  default     = ["us-east-1a", "us-east-1b", "us-east-1c"]
}

variable "Name_IG" {
  description = "Name Internet Gateway"
  type        = string
  default     = "IG"
}

variable "Name_public_RT" {
  description = "Name Public Route Table"
  type        = string
  default     = "RouteTable-APP-Public"
}

variable "Name_private_RT" {
  description = "Name Private Route Table"
  type        = string
  default     = "RouteTable-APP-Private"
}

variable "Name_private_BD_RT" {
  description = "Name Private BD Route Table"
  type        = string
  default     = "RouteTable-BD-Private"
}

variable "Name_Nat" {
  description = "Name Nat Gateway"
  type        = string
  default     = "NAT"
}

variable "Create_Nat_Gateway" {
  description = "Allow Nat Gateway"
  type        = bool
  default     = false
}