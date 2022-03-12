title 'Test GCP google_compute_autoscaler resource.'

gcp_project_id = input(:gcp_project_id, value: '', description: 'The GCP project identifier.')
gcp_zone = input(:gcp_zone, value: '', description: 'The GCP project zone.')
instance_group_manager = input('instance_group_manager', value: {
  "name": "inspec-gcp-igm",
  "base_instance_name": "igm",
  "named_port_name": "port",
  "named_port_port": 80
}, description: 'Instance group manager definition')
autoscaler = input('autoscaler', value: {
  "name": "inspec-gcp-autoscaler",
  "max_replicas": 5,
  "min_replicas": 1,
  "cooldown_period": 60,
  "cpu_utilization_target": 0.5
}, description: 'Autoscaler definition')

control 'google_compute_autoscaler-1.0' do
  impact 1.0
  title 'google_compute_autoscaler resource test'

  describe google_compute_autoscaler(project: gcp_project_id, zone: gcp_zone, name: autoscaler['name']) do
    it { should exist }

    its('target') { should match /\/inspec-gcp-igm$/ }
    its('autoscaling_policy.max_num_replicas') { should eq autoscaler['max_replicas'] }
    its('autoscaling_policy.min_num_replicas') { should eq autoscaler['min_replicas'] }
    its('autoscaling_policy.cool_down_period_sec') { should eq autoscaler['cooldown_period'] }
    its('autoscaling_policy.cpu_utilization.utilization_target') { should eq autoscaler['cpu_utilization_target'] }
  end

  describe google_compute_autoscaler(project: gcp_project_id, zone: gcp_zone, name: 'nonexistent') do
    it { should_not exist }
  end
end
