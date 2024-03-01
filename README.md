# terraform-remote-state

[<img src="https://lablabs.io/static/ll-logo.png" width=350px>](https://lablabs.io/)

We help companies build, run, deploy and scale software and infrastructure by embracing the right technologies and principles. Check out our website at <https://lablabs.io/>

---

[![Terraform validate](https://github.com/lablabs/terraform-aws-remote-state/actions/workflows/validate.yaml/badge.svg)](https://github.com/lablabs/terraform-aws-remote-state/actions/workflows/validate.yaml)
[![pre-commit](https://github.com/lablabs/terraform-aws-remote-state/actions/workflows/pre-commit.yml/badge.svg)](https://github.com/lablabs/terraform-aws-remote-state/actions/workflows/pre-commit.yml)

## Description

Terraform module to deploy resources for [Terraform S3 backend](https://developer.hashicorp.com/terraform/language/settings/backends/s3).

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.0 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | >= 2.0 |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_state_auth_kms_key"></a> [state\_auth\_kms\_key](#module\_state\_auth\_kms\_key) | cloudposse/kms-key/aws | 0.12.1 |
| <a name="module_state_bucket"></a> [state\_bucket](#module\_state\_bucket) | cloudposse/s3-bucket/aws | 3.1.2 |
| <a name="module_state_lock"></a> [state\_lock](#module\_state\_lock) | cloudposse/dynamodb/aws | 0.33.0 |
| <a name="module_this"></a> [this](#module\_this) | cloudposse/label/null | 0.25.0 |

## Resources

| Name | Type |
|------|------|
| [aws_caller_identity.provider](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/caller_identity) | data source |
| [aws_iam_policy_document.state_bucket_policy](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document) | data source |
| [aws_iam_policy_document.state_kms_policy](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document) | data source |
| [aws_iam_policy_document.state_kms_policy_root](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document) | data source |
| [aws_iam_policy_document.state_policy_root](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_additional_tag_map"></a> [additional\_tag\_map](#input\_additional\_tag\_map) | Additional tags for appending to tags\_as\_list\_of\_maps. Not added to `tags`. | `map(string)` | `{}` | no |
| <a name="input_allow_ssl_requests_only"></a> [allow\_ssl\_requests\_only](#input\_allow\_ssl\_requests\_only) | Set to `true` to require requests to use Secure Socket Layer (HTTPS/SSL). This will explicitly deny access to HTTP requests | `bool` | `false` | no |
| <a name="input_attributes"></a> [attributes](#input\_attributes) | Additional attributes (e.g. `1`) | `list(string)` | `[]` | no |
| <a name="input_context"></a> [context](#input\_context) | Single object for setting entire context at once.<br>See description of individual variables for details.<br>Leave string and numeric variables as `null` to use default value.<br>Individual variable settings (non-null) override settings in context object,<br>except for attributes, tags, and additional\_tag\_map, which are merged. | <pre>object({<br>    enabled             = bool<br>    namespace           = string<br>    environment         = string<br>    stage               = string<br>    name                = string<br>    delimiter           = string<br>    attributes          = list(string)<br>    tags                = map(string)<br>    additional_tag_map  = map(string)<br>    regex_replace_chars = string<br>    label_order         = list(string)<br>    id_length_limit     = number<br>  })</pre> | <pre>{<br>  "additional_tag_map": {},<br>  "attributes": [],<br>  "delimiter": null,<br>  "enabled": true,<br>  "environment": null,<br>  "id_length_limit": null,<br>  "label_order": [],<br>  "name": null,<br>  "namespace": null,<br>  "regex_replace_chars": null,<br>  "stage": null,<br>  "tags": {}<br>}</pre> | no |
| <a name="input_delimiter"></a> [delimiter](#input\_delimiter) | Delimiter to be used between `namespace`, `environment`, `stage`, `name` and `attributes`.<br>Defaults to `-` (hyphen). Set to `""` to use no delimiter at all. | `string` | `null` | no |
| <a name="input_dynamo_billing_mode"></a> [dynamo\_billing\_mode](#input\_dynamo\_billing\_mode) | DynamoDB Billing mode. Can be PROVISIONED or PAY\_PER\_REQUEST | `string` | `"PAY_PER_REQUEST"` | no |
| <a name="input_dynamo_min_read_capacity"></a> [dynamo\_min\_read\_capacity](#input\_dynamo\_min\_read\_capacity) | DynamoDB autoscaling min read capacity | `number` | `null` | no |
| <a name="input_dynamo_min_write_capacity"></a> [dynamo\_min\_write\_capacity](#input\_dynamo\_min\_write\_capacity) | DynamoDB autoscaling min write capacity | `number` | `null` | no |
| <a name="input_enabled"></a> [enabled](#input\_enabled) | Set to false to prevent the module from creating any resources | `bool` | `null` | no |
| <a name="input_environment"></a> [environment](#input\_environment) | Environment, e.g. 'uw2', 'us-west-2', OR 'prod', 'staging', 'dev', 'UAT' | `string` | `null` | no |
| <a name="input_id_length_limit"></a> [id\_length\_limit](#input\_id\_length\_limit) | Limit `id` to this many characters.<br>Set to `0` for unlimited length.<br>Set to `null` for default, which is `0`.<br>Does not affect `id_full`. | `number` | `null` | no |
| <a name="input_label_order"></a> [label\_order](#input\_label\_order) | The naming order of the id output and Name tag.<br>Defaults to ["namespace", "environment", "stage", "name", "attributes"].<br>You can omit any of the 5 elements, but at least one must be present. | `list(string)` | `null` | no |
| <a name="input_lock"></a> [lock](#input\_lock) | Set to false to prevent the module from creating dynamodb table for locking | `bool` | `true` | no |
| <a name="input_name"></a> [name](#input\_name) | Solution name, e.g. 'app' or 'jenkins' | `string` | `null` | no |
| <a name="input_namespace"></a> [namespace](#input\_namespace) | Namespace, which could be your organization name or abbreviation, e.g. 'eg' or 'cp' | `string` | `null` | no |
| <a name="input_regex_replace_chars"></a> [regex\_replace\_chars](#input\_regex\_replace\_chars) | Regex to replace chars with empty string in `namespace`, `environment`, `stage` and `name`.<br>If not set, `"/[^a-zA-Z0-9-]/"` is used to remove all characters other than hyphens, letters and digits. | `string` | `null` | no |
| <a name="input_stage"></a> [stage](#input\_stage) | Stage, e.g. 'prod', 'staging', 'dev', OR 'source', 'build', 'test', 'deploy', 'release' | `string` | `null` | no |
| <a name="input_state"></a> [state](#input\_state) | Set to false to prevent the module from creating s3 bucket for remote state | `bool` | `true` | no |
| <a name="input_state_kms"></a> [state\_kms](#input\_state\_kms) | The AWS KMS master key ARN used for the SSE-KMS encryption. This can only be used when you set the value of encryption as aws:kms. The default aws/s3 AWS KMS master key is used if this element is set to 'master' or 'auto' for auto generated kms or 'arn:' | `string` | `"master"` | no |
| <a name="input_state_kms_policies"></a> [state\_kms\_policies](#input\_state\_kms\_policies) | Additional policies attached to kms as list of aws\_iam\_policy\_document | `list(any)` | `[]` | no |
| <a name="input_state_policies"></a> [state\_policies](#input\_state\_policies) | Additional policies attached to bucket as list of aws\_iam\_policy\_document | `list(any)` | `[]` | no |
| <a name="input_state_sse"></a> [state\_sse](#input\_state\_sse) | Set to aws:kms to enable encryption SSE-KMS on s3 bucket for remote state | `string` | `"AES256"` | no |
| <a name="input_tags"></a> [tags](#input\_tags) | Additional tags (e.g. `map('BusinessUnit','XYZ')` | `map(string)` | `{}` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_state_account_id"></a> [state\_account\_id](#output\_state\_account\_id) | n/a |
| <a name="output_state_bucket_arn"></a> [state\_bucket\_arn](#output\_state\_bucket\_arn) | n/a |
| <a name="output_state_bucket_domain_name"></a> [state\_bucket\_domain\_name](#output\_state\_bucket\_domain\_name) | n/a |
| <a name="output_state_bucket_id"></a> [state\_bucket\_id](#output\_state\_bucket\_id) | n/a |
| <a name="output_state_bucket_policy"></a> [state\_bucket\_policy](#output\_state\_bucket\_policy) | n/a |
| <a name="output_state_kms"></a> [state\_kms](#output\_state\_kms) | n/a |
| <a name="output_state_kms_policy"></a> [state\_kms\_policy](#output\_state\_kms\_policy) | n/a |
| <a name="output_state_lock_table_arn"></a> [state\_lock\_table\_arn](#output\_state\_lock\_table\_arn) | n/a |
| <a name="output_state_lock_table_hash_key"></a> [state\_lock\_table\_hash\_key](#output\_state\_lock\_table\_hash\_key) | n/a |
| <a name="output_state_lock_table_id"></a> [state\_lock\_table\_id](#output\_state\_lock\_table\_id) | n/a |
| <a name="output_state_lock_table_name"></a> [state\_lock\_table\_name](#output\_state\_lock\_table\_name) | n/a |
| <a name="output_state_lock_table_stream_arn"></a> [state\_lock\_table\_stream\_arn](#output\_state\_lock\_table\_stream\_arn) | n/a |
| <a name="output_state_lock_table_stream_label"></a> [state\_lock\_table\_stream\_label](#output\_state\_lock\_table\_stream\_label) | n/a |
| <a name="output_state_sse"></a> [state\_sse](#output\_state\_sse) | n/a |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->

## Contributing and reporting issues

Feel free to create an issue in this repository if you have questions, suggestions or feature requests.

### Validation, linters and pull-requests

We want to provide high quality code and modules. For this reason we are using
several [pre-commit hooks](.pre-commit-config.yaml) and
[GitHub Actions workflows](.github/workflows/). A pull-request to the
main branch will trigger these validations and lints automatically. Please
check your code before you will create pull-requests. See
[pre-commit documentation](https://pre-commit.com/) and
[GitHub Actions documentation](https://docs.github.com/en/actions) for further
details.

## License

[![License](https://img.shields.io/badge/License-Apache%202.0-blue.svg)](https://opensource.org/licenses/Apache-2.0)

See [LICENSE](LICENSE) for full details.

    Licensed to the Apache Software Foundation (ASF) under one
    or more contributor license agreements.  See the NOTICE file
    distributed with this work for additional information
    regarding copyright ownership.  The ASF licenses this file
    to you under the Apache License, Version 2.0 (the
    "License"); you may not use this file except in compliance
    with the License.  You may obtain a copy of the License at

      https://www.apache.org/licenses/LICENSE-2.0

    Unless required by applicable law or agreed to in writing,
    software distributed under the License is distributed on an
    "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY
    KIND, either express or implied.  See the License for the
    specific language governing permissions and limitations
    under the License.
