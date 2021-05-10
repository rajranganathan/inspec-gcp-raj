---
title: About the google_kms_key_ring_iam_binding resource
platform: gcp
---

## Syntax
A `google_kms_key_ring_iam_binding` is used to test a Google KeyRing Iam Bindings

## Examples
```
describe google_kms_key_ring_iam_binding(project: "project", location: "location", key_ring_name: "key_ring_name", role: "roles/editor") do
  it { should exist }
  its('members') { should include 'user:testuser@example.com' }
end
```


## Properties
Properties that can be accessed from the `google_kms_key_ring_iam_binding` resource:

  * `role`: Role that is assigned to members. For example, roles/viewer, roles/editor, or roles/owner.

  * `members`: Specifies the identities requesting access for a Cloud Platform resource.


## GCP Permissions

Ensure the [Cloud Key Management Service (KMS) API](https://console.cloud.google.com/apis/library/cloudkms.googleapis.com/) is enabled for the current project.
