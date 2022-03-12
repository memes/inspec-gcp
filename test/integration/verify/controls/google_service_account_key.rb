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

title 'Test GCP google_service_account_key resource.'

gcp_project_id = input(:gcp_project_id, value: '', description: 'The GCP project identifier.')
gcp_service_account_display_name = input(:gcp_service_account_display_name, value: '', description: 'The IAM service account display name.')
gcp_enable_privileged_resources = input(:gcp_enable_privileged_resources, value: 0, description:'Flag to enable privileged resources requiring elevated privileges in GCP.')
gcp_organization_id = input(:gcp_organization_id, value: '', description: 'The identifier of the organization')

control 'google_service_account_key-1.0' do
  impact 1.0
  title 'google_service_account_key resource test'

  only_if { gcp_enable_privileged_resources.to_i == 1 && gcp_organization_id != '' }
  google_service_account_keys(project: gcp_project_id, service_account: "#{gcp_service_account_display_name}@#{gcp_project_id}.iam.gserviceaccount.com").key_names.each do |sa_key_name|
  	describe google_service_account_key(project: gcp_project_id, service_account: "#{gcp_service_account_display_name}@#{gcp_project_id}.iam.gserviceaccount.com", name: sa_key_name.split('/').last) do
  		it { should exist }
  		its('key_type') { should_not cmp 'USER_MANAGED' }
  	end
  end
end
