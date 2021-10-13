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
require 'google/compute/property/instance_disks_initialize_params_source_image_encryption_key'
module GoogleInSpec
  module Compute
    module Property
      class InstanceDisksInitializeParams
        attr_reader :arguments

        attr_reader :disk_name

        attr_reader :disk_size_gb

        attr_reader :disk_type

        attr_reader :source_image

        attr_reader :source_image_encryption_key

        def initialize(arguments = nil, parent_identifier = nil)
          @arguments = arguments
          return if arguments.nil?
          @parent_identifier = parent_identifier
          @disk_name = arguments['diskName']
          @disk_size_gb = arguments['diskSizeGb']
          @disk_type = arguments['diskType']
          @source_image = arguments['sourceImage']
          @source_image_encryption_key = GoogleInSpec::Compute::Property::InstanceDisksInitializeParamsSourceImageEncryptionKey.new(arguments['sourceImageEncryptionKey'], to_s)
        end

        def to_s
          "#{@parent_identifier} InstanceDisksInitializeParams"
        end

        def self.un_parse(item, current_path)
          return if item.nil?
          way_to_parse = {
            'disk_name' => ->(x, path) { x.nil? ? [] : ["its('#{path}.disk_name') { should cmp #{x.inspect} }"] },
            'disk_size_gb' => ->(x, path) { x.nil? ? [] : ["its('#{path}.disk_size_gb') { should cmp #{x.inspect} }"] },
            'disk_type' => ->(x, path) { x.nil? ? [] : ["its('#{path}.disk_type') { should cmp #{x.inspect} }"] },
            'source_image' => ->(x, path) { x.nil? ? [] : ["its('#{path}.source_image') { should cmp #{x.inspect} }"] },
            'source_image_encryption_key' => ->(x, path) { x.nil? ? [] : GoogleInSpec::Compute::Property::InstanceDisksInitializeParamsSourceImageEncryptionKey.un_parse(x, "#{path}.source_image_encryption_key") },
          }
          way_to_parse.map do |k, v|
            v.call(item.method(k).call, current_path)
          end
        end

        def to_json(*_args)
          @arguments.to_json
        end

        # other is a string representation of this object
        def ==(other)
          @arguments == JSON.parse(other)
        end
      end
    end
  end
end
