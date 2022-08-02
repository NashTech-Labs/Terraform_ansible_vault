# Define required providers
terraform {
required_version = ">= 0.14.0"
  required_providers {
    openstack = {
      source  = "terraform-provider-openstack/openstack"
      version = "~> 1.35.0"
    }
    ansiblevault = {
          source = "MeilleursAgents/ansiblevault"
          version = "2.2.0"
        }
  }
}

# Configure the OpenStack Provider
provider "openstack" {
  user_name   = "admin"
  tenant_name = "admin"
  password    = data.ansiblevault_string.key_string.value
  auth_url    = "http://openstack:5000/v2.0"
  region      = "RegionOne"
}


provider "ansiblevault"{
vault_pass =var.vault_pass
root_folder= "/home/ubuntu"
}