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
class VertexAIIndexs < GcpResourceBase
  name 'google_vertex_ai_indices'
  desc 'Index plural resource'
  supports platform: 'gcp'

  attr_reader :table

  filter_table_config = FilterTable.create

  filter_table_config.add(:descriptions, field: :description)
  filter_table_config.add(:metadata, field: :metadata)
  filter_table_config.add(:index_stats, field: :index_stats)
  filter_table_config.add(:names, field: :name)
  filter_table_config.add(:deployed_indexes, field: :deployed_indexes)
  filter_table_config.add(:display_names, field: :display_name)
  filter_table_config.add(:metadata_schema_uris, field: :metadata_schema_uri)
  filter_table_config.add(:index_update_methods, field: :index_update_method)
  filter_table_config.add(:update_times, field: :update_time)
  filter_table_config.add(:create_times, field: :create_time)
  filter_table_config.add(:etags, field: :etag)
  filter_table_config.add(:labels, field: :labels)

  filter_table_config.connect(self, :table)

  def initialize(params = {})
    super(params.merge({ use_http_transport: true }))
    @params = params
    @table = fetch_wrapped_resource('indexes')
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
      'description' => ->(obj) { return :description, obj['description'] },
      'metadata' => ->(obj) { return :metadata, obj['metadata'] },
      'indexStats' => ->(obj) { return :index_stats, obj['indexStats'] },
      'name' => ->(obj) { return :name, obj['name'] },
      'deployedIndexes' => ->(obj) { return :deployed_indexes, obj['deployedIndexes'] },
      'displayName' => ->(obj) { return :display_name, obj['displayName'] },
      'metadataSchemaUri' => ->(obj) { return :metadata_schema_uri, obj['metadataSchemaUri'] },
      'indexUpdateMethod' => ->(obj) { return :index_update_method, obj['indexUpdateMethod'] },
      'updateTime' => ->(obj) { return :update_time, obj['updateTime'] },
      'createTime' => ->(obj) { return :create_time, obj['createTime'] },
      'etag' => ->(obj) { return :etag, obj['etag'] },
      'labels' => ->(obj) { return :labels, GoogleInSpec::VertexAI::Property::IndexLabels.new(obj['labels'], to_s) },
    }
  end

  private

  def product_url(_ = nil)
    'https://{{region}}-aiplatform.googleapis.com/v1/'
  end

  def resource_base_url
    '{{parent}}/indexes'
  end
end
