Windows base case

This is a template for issues in AWS and Windows. Starting with windows and AWS is non-trivial if you want to be able to RDP in and have it return the windows admin password.

This is not totally done - I have not yet been able to RDP into these boxes.

Caveats: note that the ssh private key you use MUST be generated using linux or an older version of openssh if you're using TF before 0.13.0 due to https://github.com/hashicorp/terraform/pull/25112
