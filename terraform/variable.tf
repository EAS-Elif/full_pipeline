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