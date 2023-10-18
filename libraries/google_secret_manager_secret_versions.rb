# frozen_string_literal: false

require 'gcp_backend'
require 'google/secretmanager/property/secret_version_replication_status'

class SecretManagerSecretVersions < GcpResourceBase
  name 'google_secret_manager_secret_versions'
  desc 'Secret Manager secret versions'
  supports platform: 'gcp'

  attr_reader :table

  filter_table_config = FilterTable.create

  filter_table_config.add(:names, field: :name)
  filter_table_config.add(:create_times, field: :create_time)
  filter_table_config.add(:destroy_times, field: :destroy_time)
  filter_table_config.add(:states, field: :state)
  filter_table_config.add(:replication_statuses, field: :replication_status)
  filter_table_config.add(:client_specified_payload_checksums, field: :client_specified_payload_checksum)

  filter_table_config.connect(self, :table)

  def initialize(params = {})
    super(params.merge({ use_http_transport: true }))
    @params = params
    @table = fetch_wrapped_resource('versions')
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
      'createTime' => ->(obj) { return :create_time, parse_time_string(obj['createTime']) },
      'destroyTime' => ->(obj) { return :destroy_time, parse_time_string(obj['destroyTime']) },
      'state' => ->(obj) { return :state, obj['state'] },
      'replicationStatus' => ->(obj) { return :replication_status, GoogleInSpec::SecretManager::Property::SecretVersionReplicationStatus.new(obj['replicationStatus'], to_s) },
      'clientSpecifiedPayloadChecksum' => ->(obj) { return :client_specified_payload_checksum, obj['clientSpecifiedPayloadChecksum'] },
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
    'projects/{{project}}/secrets/{{name}}/versions'
  end
end
