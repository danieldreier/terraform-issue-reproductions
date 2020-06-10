## SHARED VPC HOST for Timecampus

module "core-vpc-host-1" {
  source     = "./net-vpc"
  project_id = var.core_project_id
  name       = var.core_vpc_host_1_name
  subnets = [
    {
      ip_cidr_range = "10.0.0.0/24"
      name          = "tc-dev-core-subnet-as1-1"
      region        = "asia-south1"
      secondary_ip_range = {
        pods     = "172.16.0.0/20"
        services = "192.168.0.0/24"
      }
    },
    {
      ip_cidr_range = "10.0.2.0/24"
      name          = "tc-dev-core-subnet-as1-2"
      region        = "asia-south1"
      secondary_ip_range = {
        pods     = "172.18.0.0/20"
        services = "192.168.10.0/24"
      }
    },
    {
      ip_cidr_range = "10.0.4.0/24"
      name          = "tc-dev-core-subnet-ue4-1"
      region        = "us-east4"
      secondary_ip_range = {
        pods     = "172.20.0.0/20"
        services = "192.168.20.0/24"
      }
    },
    {
      ip_cidr_range = "10.0.20.0/24"
      name          = "tc-dev-ops-subnet-as1-1"
      region        = "asia-south1"
      secondary_ip_range = {
        pods     = "172.40.0.0/20"
        services = "192.168.100.0/24"
      }
    }
  ]
  shared_vpc_host             = true
  shared_vpc_service_projects = []
  iam_roles = {
    "asia-south1/tc-dev-core-subnet-as1-1" = [
      "roles/compute.networkUser",
      "roles/compute.securityAdmin"
    ]
    "asia-south1/tc-dev-core-subnet-as1-2" = [
      "roles/compute.networkUser",
      "roles/compute.securityAdmin"
    ]
    "us-east4/tc-dev-core-subnet-ue4-1" = [
      "roles/compute.networkUser",
      "roles/compute.securityAdmin"
    ]
    "asia-south1/tc-dev-ops-subnet-as1-1" = [
      "roles/compute.networkUser",
      "roles/compute.securityAdmin"
    ]
  }
}
