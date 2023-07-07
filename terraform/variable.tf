variable "vsphere_user" {
  description = "user name"
  default     = "elif@easlab.co.uk"
}
variable "vsphere_password" {
  description = "password"
  default     = "Renegade187!"
}
variable "vsphere_server" {
  description = "center name"
  default     = "vcenter.easlab.co.uk"
}
variable "vsphere_datacenter" {
  description = "datacenter name"
  default     = "Development"
}
variable "vsphere_resource_pool" {
  description = "resource pool name"
  default     = "EAS-DEV"
}
variable "vsphere_compute_cluster" {
  description = "cluster name"
  default     = "EAS-DEV"
}
variable "vsphere_datastore" {
  description = "datastore name"
  default     = "VM_STORAGE"
}
variable "vsphere_network" {
  description = "network name"
  default     = "VM Network"
}
variable "vsphere_virtual_machine" {
  description = "template name"
  default     = "CentOS8Stream"
}
variable "adapter_type" {
  description = "adapter type"
  default     = "vmxnet3"
}
variable "ansible_ssh_password" {
  description = "ansible password"
  default     = "Renegade187!"
}
variable "ansible_ssh_user" {
  description = "ansible user"
  default     = "root"
}

variable "vm_1" {
  description = "vm1 name"
  default     = "jenkins"
}

variable "vm_2" {
  description = "vm2 name"
  default     = "sonarqube"
}

variable "vm_3" {
  description = "vm3 name"
  default     = "trivy"
}

variable "vm_4" {
  description = "vm4 name"
  default     = "nexus"
}

variable "vm_cpu" {
  description = "vm cpu value"
  default     = 2
}

variable "vm_memory" {
  description = "vm cpu value"
  default     = 4096
}

variable "disk_label" {
  description = "disk label"
  default     = "disk0"
}

variable "nexus_username" {
  description = "nexus_username"
  default     = "admin"
}
variable "nexus_password" {
  description = "nexus_password"
  default     = "120b0001-ac2b-4201-936f-da33810fbc71"
}
variable "user_id" {
  description = "nexus userId"
  default     = "myuser"
}
variable "user_password" {
  description = "nexus user_password"
  default     = "password"
}
variable "role_id" {
  description = "nexus role_id"
  default     = "myrole"
}
variable "role_name" {
  description = "nexus role_name"
  default     = "MyRole"
}
variable "role_privileges" {
  description = "nexus role_privileges"
  default     = "nx-repository-view-*"
}
variable "first_name" {
  description = "nexus first_name"
  default     = "test_first"
}
variable "last_name" {
  description = "nexus last_name"
  default     = "test_last"
}
variable "emailAddress" {
  description = "nexus emailAddress"
  default     = "test@test.com"
}
variable "sonarqube_username" {
  description = "sonarqube username"
  default     = "admin"
}
variable "sonarqube_password" {
  description = "sonarqube password"
  default     = "admin"
}
variable "sonarqube_admin_newpassword" {
  description = "sonarqube new password"
  default     = "Renegade187!"
}
variable "sonar_token_name" {
  description = "sonarqube token name"
  default     = "new"
}
variable "status" {
  description = "success status"
  default     = "active"
}