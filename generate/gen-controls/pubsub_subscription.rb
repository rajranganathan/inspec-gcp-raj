# frozen_string_literal: true

require 'yaml'
require 'logger'

title 'Test GCP google_pubsub_subscription resource.'
# rubocop:disable Metrics/BlockLength
control 'google_pubsub_subscription-1.0' do
  impact 1.0
  title 'google_pubsub_subscription resource test'

  logger = Logger.new(STDOUT)
  logger.level = Logger::WARN
  logger.warn('Generating tests for google_pubsub_subscription')
  filters = []
  ignored_fields = []
  output_folder = ENV['OUTPUT_PATH']

  if output_folder.nil?
    output_folder = File.join(File.dirname(__FILE__), '../../generated_tests')
    logger.warn("Undefined output folder path at variable OUTPUT_PATH. Defaulting to #{File.expand_path(output_folder)}")
  end

  Dir.mkdir(output_folder) unless File.exist?(output_folder)
  template_path = File.join(File.dirname(__FILE__), '../../generated_test_template.erb')
  config_folder = ENV['CNF_PATH']
  logger.warn('Undefined configuration folder path at variable CNF_PATH. Ignoring configuration files')
  unless config_folder.nil?
    file_name = File.join(config_folder, 'google_pubsub_subscription.yaml')
    if File.file?(file_name)
      config = YAML.load_file(file_name)
      config_filters = config['filters']
      config_filters.each do
        # This is not currently implemented
        logger.warn('Filters are not currently supported, ignoring')
      end
      config_ignored = config['ignore_fields']
      ignored_fields += config_ignored
    end
  end
  project_name = ENV['GCP_PROJECT_NAME']
  raise 'Undefined project name, please set the GCP_PROJECT_NAME variable' if project_name.nil?
  plural_identifiers = [{ project: project_name }]

  all_identifiers = []
  i = 0
  plural_identifiers.each do |plural_identifier|
    plural = google_pubsub_subscriptions(plural_identifier)
    identifiers = plural.identifiers

    identifiers.each do |identifier|
      all_identifiers.push(identifier)
      resource = google_pubsub_subscription(identifier)

      unless filters.all? { |filter| filter.call(resource) }
        next
      end
      resource.dump(output_folder, template_path, i, ignored_fields)

      output = "Writing #{File.expand_path(output_folder)}/Subscription_#{i}.rb"
      describe output do
        # Prints pretty message when writing controls to files
        its('length') { should be >= 0 }
      end
      i += 1
    end
  end
end
# rubocop:enable Metrics/BlockLength
