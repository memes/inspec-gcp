title 'Test GCP google_compute_address resource.'

gcp_project_id = input(:gcp_project_id, value: '', description: 'The GCP project identifier.')
gcp_location = input(:gcp_location, value: '', description: 'The GCP project region.')
address = input('address', value: {
  "name": "inspec-gcp-global-address",
  "address_type": "INTERNAL",
  "address": "10.2.0.3"
}, description: 'Address definition')

control 'google_compute_address-1.0' do
  impact 1.0
  title 'google_compute_address resource test'

  describe google_compute_address(project: gcp_project_id, location: gcp_location, name: address['name']) do
    it { should exist }
    its('address') { should eq address['address'] }
    its('address_type') { should eq address['address_type'] }
    its('user_count') { should eq 0 }
  end

  describe google_compute_address(project: gcp_project_id, location: gcp_location, name: 'nonexistent') do
    it { should_not exist }
  end
end
