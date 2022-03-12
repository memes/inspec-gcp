title 'Test GCP google_access_context_manager_access_level resource.'

gcp_organization_id = input(:gcp_organization_id, value: '', description: 'The identifier of the organization that is the parent of the perimeter')
gcp_enable_privileged_resources = input(:gcp_enable_privileged_resources, value: 0, description: 'Flag to enable privileged resources requiring elevated privileges in GCP.')
service_perimeter = input('service_perimeter', value: {
  "name": "restrict_all",
  "title": "restrict_all",
  "restricted_service": "storage.googleapis.com",
  "policy_title": "policytitle"
}, description: 'Service perimeter definition')

control 'google_access_context_manager_access_level-1.0' do
  impact 1.0
  title 'google_access_context_manager_access_level resource test'

  only_if { gcp_enable_privileged_resources.to_i == 1 && gcp_organization_id != '' }

  policy_name = google_access_context_manager_access_policies(org_id: gcp_organization_id).names.first

  describe google_access_context_manager_access_level(parent: policy_name, name: "ip_subnet") do
    it { should exist }
    its('title') { should cmp "ip_subnet" }
    its('basic.conditions.size') { should cmp 1 }
    its('basic.conditions.first.ip_subnetworks') { should include "192.0.2.0/24" }
  end

  describe google_access_context_manager_access_level(parent: policy_name, name: "none") do
    it { should_not exist }
  end
end
