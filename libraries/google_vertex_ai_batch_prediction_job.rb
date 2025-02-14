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
require 'gcp_backend'
require 'google/vertexai/property/batchpredictionjob_completion_stats'
require 'google/vertexai/property/batchpredictionjob_dedicated_resources'
require 'google/vertexai/property/batchpredictionjob_dedicated_resources_machine_spec'
require 'google/vertexai/property/batchpredictionjob_encryption_spec'
require 'google/vertexai/property/batchpredictionjob_error'
require 'google/vertexai/property/batchpredictionjob_explanation_spec'
require 'google/vertexai/property/batchpredictionjob_explanation_spec_metadata'
require 'google/vertexai/property/batchpredictionjob_explanation_spec_metadata_inputs'
require 'google/vertexai/property/batchpredictionjob_explanation_spec_metadata_outputs'
require 'google/vertexai/property/batchpredictionjob_explanation_spec_parameters'
require 'google/vertexai/property/batchpredictionjob_explanation_spec_parameters_examples'
require 'google/vertexai/property/batchpredictionjob_explanation_spec_parameters_examples_example_gcs_source'
require 'google/vertexai/property/batchpredictionjob_explanation_spec_parameters_examples_example_gcs_source_gcs_source'
require 'google/vertexai/property/batchpredictionjob_explanation_spec_parameters_examples_presets'
require 'google/vertexai/property/batchpredictionjob_explanation_spec_parameters_integrated_gradients_attribution'
require 'google/vertexai/property/batchpredictionjob_explanation_spec_parameters_integrated_gradients_attribution_blur_baseline_config'
require 'google/vertexai/property/batchpredictionjob_explanation_spec_parameters_integrated_gradients_attribution_smooth_grad_config'
require 'google/vertexai/property/batchpredictionjob_explanation_spec_parameters_integrated_gradients_attribution_smooth_grad_config_feature_noise_sigma'
require 'google/vertexai/property/batchpredictionjob_explanation_spec_parameters_integrated_gradients_attribution_smooth_grad_config_feature_noise_sigma_noise_sigma'
require 'google/vertexai/property/batchpredictionjob_explanation_spec_parameters_sampled_shapley_attribution'
require 'google/vertexai/property/batchpredictionjob_explanation_spec_parameters_xrai_attribution'
require 'google/vertexai/property/batchpredictionjob_explanation_spec_parameters_xrai_attribution_blur_baseline_config'
require 'google/vertexai/property/batchpredictionjob_explanation_spec_parameters_xrai_attribution_smooth_grad_config'
require 'google/vertexai/property/batchpredictionjob_explanation_spec_parameters_xrai_attribution_smooth_grad_config_feature_noise_sigma'
require 'google/vertexai/property/batchpredictionjob_explanation_spec_parameters_xrai_attribution_smooth_grad_config_feature_noise_sigma_noise_sigma'
require 'google/vertexai/property/batchpredictionjob_input_config'
require 'google/vertexai/property/batchpredictionjob_input_config_bigquery_source'
require 'google/vertexai/property/batchpredictionjob_input_config_gcs_source'
require 'google/vertexai/property/batchpredictionjob_instance_config'
require 'google/vertexai/property/batchpredictionjob_labels'
require 'google/vertexai/property/batchpredictionjob_manual_batch_tuning_parameters'
require 'google/vertexai/property/batchpredictionjob_output_config'
require 'google/vertexai/property/batchpredictionjob_output_config_bigquery_destination'
require 'google/vertexai/property/batchpredictionjob_output_config_gcs_destination'
require 'google/vertexai/property/batchpredictionjob_output_info'
require 'google/vertexai/property/batchpredictionjob_partial_failures'
require 'google/vertexai/property/batchpredictionjob_resources_consumed'
require 'google/vertexai/property/batchpredictionjob_unmanaged_container_model'
require 'google/vertexai/property/batchpredictionjob_unmanaged_container_model_container_spec'
require 'google/vertexai/property/batchpredictionjob_unmanaged_container_model_container_spec_env'
require 'google/vertexai/property/batchpredictionjob_unmanaged_container_model_container_spec_ports'
require 'google/vertexai/property/batchpredictionjob_unmanaged_container_model_predict_schemata'

# A provider to manage Vertex AI resources.
class VertexAIBatchPredictionJob < GcpResourceBase
  name 'google_vertex_ai_batch_prediction_job'
  desc 'BatchPredictionJob'
  supports platform: 'gcp'

  attr_reader :params
  attr_reader :create_time
  attr_reader :model_parameters
  attr_reader :instance_config
  attr_reader :model_version_id
  attr_reader :dedicated_resources
  attr_reader :output_info
  attr_reader :disable_container_logging
  attr_reader :explanation_spec
  attr_reader :end_time
  attr_reader :generate_explanation
  attr_reader :resources_consumed
  attr_reader :error
  attr_reader :input_config
  attr_reader :unmanaged_container_model
  attr_reader :completion_stats
  attr_reader :start_time
  attr_reader :manual_batch_tuning_parameters
  attr_reader :update_time
  attr_reader :name
  attr_reader :labels
  attr_reader :state
  attr_reader :encryption_spec
  attr_reader :partial_failures
  attr_reader :model
  attr_reader :output_config
  attr_reader :display_name
  attr_reader :service_account

  def initialize(params)
    super(params.merge({ use_http_transport: true }))
    @params = params
    @fetched = @connection.fetch(product_url(params[:beta]), resource_base_url, params, 'Get')
    parse unless @fetched.nil?
  end

  def parse
    @create_time = @fetched['createTime']
    @model_parameters = @fetched['modelParameters']
    @instance_config = GoogleInSpec::VertexAI::Property::BatchPredictionJobInstanceConfig.new(@fetched['instanceConfig'], to_s)
    @model_version_id = @fetched['modelVersionId']
    @dedicated_resources = GoogleInSpec::VertexAI::Property::BatchPredictionJobDedicatedResources.new(@fetched['dedicatedResources'], to_s)
    @output_info = GoogleInSpec::VertexAI::Property::BatchPredictionJobOutputInfo.new(@fetched['outputInfo'], to_s)
    @disable_container_logging = @fetched['disableContainerLogging']
    @explanation_spec = GoogleInSpec::VertexAI::Property::BatchPredictionJobExplanationSpec.new(@fetched['explanationSpec'], to_s)
    @end_time = @fetched['endTime']
    @generate_explanation = @fetched['generateExplanation']
    @resources_consumed = GoogleInSpec::VertexAI::Property::BatchPredictionJobResourcesConsumed.new(@fetched['resourcesConsumed'], to_s)
    @error = GoogleInSpec::VertexAI::Property::BatchPredictionJobError.new(@fetched['error'], to_s)
    @input_config = GoogleInSpec::VertexAI::Property::BatchPredictionJobInputConfig.new(@fetched['inputConfig'], to_s)
    @unmanaged_container_model = GoogleInSpec::VertexAI::Property::BatchPredictionJobUnmanagedContainerModel.new(@fetched['unmanagedContainerModel'], to_s)
    @completion_stats = GoogleInSpec::VertexAI::Property::BatchPredictionJobCompletionStats.new(@fetched['completionStats'], to_s)
    @start_time = @fetched['startTime']
    @manual_batch_tuning_parameters = GoogleInSpec::VertexAI::Property::BatchPredictionJobManualBatchTuningParameters.new(@fetched['manualBatchTuningParameters'], to_s)
    @update_time = @fetched['updateTime']
    @name = @fetched['name']
    @labels = GoogleInSpec::VertexAI::Property::BatchPredictionJobLabels.new(@fetched['labels'], to_s)
    @state = @fetched['state']
    @encryption_spec = GoogleInSpec::VertexAI::Property::BatchPredictionJobEncryptionSpec.new(@fetched['encryptionSpec'], to_s)
    @partial_failures = GoogleInSpec::VertexAI::Property::BatchPredictionJobPartialFailuresArray.parse(@fetched['partialFailures'], to_s)
    @model = @fetched['model']
    @output_config = GoogleInSpec::VertexAI::Property::BatchPredictionJobOutputConfig.new(@fetched['outputConfig'], to_s)
    @display_name = @fetched['displayName']
    @service_account = @fetched['serviceAccount']
  end

  def exists?
    !@fetched.nil?
  end

  def to_s
    "BatchPredictionJob #{@params[:name]}"
  end

  private

  def product_url(_ = nil)
    'https://{{region}}-aiplatform.googleapis.com/v1/'
  end

  def resource_base_url
    '{{name}}'
  end
end
