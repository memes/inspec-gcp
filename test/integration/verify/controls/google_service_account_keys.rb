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

title 'Test GCP google_service_account_keys resource.'

gcp_project_id = input(:gcp_project_id, value: 'gcp_project_id', description: 'The GCP project identifier.')
gcp_service_account_display_name = input(:gcp_service_account_display_name, value: 'gcp_service_account_display_name', description: 'The IAM service account display name.')
gcp_enable_privileged_resources = input(:gcp_enable_privileged_resources, value: 0, description:'Flag to enable privileged resources requiring elevated privileges in GCP.')
gcp_organization_id = input(:gcp_organization_id, value: '', description: 'The identifier of the organization')

control 'google_service_account_keys-1.0' do
  impact 1.0
  title 'google_service_account_keys resource test'

  only_if { gcp_enable_privileged_resources.to_i == 1 && gcp_organization_id != '' }
  describe google_service_account_keys(project: gcp_project_id, service_account: "#{gcp_service_account_display_name}@#{gcp_project_id}.iam.gserviceaccount.com") do
    its('count') { should be <= 1000 }
    its('key_types') { should_not include 'USER_MANAGED' }
  end
end
