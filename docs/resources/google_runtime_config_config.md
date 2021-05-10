---
title: About the google_runtime_config_config resource
platform: gcp
---

## Syntax
A `google_runtime_config_config` is used to test a Google Config resource

## Examples
```
describe google_runtime_config_config(project: 'chef-gcp-inspec', name: 'inspec-gcp-runtime-config') do
  it { should exist }
  its('description') { should cmp 'My runtime configurations' }
end

describe google_runtime_config_config(project: 'chef-gcp-inspec', name: 'nonexistent') do
  it { should_not exist }
end
```

## Properties
Properties that can be accessed from the `google_runtime_config_config` resource:


  * `description`: The description to associate with the runtime config.

  * `name`: The name of the runtime config.


## GCP Permissions

Ensure the [Cloud Resource Manager API](https://console.cloud.google.com/apis/library/cloudresourcemanager.googleapis.com/) is enabled for the current project.
