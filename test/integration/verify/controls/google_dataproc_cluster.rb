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

title 'Test GCP google_dataproc_cluster resource.'

gcp_project_id = input(:gcp_project_id, value: 'gcp_project_id', description: 'The GCP project identifier.')
gcp_location = input(:gcp_location, value: 'gcp_location', description: 'The GCP project region.')
dataproc_cluster = input('dataproc_cluster', value: {
  "name": "inspec-dataproc-cluster",
  "label_key": "label",
  "label_value": "value",
  "config": {
    "master_config": {
      "num_instances": 1,
      "machine_type": "n1-standard-1",
      "boot_disk_type": "pd-ssd",
      "boot_disk_size_gb": 15
    },
    "worker_config": {
      "num_instances": 2,
      "machine_type": "n1-standard-1",
      "boot_disk_size_gb": 20,
      "num_local_ssds": 1
    },
    "preemptible_worker_config": {
      "num_instances": 0
    },
    "software_config": {
      "prop_key": "dataproc:dataproc.allow.zero.workers",
      "prop_value": "true"
    },
    "gce_cluster_config": {
      "tag": "foo"
    }
  }
}, description: 'Dataproc cluster definition')
control 'google_dataproc_cluster-1.0' do
  impact 1.0
  title 'google_dataproc_cluster resource test'

  describe google_dataproc_cluster(project: gcp_project_id, region: gcp_location, cluster_name: dataproc_cluster['name']) do
    it { should exist }
    its('labels') { should include(dataproc_cluster['label_key'] => dataproc_cluster['label_value']) }
    its('config.master_config.num_instances') { should cmp dataproc_cluster['config']['master_config']['num_instances'] }
    its('config.worker_config.num_instances') { should cmp dataproc_cluster['config']['worker_config']['num_instances'] }
    its('config.master_config.machine_type_uri') { should match dataproc_cluster['config']['master_config']['machine_type'] }
    its('config.worker_config.machine_type_uri') { should match dataproc_cluster['config']['worker_config']['machine_type'] }
    its('config.software_config.properties') { should include(dataproc_cluster['config']['software_config']['prop_key'] => dataproc_cluster['config']['software_config']['prop_value']) }
  end

  describe google_dataproc_cluster(project: gcp_project_id, region: gcp_location, cluster_name: 'nonexistent') do
    it { should_not exist }
  end
end
