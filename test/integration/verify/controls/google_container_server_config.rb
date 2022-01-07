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

title 'Test GCP google_container_server_config resource.'

gcp_project_id = attribute(:gcp_project_id, default: 'gcp_project_id', description: 'The GCP project identifier.')
gcp_kube_cluster_zone = attribute(:gcp_kube_cluster_zone, default: 'gcp_kube_cluster_zone', description: 'The zone that the kube cluster resides in.')
gcp_kube_cluster_name = attribute(:gcp_kube_cluster_name, default: 'gcp_kube_cluster_name', description: 'The parent container clusters name.')
container_engine_versions = attribute('container_engine_versions', default: {
  "valid_master_version": "1.21.5-gke.1802",
  "valid_node_version": "1.21.5-gke.1802"
}, description: 'Google Kubernetes Engine versions in a zone or region for a given project.')
control 'google_container_server_config-1.0' do
  impact 1.0
  title 'google_container_server_config resource test'


  describe google_container_server_config(project: gcp_project_id, location: gcp_kube_cluster_zone) do
    its('valid_master_versions') { should include container_engine_versions['valid_master_version']}
    its('valid_node_versions') { should include container_engine_versions['valid_node_version']}
  end
end
