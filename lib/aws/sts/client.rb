# Copyright 2011-2013 Amazon.com, Inc. or its affiliates. All Rights Reserved.
#
# Licensed under the Apache License, Version 2.0 (the "License"). You
# may not use this file except in compliance with the License. A copy of
# the License is located at
#
#     http://aws.amazon.com/apache2.0/
#
# or in the "license" file accompanying this file. This file is
# distributed on an "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF
# ANY KIND, either express or implied. See the License for the specific
# language governing permissions and limitations under the License.

module AWS
  class STS

    # Client class for AWS Security Token Service (STS).
    class Client < Core::QueryClient

      API_VERSION = '2011-06-15'

      REGION_US_E1 = 'sts.amazonaws.com'

      # @api private
      CACHEABLE_REQUESTS = Set[]

      def initialize *args
        super
        unless config.use_ssl?
          msg = 'AWS Security Token Service (STS) requires ssl but the ' +
            ':use_ssl option is set to false.  Try passing :use_ssl => true'
          raise ArgumentError, msg
        end
      end

    end

    class Client::V20110615 < Client

      # client methods #

      # @!method assume_role(options = {})
      # Calls the AssumeRole API operation.
      # @param [Hash] options
      #
      #   * `:role_arn` - *required* - (String) The Amazon Resource Name (ARN)
      #     of the role that the caller is assuming.
      #   * `:role_session_name` - *required* - (String) An identifier for the
      #     assumed role session. The session name is included as part of the
      #     AssumedRoleUser.
      #   * `:policy` - (String) A supplemental policy that is associated with
      #     the temporary security credentials from the AssumeRole call. The
      #     resulting permissions of the temporary security credentials are an
      #     intersection of this policy and the access policy that is
      #     associated with the role. Use this policy to further restrict the
      #     permissions of the temporary security credentials.
      #   * `:duration_seconds` - (Integer) The duration, in seconds, of the
      #     role session. The value can range from 900 seconds (15 minutes) to
      #     3600 seconds (1 hour). By default, the value is set to 3600
      #     seconds.
      #   * `:external_id` - (String) A unique identifier that is used by third
      #     parties to assume a role in their customers' accounts. For each
      #     role that the third party can assume, they should instruct their
      #     customers to create a role with the external ID that the third
      #     party generated. Each time the third party assumes the role, they
      #     must pass the customer's external ID. The external ID is useful in
      #     order to help third parties bind a role to the customer who created
      #     it. For more information about the external ID, see About the
      #     External ID in Using Temporary Security Credentials.
      # @return [Core::Response]
      #   The #data method of the response object returns
      #   a hash with the following structure:
      #
      #   * `:credentials` - (Hash)
      #     * `:access_key_id` - (String)
      #     * `:secret_access_key` - (String)
      #     * `:session_token` - (String)
      #     * `:expiration` - (Time)
      #   * `:assumed_role_user` - (Hash)
      #     * `:assumed_role_id` - (String)
      #     * `:arn` - (String)
      #   * `:packed_policy_size` - (Integer)

      # @!method assume_role_with_web_identity(options = {})
      # Calls the AssumeRoleWithWebIdentity API operation.
      # @param [Hash] options
      #
      #   * `:role_arn` - *required* - (String) The Amazon Resource Name (ARN)
      #     of the role that the caller is assuming.
      #   * `:role_session_name` - *required* - (String) An identifier for the
      #     assumed role session. Typically, you pass the name or identifier
      #     that is associated with the user who is using your application.
      #     That way, the temporary security credentials that your application
      #     will use are associated with that user. This session name is
      #     included as part of the ARN and assumed role ID in the
      #     AssumedRoleUser response element.
      #   * `:web_identity_token` - *required* - (String) The OAuth 2.0 access
      #     token or OpenID Connect ID token that is provided by the identity
      #     provider. Your application must get this token by authenticating
      #     the user who is using your application with a web identity provider
      #     before the application makes an AssumeRoleWithWebIdentity call.
      #   * `:provider_id` - (String) The fully-qualified host component of the
      #     domain name of the identity provider. Specify this value only for
      #     OAuth access tokens. Do not specify this value for OpenID Connect
      #     ID tokens, such as accounts.google.com. Do not include URL schemes
      #     and port numbers. Currently, www.amazon.com and graph.facebook.com
      #     are supported.
      #   * `:policy` - (String) A supplemental policy that is associated with
      #     the temporary security credentials from the
      #     AssumeRoleWithWebIdentity call. The resulting permissions of the
      #     temporary security credentials are an intersection of this policy
      #     and the access policy that is associated with the role. Use this
      #     policy to further restrict the permissions of the temporary
      #     security credentials.
      #   * `:duration_seconds` - (Integer) The duration, in seconds, of the
      #     role session. The value can range from 900 seconds (15 minutes) to
      #     3600 seconds (1 hour). By default, the value is set to 3600
      #     seconds.
      # @return [Core::Response]
      #   The #data method of the response object returns
      #   a hash with the following structure:
      #
      #   * `:credentials` - (Hash)
      #     * `:access_key_id` - (String)
      #     * `:secret_access_key` - (String)
      #     * `:session_token` - (String)
      #     * `:expiration` - (Time)
      #   * `:subject_from_web_identity_token` - (String)
      #   * `:assumed_role_user` - (Hash)
      #     * `:assumed_role_id` - (String)
      #     * `:arn` - (String)
      #   * `:packed_policy_size` - (Integer)

      # @!method decode_authorization_message(options = {})
      # Calls the DecodeAuthorizationMessage API operation.
      # @param [Hash] options
      #
      #   * `:encoded_message` - *required* - (String) The encoded message that
      #     was returned with the response.
      # @return [Core::Response]
      #   The #data method of the response object returns
      #   a hash with the following structure:
      #
      #   * `:decoded_message` - (String)

      # @!method get_federation_token(options = {})
      # Calls the GetFederationToken API operation.
      # @param [Hash] options
      #
      #   * `:name` - *required* - (String) The name of the federated user. The
      #     name is used as an identifier for the temporary security
      #     credentials (such as Bob). For example, you can reference the
      #     federated user name in a resource-based policy, such as in an
      #     Amazon S3 bucket policy.
      #   * `:policy` - (String) A policy that specifies the permissions that
      #     are granted to the federated user. By default, federated users have
      #     no permissions; they do not inherit any from the IAM user. When you
      #     specify a policy, the federated user's permissions are intersection
      #     of the specified policy and the IAM user's policy. If you don't
      #     specify a policy, federated users can only access AWS resources
      #     that explicitly allow those federated users in a resource policy,
      #     such as in an Amazon S3 bucket policy.
      #   * `:duration_seconds` - (Integer) The duration, in seconds, that the
      #     session should last. Acceptable durations for federation sessions
      #     range from 900 seconds (15 minutes) to 129600 seconds (36 hours),
      #     with 43200 seconds (12 hours) as the default. Sessions for AWS
      #     account owners are restricted to a maximum of 3600 seconds (one
      #     hour). If the duration is longer than one hour, the session for AWS
      #     account owners defaults to one hour.
      # @return [Core::Response]
      #   The #data method of the response object returns
      #   a hash with the following structure:
      #
      #   * `:credentials` - (Hash)
      #     * `:access_key_id` - (String)
      #     * `:secret_access_key` - (String)
      #     * `:session_token` - (String)
      #     * `:expiration` - (Time)
      #   * `:federated_user` - (Hash)
      #     * `:federated_user_id` - (String)
      #     * `:arn` - (String)
      #   * `:packed_policy_size` - (Integer)

      # @!method get_session_token(options = {})
      # Calls the GetSessionToken API operation.
      # @param [Hash] options
      #
      #   * `:duration_seconds` - (Integer) The duration, in seconds, that the
      #     credentials should remain valid. Acceptable durations for IAM user
      #     sessions range from 900 seconds (15 minutes) to 129600 seconds (36
      #     hours), with 43200 seconds (12 hours) as the default. Sessions for
      #     AWS account owners are restricted to a maximum of 3600 seconds (one
      #     hour). If the duration is longer than one hour, the session for AWS
      #     account owners defaults to one hour.
      #   * `:serial_number` - (String) The identification number of the MFA
      #     device that is associated with the IAM user who is making the
      #     GetSessionToken call. Specify this value if the IAM user has a
      #     policy that requires MFA authentication. The value is either the
      #     serial number for a hardware device (such as GAHT12345678) or an
      #     Amazon Resource Name (ARN) for a virtual device (such as
      #     arn:aws:iam::123456789012:mfa/user). You can find the device for an
      #     IAM user by going to the AWS Management Console and viewing the
      #     user's security credentials.
      #   * `:token_code` - (String) The value provided by the MFA device, if
      #     MFA is required. If any policy requires the IAM user to submit an
      #     MFA code, specify this value. If MFA authentication is required,
      #     and the user does not provide a code when requesting a set of
      #     temporary security credentials, the user will receive an "access
      #     denied" response when requesting resources that require MFA
      #     authentication.
      # @return [Core::Response]
      #   The #data method of the response object returns
      #   a hash with the following structure:
      #
      #   * `:credentials` - (Hash)
      #     * `:access_key_id` - (String)
      #     * `:secret_access_key` - (String)
      #     * `:session_token` - (String)
      #     * `:expiration` - (Time)

      # end client methods #

      define_client_methods('2011-06-15')

    end
  end
end
