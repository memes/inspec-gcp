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
require 'google/datalossprevention/property/dlpjob_action_details'
require 'google/datalossprevention/property/dlpjob_errors'
require 'google/datalossprevention/property/dlpjob_inspect_details'
require 'google/datalossprevention/property/dlpjob_risk_details'

# A provider to manage Data loss prevention resources.
class DataLossPreventionDlpJob < GcpResourceBase
  name 'google_data_loss_prevention_dlp_job'
  desc 'DlpJob'
  supports platform: 'gcp'

  attr_reader :params
  attr_reader :name
  attr_reader :type
  attr_reader :state
  attr_reader :create_time
  attr_reader :start_time
  attr_reader :end_time
  attr_reader :job_trigger_name
  attr_reader :errors
  attr_reader :action_details
  attr_reader :risk_details
  attr_reader :inspect_details
  attr_reader :parent

  def initialize(params)
    super(params.merge({ use_http_transport: true }))
    @params = params
    @fetched = @connection.fetch(product_url(params[:beta]), resource_base_url, params, 'Get')
    parse unless @fetched.nil?
  end

  def parse
    @name = @fetched['name']
    @type = @fetched['type']
    @state = @fetched['state']
    @create_time = @fetched['createTime']
    @start_time = @fetched['startTime']
    @end_time = @fetched['endTime']
    @job_trigger_name = @fetched['jobTriggerName']
    @errors = GoogleInSpec::DataLossPrevention::Property::DlpJobErrorsArray.parse(@fetched['errors'], to_s)
    @action_details = GoogleInSpec::DataLossPrevention::Property::DlpJobActionDetailsArray.parse(@fetched['actionDetails'], to_s)
    @risk_details = GoogleInSpec::DataLossPrevention::Property::DlpJobRiskDetailsArray.parse(@fetched['riskDetails'], to_s)
    @inspect_details = GoogleInSpec::DataLossPrevention::Property::DlpJobInspectDetailsArray.parse(@fetched['inspectDetails'], to_s)
    @parent = @fetched['parent']
  end

  def exists?
    !@fetched.nil?
  end

  def to_s
    "DlpJob #{@params[:name]}"
  end

  private

  def product_url(_ = nil)
    'https://dlp.googleapis.com/v2/'
  end

  def resource_base_url
    '{{parent}}/dlpJobs/{{name}}'
  end
end
