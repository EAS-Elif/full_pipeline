# Set vm parameters
resource "vsphere_virtual_machine" "vm" {
  count            = length(local.vm_names)
  name             = local.vm_names[count.index]
  num_cpus         = var.vm_cpu
  memory           = var.vm_memory
  datastore_id     = data.vsphere_datastore.datastore.id
  resource_pool_id = data.vsphere_resource_pool.pool.id
  guest_id         = data.vsphere_virtual_machine.template.guest_id
  scsi_type        = data.vsphere_virtual_machine.template.scsi_type
  firmware         = "efi"
  host_system_id   = data.vsphere_host.host.id

  # Set network parameters
  network_interface {
    network_id   = data.vsphere_network.network.id
    adapter_type = var.adapter_type
  }
  disk {
    label            = var.disk_label
    size             = data.vsphere_virtual_machine.template.disks.0.size
    eagerly_scrub    = false
    thin_provisioned = true
  }
  clone {
    template_uuid = data.vsphere_virtual_machine.template.id
  }
}

# Generate inventory file for Ansible
resource "local_file" "inventory" {
  filename = "../ansible/tasks/inventory.ini"
  content  = <<EOF
[${vsphere_virtual_machine.vm[0].name}]
${vsphere_virtual_machine.vm[0].name} ansible_host=${vsphere_virtual_machine.vm[0].guest_ip_addresses[0]}

[${vsphere_virtual_machine.vm[1].name}]
${vsphere_virtual_machine.vm[1].name} ansible_host=${vsphere_virtual_machine.vm[1].guest_ip_addresses[0]}

[${vsphere_virtual_machine.vm[2].name}]
${vsphere_virtual_machine.vm[2].name} ansible_host=${vsphere_virtual_machine.vm[2].guest_ip_addresses[0]}
 
[${vsphere_virtual_machine.vm[3].name}]
${vsphere_virtual_machine.vm[3].name} ansible_host=${vsphere_virtual_machine.vm[3].guest_ip_addresses[0]}
 
[all:vars]
ansible_ssh_password=${var.ansible_ssh_password}
ansible_ssh_user=${var.ansible_ssh_user}
nexus_api_url=http://${vsphere_virtual_machine.vm[3].guest_ip_addresses[0]}:8081
x=http://${vsphere_virtual_machine.vm[3].guest_ip_addresses[0]}
y=${vsphere_virtual_machine.vm[3].guest_ip_addresses[0]}:8082
z=http://${vsphere_virtual_machine.vm[0].guest_ip_addresses[0]}:8080
nexus_username=${var.nexus_username} 
nexus_password=${var.nexus_password}
user_id=${var.user_id}
user_password=${var.user_password}
role_id=${var.role_id} 
role_name=${var.role_name}
role_privileges=${var.role_privileges}
first_name=${var.first_name}
last_name=${var.last_name}
emailAddress=${var.emailAddress}
sonarqube_api_url=http://${vsphere_virtual_machine.vm[1].guest_ip_addresses[0]}:9000
sonarqube_username=${var.sonarqube_username}
sonarqube_password=${var.sonarqube_password}
sonarqube_admin_newpassword=${var.sonarqube_admin_newpassword}
sonar_token_name=${var.sonar_token_name}
status=${var.status}
project_name=${var.project_name}
project_key=${var.project_key}
EOF
}

resource "local_file" "ansible_cfg" {
  filename = "../ansible/tasks/ansible.cfg"
  content  = <<EOF
[defaults]
host_key_checking = false
EOF
}

