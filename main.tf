resource "google_scc_event_threat_detection_custom_module" "this" {
  count            = length(var.event_threat_detection_custom_module)
  config           = lookup(var.event_threat_detection_custom_module[count.index], "config")
  enablement_state = lookup(var.event_threat_detection_custom_module[count.index], "enablement_state")
  organization     = lookup(var.event_threat_detection_custom_module[count.index], "organization")
  type             = lookup(var.event_threat_detection_custom_module[count.index], "type")
  display_name     = lookup(var.event_threat_detection_custom_module[count.index], "display_name")
}

resource "google_scc_folder_custom_module" "this" {
  count            = length(var.folder_custom_module)
  display_name     = lookup(var.folder_custom_module[count.index], "display_name")
  enablement_state = lookup(var.folder_custom_module[count.index], "enablement_state")
  folder           = data.google_folder.this.folder_id

  dynamic "custom_config" {
    for_each = lookup(var.folder_custom_module[count.index], "custom_config")
    content {
      recommendation = lookup(custom_config.value, "recommendation")
      severity       = lookup(custom_config.value, "severity")
      description    = lookup(custom_config.value, "description")

      dynamic "predicate" {
        for_each = try(lookup(custom_config.value, "predicate") == null ? [] : ["predicate"])
        content {
          expression  = lookup(predicate.value, "expression")
          title       = lookup(predicate.value, "title")
          description = lookup(predicate.value, "description")
          location    = lookup(predicate.value, "location")
        }
      }

      dynamic "custom_output" {
        for_each = try(lookup(custom_config.value, "custom_output") == null ? [] : ["custom_output"])
        content {
          dynamic "properties" {
            for_each = try(lookup(custom_output.value, "properties") == null ? [] : ["properties"])
            content {
              name = lookup(properties.value, "name")

              dynamic "value_expression" {
                for_each = try(lookup(properties.value, "value_expression") == null ? [] : ["value_expression"])
                content {
                  expression  = lookup(value_expression.value, "expression")
                  title       = lookup(value_expression.value, "title")
                  description = lookup(value_expression.value, "description")
                  location    = lookup(value_expression.value, "location")
                }
              }
            }
          }
        }
      }

      dynamic "resource_selector" {
        for_each = try(lookup(custom_config.value, "resource_selector") == null ? [] : ["resource_selector"])
        content {
          resource_types = lookup(resource_selector.value, "resource_types")
        }
      }
    }
  }
}

resource "google_scc_folder_notification_config" "this" {
  count        = length(var.folder_notification_config)
  config_id    = lookup(var.folder_notification_config[count.index], "config_id")
  folder       = data.google_folder.this.folder_id
  pubsub_topic = data.google_pubsub_topic.this.id
  description  = lookup(var.folder_notification_config[count.index], "description")

  dynamic "streaming_config" {
    for_each = lookup(var.folder_notification_config[count.index], "streamin_config")
    content {
      filter = lookup(streaming_config.value, "filter")
    }
  }
}

resource "google_scc_folder_scc_big_query_export" "this" {
  count               = length(var.folder_scc_big_query_export)
  big_query_export_id = lookup(var.folder_scc_big_query_export[count.index], "big_query_export_id")
  dataset             = data.google_bigquery_dataset.this.id
  description         = lookup(var.folder_scc_big_query_export[count.index], "description")
  filter              = lookup(var.folder_scc_big_query_export[count.index], "filter")
  folder              = data.google_folder.this.folder_id
}

resource "google_scc_mute_config" "this" {
  count          = length(var.mute_config)
  filter         = lookup(var.mute_config[count.index], "filter")
  mute_config_id = lookup(var.mute_config[count.index], "mute_config_id")
  parent         = lookup(var.mute_config[count.index], "parent")
  description    = lookup(var.mute_config[count.index], "description")
  type           = lookup(var.mute_config[count.index], "type")
  expiry_time    = lookup(var.mute_config[count.index], "expiry_time")
}

resource "google_scc_notification_config" "this" {
  count        = length(var.notification_config)
  config_id    = lookup(var.notification_config[count.index], "config_id")
  organization = lookup(var.notification_config[count.index], "organization")
  pubsub_topic = data.google_pubsub_topic.this.id
  description  = lookup(var.notification_config[count.index], "description")

  dynamic "streaming_config" {
    for_each = lookup(var.notification_config[count.index], "streaming_config")
    content {
      filter = lookup(streaming_config.value, "filter")
    }
  }
}

resource "google_scc_organization_custom_module" "this" {
  count            = length(var.organization_custom_module)
  display_name     = lookup(var.organization_custom_module[count.index], "display_name")
  enablement_state = lookup(var.organization_custom_module[count.index], "enablement_state")
  organization     = lookup(var.organization_custom_module[count.index], "organization")

  dynamic "custom_config" {
    for_each = lookup(var.organization_custom_module[count.index], "custom_config")
    content {
      recommendation = lookup(custom_config.value, "recommendation")
      severity       = lookup(custom_config.value, "severity")
      description    = lookup(custom_config.value, "description")

      dynamic "predicate" {
        for_each = try(lookup(custom_config.value, "predicate") == null ? [] : ["predicate"])
        content {
          expression  = lookup(predicate.value, "expression")
          title       = lookup(predicate.value, "title")
          description = lookup(predicate.value, "description")
          location    = lookup(predicate.value, "location")
        }
      }

      dynamic "custom_output" {
        for_each = try(lookup(custom_config.value, "custom_output") == null ? [] : ["custom_output"])
        content {
          dynamic "properties" {
            for_each = try(lookup(custom_output.value, "properties") == null ? [] : ["properties"])
            content {
              name = lookup(properties.value, "name")

              dynamic "value_expression" {
                for_each = try(lookup(properties.value, "value_expression") == null ? [] : ["value_expression"])
                content {
                  expression  = lookup(value_expression.value, "expression")
                  title       = lookup(value_expression.value, "title")
                  description = lookup(value_expression.value, "description")
                  location    = lookup(value_expression.value, "location")
                }
              }
            }
          }
        }
      }

      dynamic "resource_selector" {
        for_each = try(lookup(custom_config.value, "resource_selector") == null ? [] : ["resource_selector"])
        content {
          resource_types = lookup(resource_selector.value, "resource_types")
        }
      }
    }
  }
}

resource "google_scc_organization_scc_big_query_export" "this" {
  count               = length(var.organization_scc_big_query_export)
  big_query_export_id = lookup(var.organization_scc_big_query_export[count.index], "big_query_export_id")
  organization        = lookup(var.organization_scc_big_query_export[count.index], "organization")
  dataset             = data.google_bigquery_dataset.this.id
  description         = lookup(var.organization_scc_big_query_export[count.index], "description")
  filter              = lookup(var.organization_scc_big_query_export[count.index], "filter")
}

resource "google_scc_project_custom_module" "this" {
  count            = length(var.project_custom_module)
  display_name     = lookup(var.project_custom_module[count.index], "display_name")
  enablement_state = lookup(var.project_custom_module[count.index], "enablement_state")

  dynamic "custom_config" {
    for_each = lookup(var.project_custom_module[count.index], "custom_config")
    content {
      recommendation = lookup(custom_config.value, "recommendation")
      severity       = lookup(custom_config.value, "severity")
      description    = lookup(custom_config.value, "description")

      dynamic "predicate" {
        for_each = try(lookup(custom_config.value, "predicate") == null ? [] : ["predicate"])
        content {
          expression  = lookup(predicate.value, "expression")
          title       = lookup(predicate.value, "title")
          description = lookup(predicate.value, "description")
          location    = lookup(predicate.value, "location")
        }
      }

      dynamic "custom_output" {
        for_each = try(lookup(custom_config.value, "custom_output") == null ? [] : ["custom_output"])
        content {
          dynamic "properties" {
            for_each = try(lookup(custom_output.value, "properties") == null ? [] : ["properties"])
            content {
              name = lookup(properties.value, "name")

              dynamic "value_expression" {
                for_each = try(lookup(properties.value, "value_expression") == null ? [] : ["value_expression"])
                content {
                  expression  = lookup(value_expression.value, "expression")
                  title       = lookup(value_expression.value, "title")
                  description = lookup(value_expression.value, "description")
                  location    = lookup(value_expression.value, "location")
                }
              }
            }
          }
        }
      }

      dynamic "resource_selector" {
        for_each = try(lookup(custom_config.value, "resource_selector") == null ? [] : ["resource_selector"])
        content {
          resource_types = lookup(resource_selector.value, "resource_types")
        }
      }
    }
  }
}

resource "google_scc_project_notification_config" "this" {
  count        = length(var.project_notification_config)
  config_id    = lookup(var.project_notification_config[count.index], "config_id")
  pubsub_topic = data.google_pubsub_topic.this.id
  description  = lookup(var.project_notification_config[count.index], "description")
  project      = lookup(var.project_notification_config[count.index], "project")

  dynamic "streaming_config" {
    for_each = lookup(var.project_notification_config[count.index], "streaming_config")
    content {
      filter = lookup(streaming_config.value, "filter")
    }
  }
}

resource "google_scc_project_scc_big_query_export" "this" {
  count               = length(var.project_scc_big_query_export)
  big_query_export_id = lookup(var.project_scc_big_query_export, "big_query_export_id")
  description         = lookup(var.project_scc_big_query_export, "description")
  dataset             = data.google_bigquery_dataset.this.id
  filter              = lookup(var.project_scc_big_query_export, "filter")
  project             = lookup(var.project_scc_big_query_export, "project")
}

resource "google_scc_source" "this" {
  count        = length(var.scc_source)
  display_name = lookup(var.scc_source[count.index], "display_name")
  organization = lookup(var.scc_source[count.index], "organization")
  description  = lookup(var.scc_source[count.index], "description")
}

resource "google_scc_source_iam_binding" "this" {
  count        = length(var.source_iam_binding)
  members      = lookup(var.source_iam_binding[count.index], "members")
  organization = lookup(var.source_iam_binding[count.index], "organization")
  role         = lookup(var.source_iam_binding[count.index], "role")
  source       = lookup(var.source_iam_binding[count.index], "source")
}