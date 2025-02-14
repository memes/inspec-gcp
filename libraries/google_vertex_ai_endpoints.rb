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
class VertexAIEndpoints < GcpResourceBase
  name 'google_vertex_ai_endpoints'
  desc 'Endpoint plural resource'
  supports platform: 'gcp'

  attr_reader :table

  filter_table_config = FilterTable.create

  filter_table_config.add(:encryption_specs, field: :encryption_spec)
  filter_table_config.add(:enable_private_service_connects, field: :enable_private_service_connect)
  filter_table_config.add(:update_times, field: :update_time)
  filter_table_config.add(:model_deployment_monitoring_jobs, field: :model_deployment_monitoring_job)
  filter_table_config.add(:descriptions, field: :description)
  filter_table_config.add(:deployed_models, field: :deployed_models)
  filter_table_config.add(:networks, field: :network)
  filter_table_config.add(:traffic_splits, field: :traffic_split)
  filter_table_config.add(:labels, field: :labels)
  filter_table_config.add(:display_names, field: :display_name)
  filter_table_config.add(:predict_request_response_logging_configs, field: :predict_request_response_logging_config)
  filter_table_config.add(:etags, field: :etag)
  filter_table_config.add(:create_times, field: :create_time)
  filter_table_config.add(:names, field: :name)

  filter_table_config.connect(self, :table)

  def initialize(params = {})
    super(params.merge({ use_http_transport: true }))
    @params = params
    @table = fetch_wrapped_resource('endpoints')
  end

  def fetch_wrapped_resource(wrap_path)
    # fetch_resource returns an array of responses (to handle pagination)
    result = @connection.fetch_all(product_url, resource_base_url, @params, 'Get')
    return if result.nil?

    # Conversion of string -> object hash to symbol -> object hash that InSpec needs
    converted = []
    result.each do |response|
      next if response.nil? || !response.key?(wrap_path)
      response[wrap_path].each do |hash|
        hash_with_symbols = {}
        hash.each_key do |key|
          name, value = transform(key, hash)
          hash_with_symbols[name] = value
        end
        converted.push(hash_with_symbols)
      end
    end

    converted
  end

  def transform(key, value)
    return transformers[key].call(value) if transformers.key?(key)

    [key.to_sym, value]
  end

  def transformers
    {
      'encryptionSpec' => ->(obj) { return :encryption_spec, GoogleInSpec::VertexAI::Property::EndpointEncryptionSpec.new(obj['encryptionSpec'], to_s) },
      'enablePrivateServiceConnect' => ->(obj) { return :enable_private_service_connect, obj['enablePrivateServiceConnect'] },
      'updateTime' => ->(obj) { return :update_time, obj['updateTime'] },
      'modelDeploymentMonitoringJob' => ->(obj) { return :model_deployment_monitoring_job, obj['modelDeploymentMonitoringJob'] },
      'description' => ->(obj) { return :description, obj['description'] },
      'deployedModels' => ->(obj) { return :deployed_models, GoogleInSpec::VertexAI::Property::EndpointDeployedModelsArray.parse(obj['deployedModels'], to_s) },
      'network' => ->(obj) { return :network, obj['network'] },
      'trafficSplit' => ->(obj) { return :traffic_split, GoogleInSpec::VertexAI::Property::EndpointTrafficSplit.new(obj['trafficSplit'], to_s) },
      'labels' => ->(obj) { return :labels, GoogleInSpec::VertexAI::Property::EndpointLabels.new(obj['labels'], to_s) },
      'displayName' => ->(obj) { return :display_name, obj['displayName'] },
      'predictRequestResponseLoggingConfig' => ->(obj) { return :predict_request_response_logging_config, GoogleInSpec::VertexAI::Property::EndpointPredictRequestResponseLoggingConfig.new(obj['predictRequestResponseLoggingConfig'], to_s) },
      'etag' => ->(obj) { return :etag, obj['etag'] },
      'createTime' => ->(obj) { return :create_time, obj['createTime'] },
      'name' => ->(obj) { return :name, obj['name'] },
    }
  end

  private

  def product_url(_ = nil)
    'https://{{region}}-aiplatform.googleapis.com/v1/'
  end

  def resource_base_url
    '{{parent}}/endpoints'
  end
end
