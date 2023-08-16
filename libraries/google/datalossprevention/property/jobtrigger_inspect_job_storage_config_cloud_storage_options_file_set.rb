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
require 'google/datalossprevention/property/jobtrigger_inspect_job_storage_config_cloud_storage_options_file_set_regex_file_set'
module GoogleInSpec
  module DataLossPrevention
    module Property
      class JobTriggerInspectJobStorageConfigCloudStorageOptionsFileSet
        attr_reader :url

        attr_reader :regex_file_set

        def initialize(args = nil, parent_identifier = nil)
          return if args.nil?
          @parent_identifier = parent_identifier
          @url = args['url']
          @regex_file_set = GoogleInSpec::DataLossPrevention::Property::JobTriggerInspectJobStorageConfigCloudStorageOptionsFileSetRegexFileSet.new(args['regexFileSet'], to_s)
        end

        def to_s
          "#{@parent_identifier} JobTriggerInspectJobStorageConfigCloudStorageOptionsFileSet"
        end
      end
    end
  end
end
