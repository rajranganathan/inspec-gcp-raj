---
title: About the google_logging_organization_log_sinks resource
platform: gcp
---

## Syntax
A `google_logging_organization_log_sinks` is used to test a Google OrganizationLogSink resource

## Examples
```
describe google_logging_organization_log_sinks(organization: '190694428152') do
  its('names') { should include 'inspec-gcp-org-sink' }
end
```

## Properties
Properties that can be accessed from the `google_logging_organization_log_sinks` resource:

See [google_logging_organization_log_sink.md](google_logging_organization_log_sink.md) for more detailed information
  * `organizations`: an array of `google_logging_organization_log_sink` organization
  * `names`: an array of `google_logging_organization_log_sink` name
  * `filters`: an array of `google_logging_organization_log_sink` filter
  * `destinations`: an array of `google_logging_organization_log_sink` destination
  * `writer_identities`: an array of `google_logging_organization_log_sink` writer_identity
  * `include_children`: an array of `google_logging_organization_log_sink` include_children

## Filter Criteria
This resource supports all of the above properties as filter criteria, which can be used
with `where` as a block or a method.

## GCP Permissions

Ensure the [Stackdriver Logging API](https://console.cloud.google.com/apis/library/logging.googleapis.com/) is enabled for the current project.
