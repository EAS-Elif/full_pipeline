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
  filename = "./ansible/tasks/inventory.ini"
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
EOF
}


resource "local_file" "ansible_cfg" {
  filename = "./ansible/tasks/ansible.cfg"
  content  = <<EOF
[defaults]
host_key_checking = false
EOF
}