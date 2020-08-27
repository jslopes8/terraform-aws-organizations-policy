# AWS Organizations SCP Terraform module

O codigo irá prover os seguintes recursos na AWS.
* [Organizations Policy](https://www.terraform.io/docs/providers/aws/r/organizations_policy.html)

## Usage
Example of using the module

```hcl
module "organizations_scp" {
    source = "git@github.com:jslopes8/terraform-aws-organizations-policy.git?ref=v1.1"

    name            = "SidToOverwrite"

    # Policy 
    statement    = [
        {
            sid = "SidToOverwrite"

            actions = [
                "*"
            ]
            resources   = [
                "*"
            ]
        }
    ]
}
```
Example of using the module, multiple _statement_ and condition blocks
```hcl
module "organizations_scp" {
...
    statement    = [
        {
            sid = "1"
            effect  = "Deny" 
            actions = [
                "*"
            ]
            resources   = [
                "*"
            ]
            condition   = {
                test        = "StringLike"
                variable    = "s3:prefix"
                values      = [ 
                    "home/&{aws:username}/" 
                ]
            }
        },
        {
            sid = "2"
            effect  = "Deny" 
            actions = [
                "*"
            ]
            resources   = [
                "*"
            ]
        }
    ]
}
```

Each document configuration may have one or more statement blocks, which each accept the following arguments:

- sid (Optional) - An ID for the policy statement.
- effect (Optional) - Either "Allow" or "Deny", to specify whether this statement allows or denies the given actions. The default is "Allow".
- actions (Optional) - A list of actions that this statement either allows or denies.
- not_actions (Optional) - A list of actions that this statement does not apply to.
- resources (Optional) - A list of resource ARNs that this statement applies to.
- principals (Optional) - A nested configuration block (described below) specifying a resource (or resource pattern) to which this statement applies.
- condition (Optional) - A nested configuration block (described below) that defines a further, possibly-service-specific condition that constrains whether this statement applies.


<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Variables Inputs
| Name | Description | Required | Type | Default |
| ---- | ----------- | --------- | ---- | ------- |
| name | The friendly name to assign to the policy. | yes | `string` | `""` |
| description | A description to assign to the policy. | no | `string` | `"null"` |
| type | The type of policy to create. Currently, the only valid values are SERVICE_CONTROL_POLICY (SCP) and TAG_POLICY. Defaults to SERVICE_CONTROL_POLICY | no | `string` | `"SERVICE_CONTROL_POLICY"` |
| statement | A nested configuration block (described below) configuring one statement to be included in the policy document. | yes | `any` | "`[ ]`" |

## Variable Outputs
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
| Name | Description |
| ---- | ----------- |
| id | The unique identifier (ID) of the policy. |
| arn | Amazon Resource Name (ARN) of the policy. |
