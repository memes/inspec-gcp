title 'Test GCP google_cloudbuild_triggers resource.'

gcp_project_id = input(:gcp_project_id, value: '', description: 'The GCP project identifier.')
trigger = input('trigger', value: {
  "trigger_template_project": "trigger-project",
  "trigger_template_branch": "trigger-branch",
  "trigger_template_repo": "trigger-repo",
  "filename": "cloudbuild.yaml"
}, description: 'CloudBuild trigger definition')

control 'google_cloudbuild_triggers-1.0' do
  impact 1.0
  title 'google_cloudbuild_triggers resource test'

  describe google_cloudbuild_triggers(project: gcp_project_id) do
    its('count') { should eq 1 }
  end

  google_cloudbuild_triggers(project: gcp_project_id).ids.each do |id|
    describe google_cloudbuild_trigger(project: gcp_project_id, id: id) do
      its('filename') { should eq trigger['filename'] }
      its('trigger_template.branch_name') { should eq trigger['trigger_template_branch'] }
      its('trigger_template.repo_name') { should eq trigger['trigger_template_repo'] }
      its('trigger_template.project_id') { should eq trigger['trigger_template_project'] }
    end
  end
end
