
title 'GCE Compliances'
gcp_project_id = input("gcp_project_id")
INSTANCE_NAME = attribute('instance_name', description: 'gcp instance identifier')
ZONE = attribute('instance_zone', description: 'instance zone')

control "gce_instance_check_1.0" do
    title 'Check GCE Instances'

    describe google_compute_instance(project: gcp_project_id, zone: 'europe-west2-a') do
        # it { should exist }
        its('name') { should match '^(raj-test|marketing|research)$' }
    end
end