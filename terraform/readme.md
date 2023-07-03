https://github.com/hashicorp/terraform-provider-vsphere/issues/949
https://garyflynn.com/post/create-your-first-vsphere-terraform-configuration/       terraform configuration
https://github.com/danielamor/terraform_centos7_vsphere/blob/master/README.md

https://github.com/hashicorp/terraform-provider-vsphere/issues/1496  

Error: error powering on virtual machine: powerOn task for vm "/Development/vm/vm-one" failed: ACPI motherboard layout requires EFI.     

*** sorted with this one firmware = "efi"

Error: error sending customization spec: The number of network adapter settings in the customization specification: 0 does not match the number of network adapters present in the virtual machine: 1.    
 
*** sorted with this one  adapter_type = "vmxnet3"

Error: error reconfiguring virtual machine: error processing disk changes post-clone: disk.0: ServerFaultCode: NoPermission: RESOURCE (vm-1136:2000), ACTION (queryAssociatedProfile): RESOURCE (vm-1136), ACTION (PolicyIDByVirtualDisk)

https://developer.hashicorp.com/terraform/language/meta-arguments/count#count-index     (increase the amount of VMs and naming them)

https://medium.com/@rajeshshukla_49087/ansible-inventory-file-using-terraform-b305db3ead2  (inventory file sample)
https://coffay.haus/pages/terraform+ansible/
https://iamroot.it/2021/09/21/terraform-building-a-dynamic-ansible-inventory-using-templatefile/   (this one did not work)
https://www.percona.com/blog/how-to-generate-an-ansible-inventory-with-terraform/
https://plugins.jenkins.io/job-dsl/ job DSL plugin
https://medium.com/tech-learn-share/jenkins-job-dsl-667e88afc2f3  job DSL plugin
https://www.jenkins.io/projects/jcasc/  JCASC plugin
https://plugins.jenkins.io/configuration-as-code/ JCASC plugin
https://medium.com/globant/jenkins-jcasc-for-beginners-819dff6f8bc including JCASC sample
https://plugins.jenkins.io/github/ GitHub plugin
https://www.cloudbees.com/blog/using-git-jenkins Git install
https://ostechnix.com/ansible-register/ ansible register variable