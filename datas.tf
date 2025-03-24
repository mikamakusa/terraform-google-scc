data "google_folder" "this" {
  count  = var.folder ? 1 : 0
  folder = var.folder
}

data "google_pubsub_topic" "this" {
  count = var.pubsub_topic_name ? 1 : 0
  name  = var.pubsub_topic_name
}

data "google_bigquery_dataset" "this" {
  count      = var.dataset_id ? 1 : 0
  dataset_id = var.dataset_id
}