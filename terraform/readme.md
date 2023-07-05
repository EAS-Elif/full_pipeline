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
https://dev.to/mesadhan/install-nexus-repository-manager-linux-in-centos7-deploy-and-use-jar-4bge   install nexus
https://infohub.delltechnologies.com/l/dell-powermax-ansible-modules-best-practices-1/making-rest-api-calls-with-the-ansible-uri-module-1      user/role

 body: |
          {
            "user_id": "{{ user_id }}"
            "first_name": "first_name"
            "last_name": "last_name"
            "emailAddress": "test@test.com"
            "user_password": "{{ user_password }}"
            "roles": ["{{ role_id }}"]
            "readOnly": False
            "body_format": json
            "headers":
               "Content-Type: "application/json"
            "return_content": yes
            "status": "active"
            "status_code": 201

"{{ lookup('file', 'create_user.json') }}"




- name: Create Nexus local user
      shell: |
        curl -X POST -u admin:bdd6f053-97b0-4b97-b0ea-2be7e528f87c -H "Content-Type: application/json" -d '{ "userId": "myuser", "firstName": "test_first", "lastName": "test_last", "emailAddress": "test@test.com", "user_password": "password", "status": "active", "roles": "myrole", "readOnly": false }' http://172.16.1.67:8081/service/rest/v1/security/users 
    - name: Create Nexus Role
      shell: |
        curl -X POST -u admin:bdd6f053-97b0-4b97-b0ea-2be7e528f87c -H "Content-Type: application/json" -d '{ "id": "{{ role_id }}", "name": "{{ role_name }}", "privileges": "{{ role_privileges | to_json }}"}' http://localhost:8081/service/rest/v1/security/roles
    - name: Assign Role to User
      shell: |
        curl -X POST -u {{ nexus_username }}:{{ nexus_password }} -H "Content-Type: application/json" -d '{"source": "default", "roles": [{ "id": "{{ role_id }}"}]}' http://localhost:8081/service/rest/v1/security/{{ user_id }}/roles


roles=role
role_id=myrole 
role_name=MyRole
role_privileges=nx-repository-view-*