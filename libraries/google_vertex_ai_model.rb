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
require 'google/vertexai/property/model_container_spec'
require 'google/vertexai/property/model_container_spec_env'
require 'google/vertexai/property/model_container_spec_ports'
require 'google/vertexai/property/model_deployed_models'
require 'google/vertexai/property/model_encryption_spec'
require 'google/vertexai/property/model_explanation_spec'
require 'google/vertexai/property/model_explanation_spec_metadata'
require 'google/vertexai/property/model_explanation_spec_metadata_inputs'
require 'google/vertexai/property/model_explanation_spec_metadata_outputs'
require 'google/vertexai/property/model_explanation_spec_parameters'
require 'google/vertexai/property/model_explanation_spec_parameters_examples'
require 'google/vertexai/property/model_explanation_spec_parameters_examples_example_gcs_source'
require 'google/vertexai/property/model_explanation_spec_parameters_examples_example_gcs_source_gcs_source'
require 'google/vertexai/property/model_explanation_spec_parameters_examples_presets'
require 'google/vertexai/property/model_explanation_spec_parameters_integrated_gradients_attribution'
require 'google/vertexai/property/model_explanation_spec_parameters_integrated_gradients_attribution_blur_baseline_config'
require 'google/vertexai/property/model_explanation_spec_parameters_integrated_gradients_attribution_smooth_grad_config'
require 'google/vertexai/property/model_explanation_spec_parameters_integrated_gradients_attribution_smooth_grad_config_feature_noise_sigma'
require 'google/vertexai/property/model_explanation_spec_parameters_integrated_gradients_attribution_smooth_grad_config_feature_noise_sigma_noise_sigma'
require 'google/vertexai/property/model_explanation_spec_parameters_sampled_shapley_attribution'
require 'google/vertexai/property/model_explanation_spec_parameters_xrai_attribution'
require 'google/vertexai/property/model_explanation_spec_parameters_xrai_attribution_blur_baseline_config'
require 'google/vertexai/property/model_explanation_spec_parameters_xrai_attribution_smooth_grad_config'
require 'google/vertexai/property/model_explanation_spec_parameters_xrai_attribution_smooth_grad_config_feature_noise_sigma'
require 'google/vertexai/property/model_explanation_spec_parameters_xrai_attribution_smooth_grad_config_feature_noise_sigma_noise_sigma'
require 'google/vertexai/property/model_labels'
require 'google/vertexai/property/model_model_source_info'
require 'google/vertexai/property/model_original_model_info'
require 'google/vertexai/property/model_predict_schemata'
require 'google/vertexai/property/model_supported_export_formats'

# A provider to manage Vertex AI resources.
class VertexAIModel < GcpResourceBase
  name 'google_vertex_ai_model'
  desc 'Model'
  supports platform: 'gcp'

  attr_reader :params
  attr_reader :model_source_info
  attr_reader :name
  attr_reader :metadata
  attr_reader :update_time
  attr_reader :etag
  attr_reader :description
  attr_reader :deployed_models
  attr_reader :create_time
  attr_reader :explanation_spec
  attr_reader :encryption_spec
  attr_reader :pipeline_job
  attr_reader :predict_schemata
  attr_reader :version_update_time
  attr_reader :supported_export_formats
  attr_reader :original_model_info
  attr_reader :metadata_artifact
  attr_reader :supported_input_storage_formats
  attr_reader :metadata_schema_uri
  attr_reader :container_spec
  attr_reader :version_id
  attr_reader :artifact_uri
  attr_reader :training_pipeline
  attr_reader :display_name
  attr_reader :supported_deployment_resources_types
  attr_reader :supported_output_storage_formats
  attr_reader :version_aliases
  attr_reader :version_create_time
  attr_reader :version_description
  attr_reader :labels

  def initialize(params)
    super(params.merge({ use_http_transport: true }))
    @params = params
    @fetched = @connection.fetch(product_url(params[:beta]), resource_base_url, params, 'Get')
    parse unless @fetched.nil?
  end

  def parse
    @model_source_info = GoogleInSpec::VertexAI::Property::ModelModelSourceInfo.new(@fetched['modelSourceInfo'], to_s)
    @name = @fetched['name']
    @metadata = @fetched['metadata']
    @update_time = @fetched['updateTime']
    @etag = @fetched['etag']
    @description = @fetched['description']
    @deployed_models = GoogleInSpec::VertexAI::Property::ModelDeployedModelsArray.parse(@fetched['deployedModels'], to_s)
    @create_time = @fetched['createTime']
    @explanation_spec = GoogleInSpec::VertexAI::Property::ModelExplanationSpec.new(@fetched['explanationSpec'], to_s)
    @encryption_spec = GoogleInSpec::VertexAI::Property::ModelEncryptionSpec.new(@fetched['encryptionSpec'], to_s)
    @pipeline_job = @fetched['pipelineJob']
    @predict_schemata = GoogleInSpec::VertexAI::Property::ModelPredictSchemata.new(@fetched['predictSchemata'], to_s)
    @version_update_time = @fetched['versionUpdateTime']
    @supported_export_formats = GoogleInSpec::VertexAI::Property::ModelSupportedExportFormatsArray.parse(@fetched['supportedExportFormats'], to_s)
    @original_model_info = GoogleInSpec::VertexAI::Property::ModelOriginalModelInfo.new(@fetched['originalModelInfo'], to_s)
    @metadata_artifact = @fetched['metadataArtifact']
    @supported_input_storage_formats = @fetched['supportedInputStorageFormats']
    @metadata_schema_uri = @fetched['metadataSchemaUri']
    @container_spec = GoogleInSpec::VertexAI::Property::ModelContainerSpec.new(@fetched['containerSpec'], to_s)
    @version_id = @fetched['versionId']
    @artifact_uri = @fetched['artifactUri']
    @training_pipeline = @fetched['trainingPipeline']
    @display_name = @fetched['displayName']
    @supported_deployment_resources_types = @fetched['supportedDeploymentResourcesTypes']
    @supported_output_storage_formats = @fetched['supportedOutputStorageFormats']
    @version_aliases = @fetched['versionAliases']
    @version_create_time = @fetched['versionCreateTime']
    @version_description = @fetched['versionDescription']
    @labels = GoogleInSpec::VertexAI::Property::ModelLabels.new(@fetched['labels'], to_s)
  end

  def exists?
    !@fetched.nil?
  end

  def to_s
    "Model #{@params[:name]}"
  end

  private

  def product_url(_ = nil)
    'https://{{region}}-aiplatform.googleapis.com/v1/'
  end

  def resource_base_url
    '{{name}}'
  end
end
