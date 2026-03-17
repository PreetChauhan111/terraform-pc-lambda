# terraform-pc-lambda

Terraform module to create AWS Lambda resources.

## Usage

```hcl
module "lambda_function" {
  source = "./terraform-pc-lambda"

  function_name = "my-lambda"
  description   = "My Lambda Function"
  handler       = "index.handler"
  runtime       = "python3.12"

  source_path = "./src"

  tags = {
    Environment = "dev"
  }
}
```

## Examples

- [Complete Lambda Function](https://github.com/terraform-aws-modules/terraform-aws-lambda/tree/master/examples/complete)
- [Lambda with Function URL](https://github.com/terraform-aws-modules/terraform-aws-lambda/tree/master/examples/with-lambda-function-url)
- [Lambda Layer](https://github.com/terraform-aws-modules/terraform-aws-lambda/tree/master/examples/layer)

## Requirements

| Name | Version |
|------|---------|
| terraform | >= 1.5.7 |
| aws | >= 6.28 |

## Providers

| Name | Version |
|------|---------|
| aws | >= 6.28 |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| create | Controls whether resources should be created | `bool` | `true` | no |
| create\_function | Controls whether Lambda Function resource should be created | `bool` | `true` | no |
| create\_layer | Controls whether Lambda Layer resource should be created | `bool` | `false` | no |
| create\_role | Controls whether IAM role for Lambda Function should be created | `bool` | `true` | no |
| create\_package | Controls whether Lambda package should be created | `bool` | `true` | no |
| create\_lambda\_function\_url | Controls whether the Lambda Function URL resource should be created | `bool` | `false` | no |
| function\_name | A unique name for your Lambda Function | `string` | `""` | no |
| handler | Lambda Function entrypoint in your code | `string` | `""` | no |
| runtime | Lambda Function runtime | `string` | `""` | no |
| description | Description of your Lambda Function (or Layer) | `string` | `""` | no |
| memory\_size | Amount of memory in MB your Lambda Function can use at runtime | `number` | `128` | no |
| timeout | The amount of time your Lambda Function has to run in seconds | `number` | `3` | no |
| publish | Whether to publish creation/change as new Lambda Function Version | `bool` | `false` | no |
| reserved\_concurrent\_executions | The amount of reserved concurrent executions for this Lambda Function | `number` | `-1` | no |
| layers | List of Lambda Layer Version ARNs (maximum of 5) to attach to your Lambda Function | `list(string)` | `null` | no |
| architectures | Instruction set architecture for your Lambda function. Valid values are `["x86_64"]` and `["arm64"]` | `list(string)` | `null` | no |
| environment\_variables | A map that defines environment variables for the Lambda Function | `map(string)` | `{}` | no |
| tracing\_mode | Tracing mode of the Lambda Function. Valid value can be either `PassThrough` or `Active` | `string` | `null` | no |
| vpc\_subnet\_ids | List of subnet ids when Lambda Function should run in the VPC | `list(string)` | `null` | no |
| vpc\_security\_group\_ids | List of security group ids when Lambda Function should run in the VPC | `list(string)` | `null` | no |
| kms\_key\_arn | The ARN of KMS key to use by your Lambda Function | `string` | `null` | no |
| dead\_letter\_target\_arn | The ARN of an SNS topic or SQS queue to notify when an invocation fails | `string` | `null` | no |
| lambda\_role | IAM role ARN attached to the Lambda Function | `string` | `""` | no |
| role\_name | Name of IAM role to use for Lambda Function | `string` | `null` | no |
| role\_permissions\_boundary | The ARN of the policy used to set the permissions boundary for the IAM role | `string` | `null` | no |
| attach\_cloudwatch\_logs\_policy | Controls whether CloudWatch Logs policy should be added to IAM role | `bool` | `true` | no |
| attach\_network\_policy | Controls whether VPC/network policy should be added to IAM role | `bool` | `false` | no |
| attach\_tracing\_policy | Controls whether X-Ray tracing policy should be added to IAM role | `bool` | `false` | no |
| attach\_policy\_json | Controls whether policy\_json should be added to IAM role | `bool` | `false` | no |
| policy\_json | An additional policy document as JSON to attach to the Lambda Function role | `string` | `null` | no |
| policies | List of policy statements ARN to attach to Lambda Function role | `list(string)` | `[]` | no |
| source\_path | The absolute path to a local file or directory containing your Lambda source code | `any` | `null` | no |
| local\_existing\_package | The absolute path to an existing zip-file to use | `string` | `null` | no |
| s3\_existing\_package | The S3 bucket object with keys bucket, key, version pointing to an existing zip-file to use | `map(string)` | `null` | no |
| store\_on\_s3 | Whether to store produced artifacts on S3 or locally | `bool` | `false` | no |
| s3\_bucket | S3 bucket to store artifacts | `string` | `null` | no |
| package\_type | The Lambda deployment package type. Valid options: `Zip` or `Image` | `string` | `"Zip"` | no |
| image\_uri | The ECR image URI containing the function's deployment package | `string` | `null` | no |
| cloudwatch\_logs\_retention\_in\_days | Specifies the number of days you want to retain log events in the log group | `number` | `null` | no |
| cloudwatch\_logs\_kms\_key\_id | The ARN of the KMS Key to use when encrypting log data | `string` | `null` | no |
| allowed\_triggers | Map of allowed triggers to create Lambda permissions | `map(any)` | `{}` | no |
| event\_source\_mapping | Map of event source mapping | `any` | `{}` | no |
| create\_async\_event\_config | Controls whether async event configuration should be created | `bool` | `false` | no |
| maximum\_retry\_attempts | Maximum number of times to retry when the function returns an error | `number` | `null` | no |
| provisioned\_concurrent\_executions | Amount of capacity to allocate for provisioned concurrency | `number` | `-1` | no |
| snap\_start | Snap start settings for low-latency startups | `bool` | `false` | no |
| logging\_log\_format | The log format of the Lambda Function. Valid values are `JSON` or `Text` | `string` | `"Text"` | no |
| logging\_application\_log\_level | The application log level. Valid values are `TRACE`, `DEBUG`, `INFO`, `WARN`, `ERROR`, `FATAL` | `string` | `"INFO"` | no |
| tags | A map of tags to assign to resources | `map(string)` | `{}` | no |
| region | Region where the resource(s) will be managed | `string` | `null` | no |

## Outputs

| Name | Description |
|------|-------------|
| lambda\_function\_arn | The ARN of the Lambda Function |
| lambda\_function\_arn\_static | The static ARN of the Lambda Function |
| lambda\_function\_invoke\_arn | The Invoke ARN of the Lambda Function |
| lambda\_function\_name | The name of the Lambda Function |
| lambda\_function\_qualified\_arn | The ARN identifying your Lambda Function Version |
| lambda\_function\_version | Latest published version of Lambda Function |
| lambda\_function\_last\_modified | The date Lambda Function resource was last modified |
| lambda\_function\_url | The URL of the Lambda Function URL |
| lambda\_layer\_arn | The ARN of the Lambda Layer with version |
| lambda\_layer\_version | The Lambda Layer version |
| lambda\_role\_arn | The ARN of the IAM role created for the Lambda Function |
| lambda\_role\_name | The name of the IAM role created for the Lambda Function |
| lambda\_cloudwatch\_log\_group\_arn | The ARN of the Cloudwatch Log Group |
| lambda\_cloudwatch\_log\_group\_name | The name of the Cloudwatch Log Group |
| lambda\_event\_source\_mapping\_arn | The event source mapping ARN |
| local\_filename | The filename of zip archive deployed (if deployment was from local) |
| s3\_object | The map with S3 object data of zip archive deployed (if deployment was from S3) |

## Authors

Module is maintained by [Preet Chauhan](https://github.com/preet-chauhan).

## License

Apache 2 Licensed. See [LICENSE](LICENSE) for full details.
