module "vpc" {
  source = "../../modules/network/vpc"

  CIDR_VPC                = var.CIDR_VPC
  Name_VPC                = var.Name_VPC
  Name_Public_Subnet      = var.Name_Public_Subnet
  Name_private_app_Subnet = var.Name_private_app_Subnet
  Name_private_db_Subnet  = var.Name_private_db_Subnet
  public_subnet_cidrs     = var.public_subnet_cidrs
  private_subnet_cidrs    = var.private_subnet_cidrs
  private_subnet_DB_cidrs = var.private_subnet_DB_cidrs
  Name_IG                 = var.Name_IG
  Name_public_RT          = var.Name_public_RT
  Name_private_RT         = var.Name_private_RT
  Name_private_BD_RT      = var.Name_private_BD_RT
  Name_Nat                = var.Name_Nat
  Create_Nat_Gateway      = var.Create_Nat_Gateway
}

module "eks" {
  source                       = "../../modules/microservice/eks"
  Name_EKS                     = var.Name_EKS
  Version_EKS                  = var.Version_EKS
  Authentication_Mode_EKS      = var.Authentication_Mode_EKS
  Name_EKS_Role                = var.Name_EKS_Role
  subnet_id                    = module.vpc.private_app_subnets_id
  Name_Node_Group_EKS          = var.Name_Node_Group_EKS
  Capacity_Node_Group_EKS      = var.Capacity_Node_Group_EKS
  Instance_Type_Node_Group_EKS = var.Instance_Type_Node_Group_EKS
  Desired_Size_Node_Group_EKS  = var.Desired_Size_Node_Group_EKS
  Max_Size_Node_Group_EKS      = var.Max_Size_Node_Group_EKS
  Min_Size_Node_Group_EKS      = var.Min_Size_Node_Group_EKS
  Name_EKS_Node_Role           = var.Name_EKS_Node_Role
  eks_principal_access         = var.eks_principal_access
  access_entry_policy_access   = var.access_entry_policy_access
}