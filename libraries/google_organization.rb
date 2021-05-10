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
require 'google/resourcemanager/property/organization_owner'

# A provider to manage Resource Manager resources.
class ResourceManagerOrganization < GcpResourceBase
  name 'google_organization'
  desc 'Organization'
  supports platform: 'gcp'

  attr_reader :params
  attr_reader :name
  attr_reader :display_name
  attr_reader :lifecycle_state
  attr_reader :creation_time
  attr_reader :owner

  def initialize(params)
    super(params.merge({ use_http_transport: true }))
    @params = params
    @fetched = @connection.fetch(product_url(params[:beta]), resource_base_url, params, 'Get')
    parse unless @fetched.nil?
  end

  def parse
    @name = @fetched['name']
    @display_name = @fetched['displayName']
    @lifecycle_state = @fetched['lifecycleState']
    @creation_time = parse_time_string(@fetched['creationTime'])
    @owner = GoogleInSpec::ResourceManager::Property::OrganizationOwner.new(@fetched['owner'], to_s)
  end

  # Handles parsing RFC3339 time string
  def parse_time_string(time_string)
    time_string ? Time.parse(time_string) : nil
  end

  def exists?
    !@fetched.nil?
  end

  def to_s
    "Organization #{@params[:name]}"
  end

  private

  def product_url(_ = nil)
    'https://cloudresourcemanager.googleapis.com/v1/'
  end

  def resource_base_url
    '{{name}}'
  end
end
