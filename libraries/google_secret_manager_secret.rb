# frozen_string_literal: false

require 'gcp_backend'
require 'google/secretmanager/property/secret_replication'
require 'google/secretmanager/property/secret_rotation'

class SecretManagerSecret < GcpResourceBase
  name 'google_secret_manager_secret'
  desc 'Secret Manager secret'
  supports platform: 'gcp'

  attr_reader :params
  attr_reader :name
  attr_reader :replication
  attr_reader :cretate_time
  attr_reader :labels
  attr_reader :topics
  attr_reader :rotation
  attr_reader :version_aliases
  attr_reader :annotations
  attr_reader :expire_time

  def initialize(params = {})
    super(params.merge({ use_http_transport: true }))
    @params = params
    @fetched = @connection.fetch(product_url(params[:beta]), resource_base_url, params, 'Get')
    parse unless @fetched.nil?
  end

  def parse
    @name = @fetched['name']
    @replication = GoogleInSpec::SecretManager::Property::SecretReplication.new(@fetched['replication'], to_s)
    @create_time = parse_time_string(@fetched['createTime'])
    @labels = @fetched['labels']
    @topics = (@fetched['topics'] || {}).map { |v| v['name'] }.to_a
    @rotation = GoogleInSpec::SecretManager::Property::SecretRotation.new(@fetched['rotation'], to_s)
    @version_aliases = @fetched['versionAliases']
    @annotations = @fetched['annotations']
    @expire_time = parse_time_string(@fetched['expireTime'])
  end

  def exists?
    !@fetched.nil?
  end

  def to_s
    "Secret Manager secret #{@params[:name]}"
  end

  private

  # Handles parsing RFC3339 time string
  def parse_time_string(time_string)
    time_string ? Time.parse(time_string) : nil
  end

  def product_url(beta = false)
    if beta
      'https://secretmanager.googleapis.com/v1beta1/'
    else
      'https://secretmanager.googleapis.com/v1/'
    end
  end

  def resource_base_url
    'projects/{{project}}/secrets/{{name}}'
  end
end
