# frozen_string_literal: false

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
require 'google/datalossprevention/property/dlpjob_risk_details_deidentify_details_requested_options_snapshot_deidentify_template'
require 'google/datalossprevention/property/dlpjob_risk_details_deidentify_details_requested_options_snapshot_deidentify_template_deidentify_config'
require 'google/datalossprevention/property/dlpjob_risk_details_deidentify_details_requested_options_snapshot_image_redact_template'
require 'google/datalossprevention/property/dlpjob_risk_details_deidentify_details_requested_options_snapshot_image_redact_template_deidentify_config'
require 'google/datalossprevention/property/dlpjob_risk_details_deidentify_details_requested_options_snapshot_structured_deidentify_template'
require 'google/datalossprevention/property/dlpjob_risk_details_deidentify_details_requested_options_snapshot_structured_deidentify_template_deidentify_config'
module GoogleInSpec
  module DataLossPrevention
    module Property
      class DlpJobRiskDetailsDeidentifyDetailsRequestedOptions
        attr_reader :snapshot_deidentify_template

        attr_reader :snapshot_structured_deidentify_template

        attr_reader :snapshot_image_redact_template

        def initialize(args = nil, parent_identifier = nil)
          return if args.nil?
          @parent_identifier = parent_identifier
          @snapshot_deidentify_template = GoogleInSpec::DataLossPrevention::Property::DlpJobRiskDetailsDeidentifyDetailsRequestedOptionsSnapshotDeidentifyTemplate.new(args['snapshotDeidentifyTemplate'], to_s)
          @snapshot_structured_deidentify_template = GoogleInSpec::DataLossPrevention::Property::DlpJobRiskDetailsDeidentifyDetailsRequestedOptionsSnapshotStructuredDeidentifyTemplate.new(args['snapshotStructuredDeidentifyTemplate'], to_s)
          @snapshot_image_redact_template = GoogleInSpec::DataLossPrevention::Property::DlpJobRiskDetailsDeidentifyDetailsRequestedOptionsSnapshotImageRedactTemplate.new(args['snapshotImageRedactTemplate'], to_s)
        end

        def to_s
          "#{@parent_identifier} DlpJobRiskDetailsDeidentifyDetailsRequestedOptions"
        end
      end
    end
  end
end
