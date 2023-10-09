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
require 'google/vertexai/property/schedule_create_pipeline_job_request_pipeline_job_runtime_config_input_artifacts'
require 'google/vertexai/property/schedule_create_pipeline_job_request_pipeline_job_runtime_config_parameter_values'
require 'google/vertexai/property/schedule_create_pipeline_job_request_pipeline_job_runtime_config_parameters'
module GoogleInSpec
  module VertexAI
    module Property
      class ScheduleCreatePipelineJobRequestPipelineJobRuntimeConfig
        attr_reader :gcs_output_directory

        attr_reader :parameter_values

        attr_reader :failure_policy

        attr_reader :parameters

        attr_reader :input_artifacts

        def initialize(args = nil, parent_identifier = nil)
          return if args.nil?
          @parent_identifier = parent_identifier
          @gcs_output_directory = args['gcsOutputDirectory']
          @parameter_values = GoogleInSpec::VertexAI::Property::ScheduleCreatePipelineJobRequestPipelineJobRuntimeConfigParameterValues.new(args['parameterValues'], to_s)
          @failure_policy = args['failurePolicy']
          @parameters = GoogleInSpec::VertexAI::Property::ScheduleCreatePipelineJobRequestPipelineJobRuntimeConfigParameters.new(args['parameters'], to_s)
          @input_artifacts = GoogleInSpec::VertexAI::Property::ScheduleCreatePipelineJobRequestPipelineJobRuntimeConfigInputArtifacts.new(args['inputArtifacts'], to_s)
        end

        def to_s
          "#{@parent_identifier} ScheduleCreatePipelineJobRequestPipelineJobRuntimeConfig"
        end
      end
    end
  end
end
