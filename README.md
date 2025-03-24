## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | ~> 1.11.0 |
| <a name="requirement_google"></a> [google](#requirement\_google) | ~> 6.20.0 |
| <a name="requirement_google-beta"></a> [google-beta](#requirement\_google-beta) | ~> 6.10.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_google"></a> [google](#provider\_google) | ~> 6.20.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [google_scc_event_threat_detection_custom_module.this](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/scc_event_threat_detection_custom_module) | resource |
| [google_scc_folder_custom_module.this](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/scc_folder_custom_module) | resource |
| [google_scc_folder_notification_config.this](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/scc_folder_notification_config) | resource |
| [google_scc_folder_scc_big_query_export.this](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/scc_folder_scc_big_query_export) | resource |
| [google_scc_mute_config.this](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/scc_mute_config) | resource |
| [google_scc_notification_config.this](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/scc_notification_config) | resource |
| [google_scc_organization_custom_module.this](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/scc_organization_custom_module) | resource |
| [google_scc_organization_scc_big_query_export.this](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/scc_organization_scc_big_query_export) | resource |
| [google_scc_project_custom_module.this](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/scc_project_custom_module) | resource |
| [google_scc_project_notification_config.this](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/scc_project_notification_config) | resource |
| [google_scc_project_scc_big_query_export.this](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/scc_project_scc_big_query_export) | resource |
| [google_scc_source.this](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/scc_source) | resource |
| [google_scc_source_iam_binding.this](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/scc_source_iam_binding) | resource |
| [google_bigquery_dataset.this](https://registry.terraform.io/providers/hashicorp/google/latest/docs/data-sources/bigquery_dataset) | data source |
| [google_folder.this](https://registry.terraform.io/providers/hashicorp/google/latest/docs/data-sources/folder) | data source |
| [google_pubsub_topic.this](https://registry.terraform.io/providers/hashicorp/google/latest/docs/data-sources/pubsub_topic) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_dataset_id"></a> [dataset\_id](#input\_dataset\_id) | n/a | `string` | `null` | no |
| <a name="input_event_threat_detection_custom_module"></a> [event\_threat\_detection\_custom\_module](#input\_event\_threat\_detection\_custom\_module) | n/a | <pre>list(object({<br/>    id               = any<br/>    config           = string<br/>    enablement_state = string<br/>    organization     = string<br/>    type             = string<br/>    display_name     = string<br/>  }))</pre> | `[]` | no |
| <a name="input_folder"></a> [folder](#input\_folder) | n/a | `string` | `null` | no |
| <a name="input_folder_custom_module"></a> [folder\_custom\_module](#input\_folder\_custom\_module) | n/a | <pre>list(object({<br/>    id               = any<br/>    display_name     = string<br/>    enablement_state = string<br/>    custom_config = list(object({<br/>      recommendation = string<br/>      severity       = string<br/>      description    = string<br/>      predicate = list(object({<br/>        expression  = string<br/>        title       = optional(string)<br/>        description = optional(string)<br/>        location    = optional(string)<br/>      }))<br/>      custom_output = optional(list(object({<br/>        properties = optional(list(object({<br/>          name = optional(string)<br/>          value_expression = optional(list(object({<br/>            expression  = string<br/>            title       = optional(string)<br/>            description = optional(string)<br/>            location    = optional(string)<br/>          })))<br/>        })))<br/>      })), [])<br/>      resource_selector = optional(list(object({<br/>        resource_types = list(string)<br/>      })), [])<br/>    }))<br/>  }))</pre> | `[]` | no |
| <a name="input_folder_notification_config"></a> [folder\_notification\_config](#input\_folder\_notification\_config) | n/a | <pre>list(object({<br/>    id          = any<br/>    config_id   = string<br/>    description = optional(string)<br/>    streaming_config = list(object({<br/>      filter = string<br/>    }))<br/>  }))</pre> | `[]` | no |
| <a name="input_folder_scc_big_query_export"></a> [folder\_scc\_big\_query\_export](#input\_folder\_scc\_big\_query\_export) | n/a | <pre>list(object({<br/>    id                  = any<br/>    big_query_export_id = string<br/>    description         = string<br/>    filter              = string<br/>  }))</pre> | `[]` | no |
| <a name="input_mute_config"></a> [mute\_config](#input\_mute\_config) | n/a | <pre>list(object({<br/>    id             = any<br/>    filter         = string<br/>    mute_config_id = string<br/>    parent         = string<br/>    description    = optional(string)<br/>    type           = optional(string)<br/>    expiry_time    = optional(string)<br/>  }))</pre> | `[]` | no |
| <a name="input_notification_config"></a> [notification\_config](#input\_notification\_config) | n/a | <pre>list(object({<br/>    id           = any<br/>    config_id    = string<br/>    organization = string<br/>    description  = optional(string)<br/>    streaming_config = list(object({<br/>      filter = string<br/>    }))<br/>  }))</pre> | `[]` | no |
| <a name="input_organization_custom_module"></a> [organization\_custom\_module](#input\_organization\_custom\_module) | n/a | <pre>list(object({<br/>    id               = any<br/>    display_name     = string<br/>    enablement_state = string<br/>    organization     = string<br/>    custom_config = list(object({<br/>      recommendation = string<br/>      severity       = string<br/>      description    = string<br/>      predicate = list(object({<br/>        expression  = string<br/>        title       = optional(string)<br/>        description = optional(string)<br/>        location    = optional(string)<br/>      }))<br/>      custom_output = optional(list(object({<br/>        properties = optional(list(object({<br/>          name = optional(string)<br/>          value_expression = optional(list(object({<br/>            expression  = string<br/>            title       = optional(string)<br/>            description = optional(string)<br/>            location    = optional(string)<br/>          })))<br/>        })))<br/>      })), [])<br/>      resource_selector = optional(list(object({<br/>        resource_types = list(string)<br/>      })), [])<br/>    }))<br/>  }))</pre> | `[]` | no |
| <a name="input_organization_scc_big_query_export"></a> [organization\_scc\_big\_query\_export](#input\_organization\_scc\_big\_query\_export) | n/a | <pre>list(object({<br/>    id                  = any<br/>    big_query_export_id = string<br/>    organization        = string<br/>    description         = optional(string)<br/>    filter              = optional(string)<br/>  }))</pre> | `[]` | no |
| <a name="input_project_custom_module"></a> [project\_custom\_module](#input\_project\_custom\_module) | n/a | <pre>list(object({<br/>    id               = any<br/>    display_name     = string<br/>    enablement_state = string<br/>    custom_config = list(object({<br/>      recommendation = string<br/>      severity       = string<br/>      description    = string<br/>      predicate = list(object({<br/>        expression  = string<br/>        title       = optional(string)<br/>        description = optional(string)<br/>        location    = optional(string)<br/>      }))<br/>      custom_output = optional(list(object({<br/>        properties = optional(list(object({<br/>          name = optional(string)<br/>          value_expression = optional(list(object({<br/>            expression  = string<br/>            title       = optional(string)<br/>            description = optional(string)<br/>            location    = optional(string)<br/>          })))<br/>        })))<br/>      })), [])<br/>      resource_selector = optional(list(object({<br/>        resource_types = list(string)<br/>      })), [])<br/>    }))<br/>  }))</pre> | `[]` | no |
| <a name="input_project_notification_config"></a> [project\_notification\_config](#input\_project\_notification\_config) | n/a | <pre>list(object({<br/>    id          = any<br/>    config_id   = string<br/>    description = optional(string)<br/>    project     = optional(string)<br/>    streaming_config = list(object({<br/>      filter = string<br/>    }))<br/>  }))</pre> | `[]` | no |
| <a name="input_project_scc_big_query_export"></a> [project\_scc\_big\_query\_export](#input\_project\_scc\_big\_query\_export) | n/a | <pre>list(object({<br/>    id                  = any<br/>    big_query_export_id = string<br/>    description         = optional(string)<br/>    filter              = optional(string)<br/>    project             = optional(string)<br/>  }))</pre> | `[]` | no |
| <a name="input_pubsub_topic_name"></a> [pubsub\_topic\_name](#input\_pubsub\_topic\_name) | n/a | `string` | `null` | no |
| <a name="input_scc_source"></a> [scc\_source](#input\_scc\_source) | n/a | <pre>list(object({<br/>    id           = any<br/>    display_name = string<br/>    organization = string<br/>    description  = optional(string)<br/>  }))</pre> | `[]` | no |
| <a name="input_source_iam_binding"></a> [source\_iam\_binding](#input\_source\_iam\_binding) | n/a | <pre>list(object({<br/>    id           = any<br/>    members      = list(string)<br/>    organization = string<br/>    role         = string<br/>    source       = string<br/>  }))</pre> | `[]` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_instance_public_ip"></a> [instance\_public\_ip](#output\_instance\_public\_ip) | The public IP address of the EC2 instance |
