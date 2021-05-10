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
module GoogleInSpec
  module Compute
    module Property
      class InstanceShieldedInstanceConfig
        attr_reader :enable_secure_boot

        attr_reader :enable_vtpm

        attr_reader :enable_integrity_monitoring

        def initialize(args = nil, parent_identifier = nil)
          return if args.nil?
          @parent_identifier = parent_identifier
          @enable_secure_boot = args['enableSecureBoot']
          @enable_vtpm = args['enableVtpm']
          @enable_integrity_monitoring = args['enableIntegrityMonitoring']
        end

        def to_s
          "#{@parent_identifier} InstanceShieldedInstanceConfig"
        end
      end
    end
  end
end
