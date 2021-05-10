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
class MLEngineModels < GcpResourceBase
  name 'google_ml_engine_models'
  desc 'Model plural resource'
  supports platform: 'gcp'

  attr_reader :table

  filter_table_config = FilterTable.create

  filter_table_config.add(:names, field: :name)
  filter_table_config.add(:descriptions, field: :description)
  filter_table_config.add(:default_versions, field: :default_version)
  filter_table_config.add(:regions, field: :regions)
  filter_table_config.add(:online_prediction_loggings, field: :online_prediction_logging)
  filter_table_config.add(:online_prediction_console_loggings, field: :online_prediction_console_logging)
  filter_table_config.add(:labels, field: :labels)

  filter_table_config.connect(self, :table)

  def initialize(params = {})
    super(params.merge({ use_http_transport: true }))
    @params = params
    @table = fetch_wrapped_resource('models')
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
      'description' => ->(obj) { return :description, obj['description'] },
      'defaultVersion' => ->(obj) { return :default_version, GoogleInSpec::MLEngine::Property::ModelDefaultVersion.new(obj['defaultVersion'], to_s) },
      'regions' => ->(obj) { return :regions, obj['regions'] },
      'onlinePredictionLogging' => ->(obj) { return :online_prediction_logging, obj['onlinePredictionLogging'] },
      'onlinePredictionConsoleLogging' => ->(obj) { return :online_prediction_console_logging, obj['onlinePredictionConsoleLogging'] },
      'labels' => ->(obj) { return :labels, obj['labels'] },
    }
  end

  # Handles parsing RFC3339 time string
  def parse_time_string(time_string)
    time_string ? Time.parse(time_string) : nil
  end

  def identifiers
    params = %w{project name}

    result = []
    @table.each do |item|
      combo = item.merge(@params)
      item_identifiers = {}
      params.each do |param|
        item_identifiers[param.to_sym] = combo[param.to_sym]
      end
      result.push(item_identifiers)
    end
    result
  end

  private

  def product_url
    'https://ml.googleapis.com/v1/'
  end

  def resource_base_url
    'projects/{{project}}/models'
  end
end
