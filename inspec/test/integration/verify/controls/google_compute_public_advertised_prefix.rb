# frozen_string_literal: true

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

title 'Test GCP google_compute_public_advertised_prefix resource.'

gcp_project_id = input(:gcp_project_id, value: 'gcp_project_id', description: 'The GCP project identifier.')

public_advertised_prefix = input('security_policy', value: {
                                   "publicadvertisedprefix": 'value_publicadvertisedprefix',
                                 }, description: 'public_advertised_prefix description')
control 'google_compute_public_advertised_prefix-1.0' do
  impact 1.0
  title 'google_compute_public_advertised_prefix resource test'

  describe google_compute_public_advertised_prefix(project: gcp_project_id, name: public_advertised_prefix['name']) do
    it { should exist }
  end
end
