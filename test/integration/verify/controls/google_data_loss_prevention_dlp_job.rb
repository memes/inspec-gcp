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

title 'Test GCP google_data_loss_prevention_dlp_job resource.'

gcp_project_id = input(:gcp_project_id, value: 'gcp_project_id', description: 'The GCP project identifier.')
dlp = input('dlp', value: {
  "name": "inspec-gcp-dlp"
}, description: 'DLP Name')
control 'google_data_loss_prevention_dlp_job-1.0' do
  impact 1.0
  title 'google_data_loss_prevention_dlp_job resource test'

  describe google_data_loss_prevention_dlp_job(project: gcp_project_id, name: dlp['name']) do
    it { should exist }
  end

  describe google_data_loss_prevention_dlp_job(project: gcp_project_id, name: 'nonexistent') do
    it { should_not exist }
  end
end
