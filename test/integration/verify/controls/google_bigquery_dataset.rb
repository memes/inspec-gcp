title 'Test GCP google_bigquery_dataset resource.'

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

control 'google_bigquery_dataset-1.0' do
  impact 1.0
  title 'google_bigquery_dataset resource test'

  describe google_bigquery_dataset(project: gcp_project_id, name: dataset['dataset_id']) do
    it { should exist }

    its('friendly_name') { should eq dataset['friendly_name'] }
    its('location') { should eq dataset['location'] }
    its('description') { should eq dataset['description'] }
    its('name') { should eq dataset['dataset_id'] }
    its('default_table_expiration_ms') { should cmp dataset['default_table_expiration_ms'] }
  end

  describe.one do
    google_bigquery_dataset(project: gcp_project_id, name: dataset['dataset_id']).access.each do |dataset_access|
      describe dataset_access do
        its('role') { should eq dataset['access_writer_role'] }
        its('special_group') { should eq dataset['access_writer_special_group'] }
      end
    end
  end

  describe google_bigquery_dataset(project: gcp_project_id, name: 'nonexistent') do
    it { should_not exist }
  end
end
