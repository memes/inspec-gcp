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
module GoogleInSpec
  module VertexAI
    module Property
      class NasJobNasJobOutputMultiTrialJobOutputSearchTrialsFinalMeasurementMetrics
        attr_reader :metric_id

        attr_reader :value

        def initialize(args = nil, parent_identifier = nil)
          return if args.nil?
          @parent_identifier = parent_identifier
          @metric_id = args['metricId']
          @value = args['value']
        end

        def to_s
          "#{@parent_identifier} NasJobNasJobOutputMultiTrialJobOutputSearchTrialsFinalMeasurementMetrics"
        end
      end

      class NasJobNasJobOutputMultiTrialJobOutputSearchTrialsFinalMeasurementMetricsArray
        def self.parse(value, parent_identifier)
          return if value.nil?
          return NasJobNasJobOutputMultiTrialJobOutputSearchTrialsFinalMeasurementMetrics.new(value, parent_identifier) unless value.is_a?(::Array)
          value.map { |v| NasJobNasJobOutputMultiTrialJobOutputSearchTrialsFinalMeasurementMetrics.new(v, parent_identifier) }
        end
      end
    end
  end
end
