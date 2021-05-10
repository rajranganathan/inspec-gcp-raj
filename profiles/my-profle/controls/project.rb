# Check devops-raj project exists

title 'GCP Projects Compliance'
gcp_project_id = input("gcp_project_id")

control "gcp-proj" do
  impact 0.7
  title 'Check DevOps Project'

  describe google_project(project: gcp_project_id) do
    it {should exist}
    its('name') { should eq 'devops-raj'}
    its('project_number') {should eq 1034213708357}
  end
end