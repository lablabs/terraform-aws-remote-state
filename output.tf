output "state_account_id" {
  value = data.aws_caller_identity.provider.account_id
}

output "state_bucket_arn" {
  value = module.state_bucket.bucket_arn
}

output "state_bucket_id" {
  value = module.state_bucket.bucket_id
}

output "state_bucket_domain_name" {
  value = module.state_bucket.bucket_domain_name
}

output "state_bucket_policy" {
  value = data.aws_iam_policy_document.state_bucket_policy
}

output "state_lock_table_arn" {
  value = module.state_lock.table_arn
}

output "state_lock_table_id" {
  value = module.state_lock.table_id
}

output "state_lock_table_name" {
  value = module.state_lock.table_name
}

output "state_lock_table_stream_arn" {
  value = module.state_lock.table_stream_arn
}

output "state_lock_table_stream_label" {
  value = module.state_lock.table_stream_label
}

output "state_lock_table_hash_key" {
  value = local.dynamo_hash_key
}

output "state_sse" {
  value = var.state_sse
}

output "state_kms" {
  value = local.bucket_kms_key
}

output "state_kms_policy" {
  value = data.aws_iam_policy_document.state_kms_policy
}
