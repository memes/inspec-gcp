# frozen_string_literal: false

# ----------------------------------------------------------------------------
#
#     ***     AUTO GENERATED CODE    ***    AUTO GENERATED CODE     ***
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
module GoogleInSpec
  module Compute
    module Property
      class InstanceTemplatePropertiesServiceAccounts
        attr_reader :email

        attr_reader :scopes

        def initialize(args = nil, parent_identifier = nil)
          return if args.nil?
          @parent_identifier = parent_identifier
          @email = args['email']
          @scopes = args['scopes']
        end

        def to_s
          "#{@parent_identifier} InstanceTemplatePropertiesServiceAccounts"
        end
      end

      class InstanceTemplatePropertiesServiceAccountsArray
        def self.parse(value, parent_identifier)
          return if value.nil?
          return InstanceTemplatePropertiesServiceAccounts.new(value, parent_identifier) unless value.is_a?(::Array)
          value.map { |v| InstanceTemplatePropertiesServiceAccounts.new(v, parent_identifier) }
        end
      end
    end
  end
end
