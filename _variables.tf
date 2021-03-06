# --------------------------------------------------------------------------------------------------
# Variables for alarm-baseline module.
# --------------------------------------------------------------------------------------------------


variable "enable_alarm_baseline" {
  description = "The boolean flag whether this module is enabled or not. No resources are created when set to false."
  default     = "false"
}
variable "alarm_namespace" {
  description = "The namespace in which all alarms are set up."
  default     = "CISBenchmark"
}

variable "alarm_sns_topic_name" {
  description = "The name of the SNS Topic which will be notified when any alarm is performed."
  default     = "CISAlarm"
}
variable "cloudtrail_log_group_name" {
  description = "The name of Cloudtrail log group."
  default     = "bubbletea-cloudtrail"
}
variable "tags" {
  description = "Specifies object tags key and value. This applies to all resources created by this module."
  default = {
    "Terraform" = true
  }
}
# --------------------------------------------------------------------------------------------------
# Variables for chatbot notifications.
# --------------------------------------------------------------------------------------------------
variable "org_name" {
  description = "Name for this organization"
}
variable "enable_chatbot_slack" {
  description = "If true, will create aws chatboot and integrate to slack"
  default     = "false"
}
variable "slack_channel_id" {
  description = "Sclack channel id to send budget notfication using AWS Chatbot"
  default     = ""
}
variable "slack_workspace_id" {
  description = "Sclack workspace id to send budget notfication using AWS Chatbot"
  default     = ""
}

# --------------------------------------------------------------------------------------------------
# Variables for alarm-baseline module.
# --------------------------------------------------------------------------------------------------
variable "enable_config_baseline" {
  description = "If true, will create aws config"
  default     = "false"
}
variable "config_s3_bucket_name" {
  description = "The name of the S3 bucket which will store configuration snapshots."
  default     = ""
}
variable "config_delivery_frequency" {
  description = "The frequency which AWS Config sends a snapshot into the S3 bucket."
  default     = "One_Hour"
}
variable "config_include_global_resource_types" {
  description = "Specifies whether AWS Config includes all supported types of global resources with the resources that it records."
  default     = true
}

locals {
  config_s3_bucket_name = var.config_s3_bucket_name != "" ? var.config_s3_bucket_name : "${var.org_name}-audit-config-${data.aws_region.current.name}-${data.aws_caller_identity.current.account_id}"
}
