Customer escalation

Description: this issue occurs during the 0.12.29 -> 0.13.x upgrade path

How to see the failure when upgrading 0.12 to 0.13: `run-upgrade-failure-mode.sh`
How to see it work just on 0.13: `bash run-works-on-013-success.sh`

State: confirmed

Result:
```
aws_launch_configuration.as_conf: Refreshing state... [id=cust-launch_config--20200922151656712000000001]
aws_autoscaling_group.bar: Refreshing state... [id=cust-asg--20200922151657957300000002]
aws_launch_configuration.as_conf: Destroying... [id=cust-launch_config--20200922151656712000000001]
aws_launch_template.foo: Creating...
aws_launch_template.foo: Creation complete after 2s [id=lt-060e84d13d2ac7260]
aws_launch_configuration.as_conf: Still destroying... [id=cust-launch_config--20200922151656712000000001, 10s elapsed]
aws_launch_configuration.as_conf: Still destroying... [id=cust-launch_config--20200922151656712000000001, 20s elapsed]
aws_launch_configuration.as_conf: Still destroying... [id=cust-launch_config--20200922151656712000000001, 30s elapsed]
aws_launch_configuration.as_conf: Still destroying... [id=cust-launch_config--20200922151656712000000001, 40s elapsed]
aws_launch_configuration.as_conf: Still destroying... [id=cust-launch_config--20200922151656712000000001, 50s elapsed]

Error: error deleting Autoscaling Launch Configuration (cust-launch_config--20200922151656712000000001): ResourceInUse: Cannot delete launch configuration cust-launch_config--20200922151656712000000001 because it is attached to AutoScalingGroup cust-asg--20200922151657957300000002
        status code: 400, request id: bcb2030c-f5da-44b5-87a2-be7c1b8f1f2b
```

