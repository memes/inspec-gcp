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
class VertexAIModelsEvaluations < GcpResourceBase
  name 'google_vertex_ai_models_evaluations'
  desc 'ModelsEvaluation plural resource'
  supports platform: 'gcp'

  attr_reader :table

  filter_table_config = FilterTable.create

  filter_table_config.add(:data_item_schema_uris, field: :data_item_schema_uri)
  filter_table_config.add(:metadata, field: :metadata)
  filter_table_config.add(:metrics_schema_uris, field: :metrics_schema_uri)
  filter_table_config.add(:create_times, field: :create_time)
  filter_table_config.add(:annotation_schema_uris, field: :annotation_schema_uri)
  filter_table_config.add(:metrics, field: :metrics)
  filter_table_config.add(:explanation_specs, field: :explanation_specs)
  filter_table_config.add(:slice_dimensions, field: :slice_dimensions)
  filter_table_config.add(:model_explanations, field: :model_explanation)
  filter_table_config.add(:names, field: :name)
  filter_table_config.add(:display_names, field: :display_name)

  filter_table_config.connect(self, :table)

  def initialize(params = {})
    super(params.merge({ use_http_transport: true }))
    @params = params
    @table = fetch_wrapped_resource('modelsEvaluations')
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
      'dataItemSchemaUri' => ->(obj) { return :data_item_schema_uri, obj['dataItemSchemaUri'] },
      'metadata' => ->(obj) { return :metadata, obj['metadata'] },
      'metricsSchemaUri' => ->(obj) { return :metrics_schema_uri, obj['metricsSchemaUri'] },
      'createTime' => ->(obj) { return :create_time, obj['createTime'] },
      'annotationSchemaUri' => ->(obj) { return :annotation_schema_uri, obj['annotationSchemaUri'] },
      'metrics' => ->(obj) { return :metrics, obj['metrics'] },
      'explanationSpecs' => ->(obj) { return :explanation_specs, GoogleInSpec::VertexAI::Property::ModelsEvaluationExplanationSpecsArray.parse(obj['explanationSpecs'], to_s) },
      'sliceDimensions' => ->(obj) { return :slice_dimensions, obj['sliceDimensions'] },
      'modelExplanation' => ->(obj) { return :model_explanation, GoogleInSpec::VertexAI::Property::ModelsEvaluationModelExplanation.new(obj['modelExplanation'], to_s) },
      'name' => ->(obj) { return :name, obj['name'] },
      'displayName' => ->(obj) { return :display_name, obj['displayName'] },
    }
  end

  private

  def product_url(_ = nil)
    'https://{{region}}-aiplatform.googleapis.com/v1/'
  end

  def resource_base_url
    '{{parent}}/evaluations'
  end
end
