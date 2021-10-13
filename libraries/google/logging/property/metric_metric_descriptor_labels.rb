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
  module Logging
    module Property
      class MetricMetricDescriptorLabels
        attr_reader :key

        attr_reader :description

        attr_reader :value_type

        def initialize(args = nil, parent_identifier = nil)
          return if args.nil?
          @parent_identifier = parent_identifier
          @key = args['key']
          @description = args['description']
          @value_type = args['valueType']
        end

        def to_s
          "#{@parent_identifier} MetricMetricDescriptorLabels"
        end
      end

      class MetricMetricDescriptorLabelsArray
        def self.parse(value, parent_identifier)
          return if value.nil?
          return MetricMetricDescriptorLabels.new(value, parent_identifier) unless value.is_a?(::Array)
          value.map { |v| MetricMetricDescriptorLabels.new(v, parent_identifier) }
        end
      end
    end
  end
end
