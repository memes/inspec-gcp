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
  module Container
    module Property
      class RegionalClusterIpAllocationPolicy
        attr_reader :arguments

        attr_reader :use_ip_aliases

        attr_reader :create_subnetwork

        attr_reader :subnetwork_name

        attr_reader :cluster_secondary_range_name

        attr_reader :services_secondary_range_name

        attr_reader :cluster_ipv4_cidr_block

        attr_reader :node_ipv4_cidr_block

        attr_reader :services_ipv4_cidr_block

        attr_reader :tpu_ipv4_cidr_block

        def initialize(arguments = nil, parent_identifier = nil)
          @arguments = arguments
          return if arguments.nil?
          @parent_identifier = parent_identifier
          @use_ip_aliases = arguments['useIpAliases']
          @create_subnetwork = arguments['createSubnetwork']
          @subnetwork_name = arguments['subnetworkName']
          @cluster_secondary_range_name = arguments['clusterSecondaryRangeName']
          @services_secondary_range_name = arguments['servicesSecondaryRangeName']
          @cluster_ipv4_cidr_block = arguments['clusterIpv4CidrBlock']
          @node_ipv4_cidr_block = arguments['nodeIpv4CidrBlock']
          @services_ipv4_cidr_block = arguments['servicesIpv4CidrBlock']
          @tpu_ipv4_cidr_block = arguments['tpuIpv4CidrBlock']
        end

        def to_s
          "#{@parent_identifier} RegionalClusterIpAllocationPolicy"
        end

        def self.un_parse(item, current_path)
          return if item.nil?
          way_to_parse = {
            'use_ip_aliases' => ->(x, path) { x.nil? ? [] : ["its('#{path}.use_ip_aliases') { should cmp #{x.inspect} }"] },
            'create_subnetwork' => ->(x, path) { x.nil? ? [] : ["its('#{path}.create_subnetwork') { should cmp #{x.inspect} }"] },
            'subnetwork_name' => ->(x, path) { x.nil? ? [] : ["its('#{path}.subnetwork_name') { should cmp #{x.inspect} }"] },
            'cluster_secondary_range_name' => ->(x, path) { x.nil? ? [] : ["its('#{path}.cluster_secondary_range_name') { should cmp #{x.inspect} }"] },
            'services_secondary_range_name' => ->(x, path) { x.nil? ? [] : ["its('#{path}.services_secondary_range_name') { should cmp #{x.inspect} }"] },
            'cluster_ipv4_cidr_block' => ->(x, path) { x.nil? ? [] : ["its('#{path}.cluster_ipv4_cidr_block') { should cmp #{x.inspect} }"] },
            'node_ipv4_cidr_block' => ->(x, path) { x.nil? ? [] : ["its('#{path}.node_ipv4_cidr_block') { should cmp #{x.inspect} }"] },
            'services_ipv4_cidr_block' => ->(x, path) { x.nil? ? [] : ["its('#{path}.services_ipv4_cidr_block') { should cmp #{x.inspect} }"] },
            'tpu_ipv4_cidr_block' => ->(x, path) { x.nil? ? [] : ["its('#{path}.tpu_ipv4_cidr_block') { should cmp #{x.inspect} }"] },
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
