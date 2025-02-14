# frozen_string_literal: true

# ----------------------------------------------------------------------------
#
#     ***     AUTO GENERATED CODE    ***    Type: MMv1     ***
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

title 'Test GCP google_data_loss_prevention_stored_info_type resource.'

gcp_project_id = input(:gcp_project_id, value: 'gcp_project_id', description: 'The GCP project identifier.')
dlp = input('dlp', value: {
              "name": 'i-inspec-gcp-dlp',
  "location": 'us-east-2',
  "type": 'INSPECT_JOB',
  "state": 'ACTIVE',
  "inspectDetails": {
    "requestedOptions": {
      "snapshotInspectTemplate": '',
      "jobConfig": {
        "storageConfig": {
          "hybridOptions": {
            "description": 'test',
            "tableOptions": '',
          },
        },
      },
    },
  },
  "description": 'Description',
  "display_name": 'Displayname',
            }, description: 'DLP ')
control 'google_data_loss_prevention_stored_info_type-1.0' do
  impact 1.0
  title 'google_data_loss_prevention_stored_info_type resource test'

  describe google_data_loss_prevention_stored_info_type(parent: "projects/#{gcp_project_id}/locations/#{dlp['location']}", name: dlp['stored_info_type_name']) do
    it { should exist }
    its('name') { should cmp dlp['name'] }
  end

  describe google_data_loss_prevention_stored_info_type(parent: "projects/#{gcp_project_id}/locations/#{dlp['location']}", name: 'nonexistent') do
    it { should_not exist }
  end
end
