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
require 'google/vertexai/property/schedule_create_pipeline_job_request_pipeline_job_job_detail_pipeline_context'
require 'google/vertexai/property/schedule_create_pipeline_job_request_pipeline_job_job_detail_pipeline_context_labels'
require 'google/vertexai/property/schedule_create_pipeline_job_request_pipeline_job_job_detail_pipeline_context_metadata'
require 'google/vertexai/property/schedule_create_pipeline_job_request_pipeline_job_job_detail_pipeline_run_context'
require 'google/vertexai/property/schedule_create_pipeline_job_request_pipeline_job_job_detail_pipeline_run_context_labels'
require 'google/vertexai/property/schedule_create_pipeline_job_request_pipeline_job_job_detail_pipeline_run_context_metadata'
require 'google/vertexai/property/schedule_create_pipeline_job_request_pipeline_job_job_detail_task_details'
module GoogleInSpec
  module VertexAI
    module Property
      class ScheduleCreatePipelineJobRequestPipelineJobJobDetail
        attr_reader :task_details

        attr_reader :pipeline_run_context

        attr_reader :pipeline_context

        def initialize(args = nil, parent_identifier = nil)
          return if args.nil?
          @parent_identifier = parent_identifier
          @task_details = GoogleInSpec::VertexAI::Property::ScheduleCreatePipelineJobRequestPipelineJobJobDetailTaskDetailsArray.parse(args['taskDetails'], to_s)
          @pipeline_run_context = GoogleInSpec::VertexAI::Property::ScheduleCreatePipelineJobRequestPipelineJobJobDetailPipelineRunContext.new(args['pipelineRunContext'], to_s)
          @pipeline_context = GoogleInSpec::VertexAI::Property::ScheduleCreatePipelineJobRequestPipelineJobJobDetailPipelineContext.new(args['pipelineContext'], to_s)
        end

        def to_s
          "#{@parent_identifier} ScheduleCreatePipelineJobRequestPipelineJobJobDetail"
        end
      end
    end
  end
end
