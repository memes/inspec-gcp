# frozen_string_literal: false

require 'gcp_backend'
require 'google/secretmanager/property/secret_version_replication_status'

class SecretManagerSecretVersion < GcpResourceBase
  name 'google_secret_manager_secret_version'
  desc 'Secret Manager secret version'
  supports platform: 'gcp'

  attr_reader :params
  attr_reader :name
  attr_reader :cretate_time
  attr_reader :delete_time
  attr_reader :state
  attr_reader :replication_status

  def initialize(params = {})
    super(params.merge({ use_http_transport: true }))
    @params = params
    @fetched = @connection.fetch(product_url(params[:beta]), resource_base_url, params, 'Get')
    parse unless @fetched.nil?
  end

  def parse
    @name = @fetched['name']
    @create_time = parse_time_string(@fetched['createTime'])
    @destroy_time = parse_time_string(@fetched['destroyTime'])
    @state = @fetched['state']
    @replication_status = GoogleInSpec::SecretManager::Property::SecretVersionReplicationStatus.new(@fetched['replicationStatus'], to_s)
  end

  def exists?
    !@fetched.nil?
  end

  def to_s
    "Secret Manager secret #{@params[:name]} version #{@params[:version]}"
  end

  def active?
    @state == 'ENABLED'
  end

  def disabled?
    @state == 'DISABLED'
  end

  def destroyed?
    @state == 'DESTROYED'
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
    'projects/{{project}}/secrets/{{name}}/versions/{{version}}'
  end
end
