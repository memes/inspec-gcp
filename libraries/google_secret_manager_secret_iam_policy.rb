# frozen_string_literal: false

require 'gcp_backend'
require 'google/iam/property/iam_policy_audit_configs'
require 'google/iam/property/iam_policy_bindings'

class SecretManagerSecretIamPolicy < GcpResourceBase
  name 'google_secret_manager_secret_iam_policy'
  desc 'Secret Manager secret IAM policy'
  supports platform: 'gcp'

  attr_reader :params
  attr_reader :bindings
  attr_reader :audit_configs

  def initialize(params = {})
    super(params.merge({ use_http_transport: true }))
    @params = params
    @fetched = @connection.fetch(product_url(params[:beta]), resource_base_url, params, 'Get')
    parse unless @fetched.nil?
  end

  def parse
    @bindings = GoogleInSpec::Iam::Property::IamPolicyBindingsArray.parse(@fetched['bindings'], to_s)
    @audit_configs = GoogleInSpec::Iam::Property::IamPolicyAuditConfigsArray.parse(@fetched['auditConfigs'], to_s)
  end

  def exists?
    !@fetched.nil?
  end

  def to_s
    "Secret Manager secret IAM policy #{@params[:name]}"
  end

  def iam_binding_roles
    @bindings.map(&:role)
  end

  def count
    @bindings.size
  end

  private

  def product_url(beta = false)
    if beta
      'https://secretmanager.googleapis.com/compute/v1beta1/'
    else
      'https://secretmanager.googleapis.com/v1/'
    end
  end

  def resource_base_url
    'projects/{{project}}/secrets/{{name}}:getIamPolicy'
  end
end
