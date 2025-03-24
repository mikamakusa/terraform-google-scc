variable "folder" {
  type    = string
  default = null
}

variable "pubsub_topic_name" {
  type    = string
  default = null
}

variable "dataset_id" {
  type    = string
  default = null
}

variable "event_threat_detection_custom_module" {
  type = list(object({
    id               = any
    config           = string
    enablement_state = string
    organization     = string
    type             = string
    display_name     = string
  }))
  default = []
}

variable "folder_custom_module" {
  type = list(object({
    id               = any
    display_name     = string
    enablement_state = string
    custom_config = list(object({
      recommendation = string
      severity       = string
      description    = string
      predicate = list(object({
        expression  = string
        title       = optional(string)
        description = optional(string)
        location    = optional(string)
      }))
      custom_output = optional(list(object({
        properties = optional(list(object({
          name = optional(string)
          value_expression = optional(list(object({
            expression  = string
            title       = optional(string)
            description = optional(string)
            location    = optional(string)
          })))
        })))
      })), [])
      resource_selector = optional(list(object({
        resource_types = list(string)
      })), [])
    }))
  }))
  default = []
}

variable "folder_notification_config" {
  type = list(object({
    id          = any
    config_id   = string
    description = optional(string)
    streaming_config = list(object({
      filter = string
    }))
  }))
  default = []
}

variable "folder_scc_big_query_export" {
  type = list(object({
    id                  = any
    big_query_export_id = string
    description         = string
    filter              = string
  }))
  default = []
}

variable "mute_config" {
  type = list(object({
    id             = any
    filter         = string
    mute_config_id = string
    parent         = string
    description    = optional(string)
    type           = optional(string)
    expiry_time    = optional(string)
  }))
  default = []
}

variable "notification_config" {
  type = list(object({
    id           = any
    config_id    = string
    organization = string
    description  = optional(string)
    streaming_config = list(object({
      filter = string
    }))
  }))
  default = []
}

variable "organization_custom_module" {
  type = list(object({
    id               = any
    display_name     = string
    enablement_state = string
    organization     = string
    custom_config = list(object({
      recommendation = string
      severity       = string
      description    = string
      predicate = list(object({
        expression  = string
        title       = optional(string)
        description = optional(string)
        location    = optional(string)
      }))
      custom_output = optional(list(object({
        properties = optional(list(object({
          name = optional(string)
          value_expression = optional(list(object({
            expression  = string
            title       = optional(string)
            description = optional(string)
            location    = optional(string)
          })))
        })))
      })), [])
      resource_selector = optional(list(object({
        resource_types = list(string)
      })), [])
    }))
  }))
  default = []
}

variable "organization_scc_big_query_export" {
  type = list(object({
    id                  = any
    big_query_export_id = string
    organization        = string
    description         = optional(string)
    filter              = optional(string)
  }))
  default = []
}

variable "project_custom_module" {
  type = list(object({
    id               = any
    display_name     = string
    enablement_state = string
    custom_config = list(object({
      recommendation = string
      severity       = string
      description    = string
      predicate = list(object({
        expression  = string
        title       = optional(string)
        description = optional(string)
        location    = optional(string)
      }))
      custom_output = optional(list(object({
        properties = optional(list(object({
          name = optional(string)
          value_expression = optional(list(object({
            expression  = string
            title       = optional(string)
            description = optional(string)
            location    = optional(string)
          })))
        })))
      })), [])
      resource_selector = optional(list(object({
        resource_types = list(string)
      })), [])
    }))
  }))
  default = []
}

variable "project_notification_config" {
  type = list(object({
    id          = any
    config_id   = string
    description = optional(string)
    project     = optional(string)
    streaming_config = list(object({
      filter = string
    }))
  }))
  default = []
}

variable "project_scc_big_query_export" {
  type = list(object({
    id                  = any
    big_query_export_id = string
    description         = optional(string)
    filter              = optional(string)
    project             = optional(string)
  }))
  default = []
}

variable "scc_source" {
  type = list(object({
    id           = any
    display_name = string
    organization = string
    description  = optional(string)
  }))
  default = []
}

variable "source_iam_binding" {
  type = list(object({
    id           = any
    members      = list(string)
    organization = string
    role         = string
    source       = string
  }))
  default = []
}
