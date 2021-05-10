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
require 'gcp_backend'
class MonitoringAlertPolicys < GcpResourceBase
  name 'google_project_alert_policies'
  desc 'AlertPolicy plural resource'
  supports platform: 'gcp'

  attr_reader :table

  filter_table_config = FilterTable.create

  filter_table_config.add(:policy_names, field: :policy_names)
  filter_table_config.add(:policy_display_names, field: :policy_display_names)
  filter_table_config.add(:combiners, field: :combiner)
  filter_table_config.add(:creation_records, field: :creation_record)
  filter_table_config.add(:policy_enabled_states, field: :policy_enabled_state)
  filter_table_config.add(:conditions, field: :conditions)
  filter_table_config.add(:notification_channels, field: :notification_channels)
  filter_table_config.add(:user_labels, field: :user_labels)
  filter_table_config.add(:documentations, field: :documentation)

  filter_table_config.connect(self, :table)

  def initialize(params = {})
    super(params.merge({ use_http_transport: true }))
    @params = params
    @table = fetch_wrapped_resource('alertPolicies')
  end

  def fetch_wrapped_resource(wrap_path)
    # fetch_resource returns an array of responses (to handle pagination)
    result = @connection.fetch_all(product_url, resource_base_url, @params, 'Get')
    return if result.nil?

    # Conversion of string -> object hash to symbol -> object hash that InSpec needs
    converted = []
    result.each do |response|
      next if response.nil? || !response.key?(wrap_path)
      response[wrap_path].each do |hash|
        hash_with_symbols = {}
        hash.each_key do |key|
          name, value = transform(key, hash)
          hash_with_symbols[name] = value
        end
        converted.push(hash_with_symbols)
      end
    end

    converted
  end

  def transform(key, value)
    return transformers[key].call(value) if transformers.key?(key)

    [key.to_sym, value]
  end

  def transformers
    {
      'name' => ->(obj) { return :policy_names, obj['name'] },
      'displayName' => ->(obj) { return :policy_display_names, obj['displayName'] },
      'combiner' => ->(obj) { return :combiner, obj['combiner'] },
      'creationRecord' => ->(obj) { return :creation_record, GoogleInSpec::Monitoring::Property::AlertPolicyCreationRecord.new(obj['creationRecord'], to_s) },
      'enabled' => ->(obj) { return :policy_enabled_state, obj['enabled'] },
      'conditions' => ->(obj) { return :conditions, GoogleInSpec::Monitoring::Property::AlertPolicyConditionsArray.parse(obj['conditions'], to_s) },
      'notificationChannels' => ->(obj) { return :notification_channels, obj['notificationChannels'] },
      'userLabels' => ->(obj) { return :user_labels, obj['userLabels'] },
      'documentation' => ->(obj) { return :documentation, GoogleInSpec::Monitoring::Property::AlertPolicyDocumentation.new(obj['documentation'], to_s) },
    }
  end

  private

  def product_url(_ = nil)
    'https://monitoring.googleapis.com/'
  end

  def resource_base_url
    'v3/projects/{{project}}/alertPolicies'
  end
end