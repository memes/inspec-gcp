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
            @user_managed_replication_status = replicas.map { |v| UserManagedSecretVersionReplicationStatus.new(v) }.to_a
          else
            @automatic_replication_status = AutomaticSecretVersionReplicationStatus.new(args['automatic'])
          end
        end

        def exists?
          automatic? || user_managed?
        end

        def automatic?
          !@automatic_replication_status.nil?
        end

        def user_managed?
          !@user_managed_replication_status.nil?
        end

        def to_h
          auto_to_h.merge(user_managed_to_h)
        end

        private

        def auto_to_h
          return {} if @automatic_replication_status.nil?
          { 'auto' => @automatic_replication_status.kms_key_version_name }
        end

        def user_managed_to_h
          return {} if @user_managed_replication_status.nil?
          @user_managed_replication_status.map { |status| [status.location, status.kms_key_version_name] }.to_h
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
          @kms_key_version_name = args['customerManagedEncryption']['kmsKeyVersionName']
        end
      end
    end
  end
end
