---
title: About the google_access_context_manager_service_perimeters resource
platform: gcp
---

## Syntax
A `google_access_context_manager_service_perimeters` is used to test a Google ServicePerimeter resource

## Examples
```

describe.one do
  google_access_context_manager_access_policies(org_id: '190694428152').names.each do |policy_name|
    describe google_access_context_manager_service_perimeters(policy_name: policy_name) do
      its('names') { should include 'restrict_all' }
      its('titles') { should include 'restrict_all' }
    end
  end
end
```

## Properties
Properties that can be accessed from the `google_access_context_manager_service_perimeters` resource:

See [google_access_context_manager_service_perimeter.md](google_access_context_manager_service_perimeter.md) for more detailed information
  * `titles`: an array of `google_access_context_manager_service_perimeter` title
  * `descriptions`: an array of `google_access_context_manager_service_perimeter` description
  * `create_times`: an array of `google_access_context_manager_service_perimeter` create_time
  * `update_times`: an array of `google_access_context_manager_service_perimeter` update_time
  * `perimeter_types`: an array of `google_access_context_manager_service_perimeter` perimeter_type
  * `statuses`: an array of `google_access_context_manager_service_perimeter` status
  * `specs`: an array of `google_access_context_manager_service_perimeter` spec
  * `use_explicit_dry_run_specs`: an array of `google_access_context_manager_service_perimeter` use_explicit_dry_run_spec
  * `parents`: an array of `google_access_context_manager_service_perimeter` parent
  * `names`: an array of `google_access_context_manager_service_perimeter` name

## Filter Criteria
This resource supports all of the above properties as filter criteria, which can be used
with `where` as a block or a method.

## GCP Permissions
