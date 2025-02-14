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
class VertexAIMetadataStoresExecutions < GcpResourceBase
  name 'google_vertex_ai_metadata_stores_executions'
  desc 'MetadataStoresExecution plural resource'
  supports platform: 'gcp'

  attr_reader :table

  filter_table_config = FilterTable.create

  filter_table_config.add(:labels, field: :labels)
  filter_table_config.add(:create_times, field: :create_time)
  filter_table_config.add(:schema_versions, field: :schema_version)
  filter_table_config.add(:states, field: :state)
  filter_table_config.add(:names, field: :name)
  filter_table_config.add(:etags, field: :etag)
  filter_table_config.add(:display_names, field: :display_name)
  filter_table_config.add(:metadata, field: :metadata)
  filter_table_config.add(:schema_titles, field: :schema_title)
  filter_table_config.add(:descriptions, field: :description)
  filter_table_config.add(:update_times, field: :update_time)

  filter_table_config.connect(self, :table)

  def initialize(params = {})
    super(params.merge({ use_http_transport: true }))
    @params = params
    @table = fetch_wrapped_resource('executions')
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
      'labels' => ->(obj) { return :labels, GoogleInSpec::VertexAI::Property::MetadataStoresExecutionLabels.new(obj['labels'], to_s) },
      'createTime' => ->(obj) { return :create_time, obj['createTime'] },
      'schemaVersion' => ->(obj) { return :schema_version, obj['schemaVersion'] },
      'state' => ->(obj) { return :state, obj['state'] },
      'name' => ->(obj) { return :name, obj['name'] },
      'etag' => ->(obj) { return :etag, obj['etag'] },
      'displayName' => ->(obj) { return :display_name, obj['displayName'] },
      'metadata' => ->(obj) { return :metadata, GoogleInSpec::VertexAI::Property::MetadataStoresExecutionMetadata.new(obj['metadata'], to_s) },
      'schemaTitle' => ->(obj) { return :schema_title, obj['schemaTitle'] },
      'description' => ->(obj) { return :description, obj['description'] },
      'updateTime' => ->(obj) { return :update_time, obj['updateTime'] },
    }
  end

  private

  def product_url(_ = nil)
    'https://{{region}}-aiplatform.googleapis.com/v1/'
  end

  def resource_base_url
    '{{parent}}/executions'
  end
end
