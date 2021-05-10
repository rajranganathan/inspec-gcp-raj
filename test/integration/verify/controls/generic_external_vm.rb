title 'External Virtual Machine Properties'

gcp_project_id = attribute(:gcp_project_id, default: '', description: 'The GCP project identifier.')
gcp_zone = attribute(:gcp_zone, default: '', description: 'The GCP zone being used.')
gcp_ext_vm_name = attribute(:gcp_ext_vm_name, default: '', description: 'The GCP VM name.')
gcp_ext_vm_size = attribute(:gcp_ext_vm_size, default: '', description: 'The GCP VM machine type or size.')
#gcp_int_vm_image = attribute(:gcp_ext_vm_image, default: '', description: 'The GCP VM image.')

control 'gcp-generic-vm-linux-external-1.0' do

  impact 1.0
  title 'Ensure External VM was built and has the correct properties'

  describe google_compute_instance(project: gcp_project_id, zone: gcp_zone, name: gcp_ext_vm_name) do
    it { should exist }
    its('name') { should eq gcp_ext_vm_name }
    its('zone') { should match gcp_zone }

    # the machine should not be tainted
    its('tainted?') { should be false }

    # the machine should not be untrusted
    its('untrusted?') { should be false }

    its('machine_size') { should eq gcp_ext_vm_size}
    # can't easily get the os family from running instance...
    #its('source_image') { should eq  gcp_int_vm_image}

    # we get Skylake and Broadwell for example
    its('cpu_platform') { should match "Intel" }

    its('status') { should eq 'RUNNING' }

    # see if the disk is present with the correct name
    its('disk_count'){should eq 1}
    # see the internal vm control for more on the below
    #its('disks_source') { should eq gcp_ext_vm_name }
    #it { should disks_source_name_equal(0,gcp_ext_vm_name) }
    its('first_disks_source_name') { should eq gcp_ext_vm_name }
    its('first_disks_first_license') { should match "ubuntu"}

    # confirm there is only one network interface attached
    its('network_interfaces_count'){should eq 1}

    # uniquely for the external VM, ensure we have a public IP address
    its('first_network_interface_nat_ip_exists'){ should be true }
    its('first_network_interface_name'){ should eq "external-nat" }
    its('first_network_interface_type'){ should eq "one_to_one_nat" }

    its('labels_keys') { should_not include 'label_does_not_exist' }
  end
end
