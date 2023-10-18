# frozen_string_literal: false

require 'gcp_backend'
require 'google/secretmanager/property/secret_replication'
require 'google/secretmanager/property/secret_rotation'

class SecretManagerSecrets < GcpResourceBase
  name 'google_secret_manager_secrets'
  desc 'Secret Manager secrets'
  supports platform: 'gcp'

  attr_reader :table

  filter_table_config = FilterTable.create

  filter_table_config.add(:names, field: :name)
  filter_table_config.add(:replications, field: :replication)
  filter_table_config.add(:create_times, field: :create_time)
  filter_table_config.add(:labels, field: :labels)
  filter_table_config.add(:topics, field: :topics)
  filter_table_config.add(:rotations, field: :rotation)
  filter_table_config.add(:version_aliases, field: :version_aliases)
  filter_table_config.add(:annotations, field: :annotations)
  filter_table_config.add(:expire_times, field: :expire_time)

  filter_table_config.connect(self, :table)

  def initialize(params = {})
    super(params.merge({ use_http_transport: true }))
    @params = params
    @table = fetch_wrapped_resource('secrets')
  end

  def fetch_wrapped_resource(wrap_path)
    # fetch_resource returns an array of responses (to handle pagination)
    result = @connection.fetch_all(product_url(@params[:beta]), resource_base_url, @params, 'Get')
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
      'name' => ->(obj) { return :name, obj['name'] },
      'replication' => ->(obj) { return :replication, GoogleInSpec::SecretManager::Property::SecretReplication.new(obj['replication'], to_s) },
      'createTime' => ->(obj) { return :create_time, parse_time_string(obj['createTime']) },
      'labels' => ->(obj) { return :labels, obj['labels'] },
      'topics' => ->(obj) { return :topics, Array.new { obj['topics'].map { |v| v['name'] } } },
      'rotation' => ->(obj) { return :rotation, GoogleInSpec::SecretManager::Property::SecretRotation.new(obj['rotation'], to_s) },
      'versionAliases' => ->(obj) { return :version_aliases, obj['versionAliases'] },
      'annotations' => ->(obj) { return :annotations, obj['annotations'] },
      'expireTime' => ->(obj) { return :expire_time, parse_time_string(obj['expireTime']) },
    }
  end

  private

  # Handles parsing RFC3339 time string
  def parse_time_string(time_string)
    time_string ? Time.parse(time_string) : nil
  end

  def product_url(beta = false)
    if beta
      'https://secretmanager.googleapis.com/compute/v1beta1/'
    else
      'https://secretmanager.googleapis.com/v1/'
    end
  end

  def resource_base_url
    'projects/{{project}}/secrets'
  end
end
