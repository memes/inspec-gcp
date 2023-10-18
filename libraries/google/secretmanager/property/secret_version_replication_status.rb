# frozen_string_literal: false

module GoogleInSpec
  module SecretManager
    module Property
      class SecretVersionReplicationStatus
        attr_reader :automatic_replication_status
        attr_reader :user_managed_replication_status

        def initialize(args = nil, parent_identifier = nil)
          return if args.nil?
          @parent_identifier = parent_identifier
          if !args['userManaged'].nil?
            replicas = args['userManaged']['replicas']
            @user_managed_replication_status = replicas.map { |v| UserManagedSecretVersionReplicationStatus.new(v) }
          else
            @automatic_replication_status = AutomaticSecretVersionReplicationStatus.new(args['automatic'])
          end
        end

        def automatic?
          !@automatic_replication_status.nil?
        end

        def user_managed?
          !@user_managed_replication_status.nil?
        end
      end

      class AutomaticSecretVersionReplicationStatus
        attr_reader :kms_key_version_name

        def initialize(args = nil)
          return if args.nil?
          return if args['customerManagedEncryption'].nil?
          @kms_key_version_name = args['customerManagedEncryption']['kmsKeyVersionName']
        end
      end

      class UserManagedSecretVersionReplicationStatus
        attr_reader :location
        attr_reader :kms_key_version_name

        def initialize(args = nil)
          return if args.nil?
          @location = args['location']
          return if args['customerManagedEncryption'].nil?
          @kms_key_name = args['customerManagedEncryption']['kmsKeyVersionName']
        end
      end
    end
  end
end
