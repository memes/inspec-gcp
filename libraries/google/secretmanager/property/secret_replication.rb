# frozen_string_literal: false

module GoogleInSpec
  module SecretManager
    module Property
      class SecretReplication
        attr_reader :automatic_replication
        attr_reader :user_managed_replication

        def initialize(args = nil, parent_identifier = nil)
          return if args.nil?
          @parent_identifier = parent_identifier
          if !args['userManaged'].nil?
            replicas = args['userManaged']['replicas']
            @user_managed_replication = replicas.map { |v| UserManagedSecretReplication.new(v) }.to_a
          else
            @automatic_replication = AutomaticSecretReplication.new(args['automatic'])
          end
        end

        def exists?
          automatic? || user_managed?
        end

        def automatic?
          !@automatic_replication.nil?
        end

        def user_managed?
          !@user_managed_replication.nil?
        end

        def to_h
          auto_to_h.merge(user_managed_to_h)
        end

        private

        def auto_to_h
          return {} if @automatic_replication.nil?
          { 'auto' => @automatic_replication.kms_key_name }
        end

        def user_managed_to_h
          return {} if @user_managed_replication.nil?
          @user_managed_replication.map { |replica| [replica.location, replica.kms_key_name] }.to_h
        end
      end

      class AutomaticSecretReplication
        attr_reader :kms_key_name

        def initialize(args = nil)
          return if args.nil?
          return if args['customerManagedEncryption'].nil?
          @kms_key_name = args['customerManagedEncryption']['kmsKeyName']
        end
      end

      class UserManagedSecretReplication
        attr_reader :location
        attr_reader :kms_key_name

        def initialize(args = nil)
          return if args.nil?
          @location = args['location']
          return if args['customerManagedEncryption'].nil?
          @kms_key_name = args['customerManagedEncryption']['kmsKeyName']
        end
      end
    end
  end
end
