# frozen_string_literal: false

module GoogleInSpec
  module SecretManager
    module Property
      class SecretRotation
        attr_reader :next_rotation_time
        attr_reader :rotation_period

        def initialize(args = nil, parent_identifier = nil)
          return if args.nil?
          @parent_identifier = parent_identifier
          @next_rotation_time = args['nextRotationTime']
          @rotation_period = args['rotationPeriod']
        end

        def to_s
          "#{@parent_identifier} SecretRotation"
        end
      end
    end
  end
end
