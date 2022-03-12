title 'Test GCP google_cloud_scheduler_jobs resource.'

gcp_project_id = input(:gcp_project_id, value: '', description: 'The GCP project identifier.')
scheduler_job = input('scheduler_job', value: {
  "region": "us-central1",
  "name": "job-name",
  "description": "A description",
  "schedule": "*/8 * * * *",
  "time_zone": "America/New_York",
  "http_method": "POST",
  "http_target_uri": "https://example.com/ping"
}, description: 'Cloud Scheduler Job configuration')

control 'google_cloud_scheduler_jobs-1.0' do
  impact 1.0
  title 'google_cloud_scheduler_jobs resource test'

  google_cloud_scheduler_jobs(project: gcp_project_id, region: scheduler_job['location']).names.each do |name|
    describe google_cloud_scheduler_job(project: gcp_project_id, region: scheduler_job['region'], name: name) do
  	  it { should exist }

  	  its('description') { should cmp scheduler_job['description'] }
  	  its('schedule') { should cmp scheduler_job['schedule'] }
  	  its('time_zone') { should cmp scheduler_job['time_zone'] }
  	  its('http_target.http_method') { should cmp scheduler_job['http_method'] }
  	  its('http_target.uri') { should cmp scheduler_job['http_target_uri'] }
  	end
  end
end
