title 'Test GCP google_access_context_manager_access_policy resource.'

gcp_organization_id = input(:gcp_organization_id, value: gcp_organization_id, description: 'The identifier of the organization that is the parent of the perimeter')
gcp_enable_privileged_resources = input(:gcp_enable_privileged_resources, value: 0, description: 'Flag to enable privileged resources requiring elevated privileges in GCP.')
service_perimeter = input('service_perimeter', value: {
  "name": "restrict_all",
  "title": "restrict_all",
  "restricted_service": "storage.googleapis.com",
  "policy_title": "policytitle"
}, description: 'Service perimeter definition')

control 'google_access_context_manager_access_policy-1.0' do
  impact 1.0
  title 'google_access_context_manager_access_policy resource test'

  only_if { gcp_enable_privileged_resources.to_i == 1 && gcp_organization_id != '' }

  describe.one do
    google_access_context_manager_access_policies(org_id: gcp_organization_id).names.each do |policy_name|
      describe google_access_context_manager_access_policy(name: policy_name) do
        it { should exist }
        its('title') { should cmp service_perimeter['policy_title'] }
        its('parent') { should match gcp_organization_id }
      end
    end
  end
end
