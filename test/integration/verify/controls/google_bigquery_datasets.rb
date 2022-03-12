title 'Test GCP google_bigquery_datasets resource.'

gcp_project_id = input(:gcp_project_id, value: '', description: 'The GCP project identifier.')
dataset = input('dataset', value: {
  "dataset_id": "inspec_gcp_dataset",
  "friendly_name": "A BigQuery dataset test",
  "description": "Test BigQuery dataset description",
  "location": "EU",
  "default_table_expiration_ms": 3600000,
  "access_writer_role": "WRITER",
  "access_writer_special_group": "projectWriters"
}, description: 'BigQuery dataset definition')

control 'google_bigquery_datasets-1.0' do
  impact 1.0
  title 'google_bigquery_datasets resource test'

  describe google_bigquery_datasets(project: gcp_project_id) do
    its('count') { should be >= 1 }
    its('friendly_names') { should include dataset['friendly_name'] }
    its('locations') { should include dataset['location'] }
  end

  google_bigquery_datasets(project: gcp_project_id).ids.each do |name|
    google_bigquery_dataset(project: gcp_project_id, name: name.split(':').last).access.each do |access|
      describe access do
        # No bigquery dataset should allow access to allUsers
        its('iam_member') { should_not cmp 'allUsers' }
      end
    end
  end
end
