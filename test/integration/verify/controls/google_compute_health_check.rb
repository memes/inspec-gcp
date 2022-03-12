title 'Test GCP google_compute_health_check resource.'

gcp_project_id = input(:gcp_project_id, value: '', description: 'The GCP project identifier.')
health_check = input('health_check', value: {
  "name": "inspec-gcp-health-check",
  "timeout_sec": 10,
  "check_interval_sec": 10,
  "tcp_health_check_port": 80
}, description: 'Health check definition')

control 'google_compute_health_check-1.0' do
  impact 1.0
  title 'google_compute_health_check resource test'

  describe google_compute_health_check(project: gcp_project_id, name: health_check['name']) do
    it { should exist }
    its('timeout_sec') { should eq health_check['timeout_sec'] }
    its('tcp_health_check.port') { should eq health_check['tcp_health_check_port'] }
  end

  describe google_compute_health_check(project: gcp_project_id, name: 'nonexistent') do
    it { should_not exist }
  end
end
