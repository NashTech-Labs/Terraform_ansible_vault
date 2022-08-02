Terraform Script to use ansible vault with Openstack Provider

Problem Statement-

We need to use ansible vault to integrate with openstack provider to store the password to authenticate the provisioning of openStack VMs and openstack volumes

Solution:-

We will create few terraform files that are - 
main.tf
provider.tf
data.tf
variable.tf

main.tf - we will have the resource for openstack compute instance and openstack volume 

provider.tf - we will have the providers for terraform, openstack and ansiblevault. THe openstack provider will have the authurl and the password to authenticate the url to create the VMs, this password is stored using the ansiblevault, also the ansiblevault provider will have the password for the ansiblevault

data.tf - we will have the ansiblevault_string which is the encoded value stored in the ansible vault, along with that we will be passing the key_string used to decode the encrypted file

variable.tf - this file will declare the variable vault_pass, which we will be passing on the runtime

To run this terraform script- 

terraform apply -var="vault_pass={{password}}"