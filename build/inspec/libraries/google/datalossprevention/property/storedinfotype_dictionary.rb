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
require 'google/datalossprevention/property/storedinfotype_dictionary_cloud_storage_path'
require 'google/datalossprevention/property/storedinfotype_dictionary_word_list'
module GoogleInSpec
  module DataLossPrevention
    module Property
      class StoredInfoTypeDictionary
        attr_reader :word_list

        attr_reader :cloud_storage_path

        def initialize(args = nil, parent_identifier = nil)
          return if args.nil?
          @parent_identifier = parent_identifier
          @word_list = GoogleInSpec::DataLossPrevention::Property::StoredInfoTypeDictionaryWordList.new(args['wordList'], to_s)
          @cloud_storage_path = GoogleInSpec::DataLossPrevention::Property::StoredInfoTypeDictionaryCloudStoragePath.new(args['cloudStoragePath'], to_s)
        end

        def to_s
          "#{@parent_identifier} StoredInfoTypeDictionary"
        end
      end
    end
  end
end
