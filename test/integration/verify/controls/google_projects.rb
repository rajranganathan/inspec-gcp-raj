# ----------------------------------------------------------------------------
#
#     ***     AUTO GENERATED CODE    ***    AUTO GENERATED CODE     ***
#
# ----------------------------------------------------------------------------
#
#     This file is automatically generated by Magic Modules and manual
#     changes will be clobbered when the file is regenerated.
#
#     Please read more about how to change this file in README.md and
#     CONTRIBUTING.md located at the root of this package.
#
# ----------------------------------------------------------------------------

title 'Test GCP google_projects resource.'

gcp_project_id = attribute(:gcp_project_id, default: 'gcp_project_id', description: 'The GCP project identifier.')
control 'google_projects-1.0' do
  impact 1.0
  title 'google_projects resource test'

  describe google_projects() do
    its('count') { should be >= 1 }
    its('project_ids') { should include gcp_project_id }
    its('lifecycle_states') { should include 'ACTIVE' }
  end
end