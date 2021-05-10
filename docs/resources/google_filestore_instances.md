---
title: About the google_filestore_instances resource
platform: gcp
---

## Syntax
A `google_filestore_instances` is used to test a Google Instance resource


## Beta Resource
This resource has beta fields available. To retrieve these fields, include `beta: true` in the constructor for the resource

## Examples
```
describe google_filestore_instances(project: 'chef-gcp-inspec', zone: 'us-central1-b') do
  its('tiers') { should include 'PREMIUM' }
end
```

## Properties
Properties that can be accessed from the `google_filestore_instances` resource:

See [google_filestore_instance.md](google_filestore_instance.md) for more detailed information
  * `names`: an array of `google_filestore_instance` name
  * `descriptions`: an array of `google_filestore_instance` description
  * `create_times`: an array of `google_filestore_instance` create_time
  * `tiers`: an array of `google_filestore_instance` tier
  * `labels`: an array of `google_filestore_instance` labels
  * `file_shares`: an array of `google_filestore_instance` file_shares
  * `networks`: an array of `google_filestore_instance` networks
  * `etags`: an array of `google_filestore_instance` etag
  * `zones`: an array of `google_filestore_instance` zone

## Filter Criteria
This resource supports all of the above properties as filter criteria, which can be used
with `where` as a block or a method.

## GCP Permissions
