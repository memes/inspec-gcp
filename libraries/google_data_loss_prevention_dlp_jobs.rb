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
class DataLossPreventionDlpJobs < GcpResourceBase
  name 'google_data_loss_prevention_dlp_jobs'
  desc 'DlpJob plural resource'
  supports platform: 'gcp'

  attr_reader :table

  filter_table_config = FilterTable.create

  filter_table_config.add(:names, field: :name)
  filter_table_config.add(:types, field: :type)
  filter_table_config.add(:states, field: :state)
  filter_table_config.add(:create_times, field: :create_time)
  filter_table_config.add(:start_times, field: :start_time)
  filter_table_config.add(:end_times, field: :end_time)
  filter_table_config.add(:job_trigger_names, field: :job_trigger_name)
  filter_table_config.add(:errors, field: :errors)
  filter_table_config.add(:action_details, field: :action_details)
  filter_table_config.add(:risk_details, field: :risk_details)
  filter_table_config.add(:inspect_details, field: :inspect_details)
  filter_table_config.add(:parents, field: :parent)

  filter_table_config.connect(self, :table)

  def initialize(params = {})
    super(params.merge({ use_http_transport: true }))
    @params = params
    @table = fetch_wrapped_resource('dlpJobs')
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
      'name' => ->(obj) { return :name, obj['name'] },
      'type' => ->(obj) { return :type, obj['type'] },
      'state' => ->(obj) { return :state, obj['state'] },
      'createTime' => ->(obj) { return :create_time, obj['createTime'] },
      'startTime' => ->(obj) { return :start_time, obj['startTime'] },
      'endTime' => ->(obj) { return :end_time, obj['endTime'] },
      'jobTriggerName' => ->(obj) { return :job_trigger_name, obj['jobTriggerName'] },
      'errors' => ->(obj) { return :errors, GoogleInSpec::DataLossPrevention::Property::DlpJobErrorsArray.parse(obj['errors'], to_s) },
      'actionDetails' => ->(obj) { return :action_details, GoogleInSpec::DataLossPrevention::Property::DlpJobActionDetailsArray.parse(obj['actionDetails'], to_s) },
      'riskDetails' => ->(obj) { return :risk_details, GoogleInSpec::DataLossPrevention::Property::DlpJobRiskDetailsArray.parse(obj['riskDetails'], to_s) },
      'inspectDetails' => ->(obj) { return :inspect_details, GoogleInSpec::DataLossPrevention::Property::DlpJobInspectDetailsArray.parse(obj['inspectDetails'], to_s) },
      'parent' => ->(obj) { return :parent, obj['parent'] },
    }
  end

  private

  def product_url(_ = nil)
    'https://dlp.googleapis.com/v2/'
  end

  def resource_base_url
    '{{parent}}/dlpJobs'
  end
end
