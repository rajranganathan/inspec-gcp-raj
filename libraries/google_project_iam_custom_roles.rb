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
class IAMCustomRoles < GcpResourceBase
  name 'google_project_iam_custom_roles'
  desc 'CustomRole plural resource'
  supports platform: 'gcp'

  attr_reader :table

  filter_table_config = FilterTable.create

  filter_table_config.add(:names, field: :name)
  filter_table_config.add(:titles, field: :title)
  filter_table_config.add(:descriptions, field: :description)
  filter_table_config.add(:included_permissions, field: :included_permissions)
  filter_table_config.add(:stages, field: :stage)
  filter_table_config.add(:deleteds, field: :deleted)

  filter_table_config.connect(self, :table)

  def initialize(params = {})
    super(params.merge({ use_http_transport: true }))
    @params = params
    @table = fetch_wrapped_resource('roles')
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
      'name' => ->(obj) { return :name, obj['name'] },
      'title' => ->(obj) { return :title, obj['title'] },
      'description' => ->(obj) { return :description, obj['description'] },
      'includedPermissions' => ->(obj) { return :included_permissions, obj['includedPermissions'] },
      'stage' => ->(obj) { return :stage, obj['stage'] },
      'deleted' => ->(obj) { return :deleted, obj['deleted'] },
    }
  end

  private

  def product_url(_ = nil)
    'https://iam.googleapis.com/v1/'
  end

  def resource_base_url
    'projects/{{project}}/roles?view=FULL'
  end
end
